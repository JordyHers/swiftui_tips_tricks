//
//  Prospects.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 2.12.2021.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    //In SwiftUi we can set a variable to be only used and accessible in a single class
    // using the keywords fileprivate(set)
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    //her we initiate the Provider package class then in the Landing page we need to call it	
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    let prospect1 = Prospect()



    init() {
        //This line of code actually is == storing cache memory in dart
        //using shjared preferences
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
        }
        
        }
        
        //no saved data ==> Defaults state
        prospect1.name = "Unkonwn"
        prospect1.emailAddress = "unknown@email.com"
        prospect1.isContacted = true
        people = [prospect1,].shuffled()

    }
    //In swift Ui we can set a method private. In THAT WAY the user can only access the function in
        //in this class
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded,forKey: saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}


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
    var emailAddress = "Prospects"
    var isContacted = false
}

class Prospects: ObservableObject {
    //her we initiate the Provider package class then in the Landing page we need to call it	
    @Published var people: [Prospect]
    
    //Adding options with a context menu – Hot Prospects SwiftUI Tutorial 14/16
    let prospect1 = Prospect()
    let prospect2 = Prospect()
    let prospect3 = Prospect()
    let prospect4 = Prospect()
    let prospect5 = Prospect()
    let prospect6 = Prospect()
    let prospect7 = Prospect()


    init() {
        prospect1.name = "Emily Gladys"
        prospect1.emailAddress = "emilyglads67@email.com"
        prospect1.isContacted = true
        
        prospect2.name = "Berny Ayenouet"
        prospect2.emailAddress = "bernyaye@email.com"
        prospect2.isContacted = false
        
        
        prospect3.name = "James Mavrick"
        prospect3.emailAddress = "jamesmavrick@email.com"
        prospect3.isContacted = true
        
        prospect4.name = "Carla Payton"
        prospect4.emailAddress = "carlapayton67@email.com"
        prospect4.isContacted = false
        
        prospect5.name = "Paul Hamilton"
        prospect5.emailAddress = "paulhamilton@email.com"
        prospect5.isContacted = true
        
        prospect6.name = "Andrew Baxton"
        prospect6.emailAddress = "baxtonandrew@email.com"
        prospect6.isContacted = true
        
        prospect6.name = "Billy Kane"
        prospect6.emailAddress = "billykane@email.com"
        prospect6.isContacted = false


        
        self.people = [prospect1,prospect2,prospect3,prospect4,prospect5,prospect6,prospect7].shuffled()
    }
    
}


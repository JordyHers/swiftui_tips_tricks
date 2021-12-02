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
    var isContacted = false
}

class Prospects: ObservableObject {
    //her we initiate the Provider package class then in the Landing page we need to call it	
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
    
}


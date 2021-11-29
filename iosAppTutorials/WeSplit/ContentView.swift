//
//  ContentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 26.11.2021.
//

import SwiftUI

struct ContentViewWeSplit: View {
    let students = ["Jordy","Patrick","Victor","Selena","Berny"]
    @State private var selectedStudents = "Jordy"
    
     
    var body: some View {
        NavigationView {
            Form {
                //on SwiftUi there is a Picker like a DropdownButton in Fluttter
                
                Picker("Select your student",selection: $selectedStudents) {
                    ForEach(students, id: \.self){ index in
                        Text(index)
                    }
                }
                    
                }
            }
        }
       
    }


struct  ContentViewWeSplit_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeSplit()
    }
}

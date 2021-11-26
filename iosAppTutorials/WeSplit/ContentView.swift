//
//  ContentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 26.11.2021.
//

import SwiftUI

struct ContentViewWeSplit: View {
    var body: some View {
        ///The NavigationView needs few parameters such as navigationTitle
        NavigationView {
            Form {
                ///We can use also Section to seperate the parts of the form
                Section {
                    Text("Jordy Hers")
                    Text("Jordy Hers")
                    Text("Jordy Hers")
                }
            }
            ///Make sure to attach the title to the Form and not the navigation View
            .navigationTitle("SwiftUI")
            /// We can make the title centered by calling
            .navigationBarTitleDisplayMode(.inline)
        }
    
      
    }
}

struct  ContentViewWeSplit_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeSplit()
    }
}

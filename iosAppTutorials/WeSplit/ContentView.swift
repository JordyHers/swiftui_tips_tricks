//
//  ContentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 26.11.2021.
//

import SwiftUI

struct ContentViewWeSplit: View {
    var body: some View {
        /// with swift UI we can now use Form
        /// Here is the begining of a list of Data as we can see on IOS
        Form {
            
            /// On SWIFTUI we can not have more than 10 children to fix that we need to use Group
            Group{
                Text("Jordy Hers")
                Text("Jordy Hers")
                Text("Jordy Hers")
            }
            ///We can use also Section to seperate the parts of the form
            Section {
                Text("Jordy Hers")
                Text("Jordy Hers")
                Text("Jordy Hers")
            }
            Group{
                Text("Jordy Hers")
                Text("Jordy Hers")
                Text("Jordy Hers")
                Text("Jordy Hers")
                Text("Jordy Hers")
                Text("Jordy Hers")
            }
  
        }
      
    }
}

struct  ContentViewWeSplit_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeSplit()
    }
}

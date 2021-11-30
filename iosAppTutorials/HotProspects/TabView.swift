//
//  TabView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 30.11.2021.
//

import SwiftUI

struct TabViewContent: View {
    @State private var selectedTab = 0
    var body: some View {
        
        TabView(selection: $selectedTab){
            Text("Home Page")
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag("Tab1")
            Text("Setting")
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Two")
                }
                .tag("Tab2")
        }
    }
}

struct TabViewContent_Previews: PreviewProvider {
    static var previews: some View {
        TabViewContent()
    }
}

//
//  LandingView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 2.12.2021.
//

import SwiftUI

struct LandingView: View {
//At this level we call the observable object and instantiate it once
    var prospects = Prospects()
    
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                   Image(systemName: "person.3")
                   Text("Everyone")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                   Image(systemName: "checkmark.circle")
                   Text("Contacted")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                   Image(systemName: "questionmark.diamond")
                   Text("Uncontacted")
                }
            MeView()
                .tabItem {
                   Image(systemName: "person.crop.square")
                   Text("Me")
                }
            
        }
        //In order for the children view to inherit the environmentObject we just need to add the parameter to The TABVIEW
        .environmentObject(prospects)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

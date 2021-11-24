//
//  SideBariPadOs.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 24.11.2021.
//

import SwiftUI
//1. We need to set up the SideBarView
struct SideBar: View {
    var body: some View {
   //5. Set up a list in the sideBar
        List(1..<100) { index in
            Text("Row \(index)")
            
        }.listStyle(SidebarListStyle())
    }
}
//2. We need to set up the PrimaryView
struct PrimaryView: View {
    var body: some View {
        Text("PrimaryView")
    }
}
//3. We need to set up the DetailsView
struct DetailsView: View {
    var body: some View {
        Text("DetailsView")
    }
}
struct SideBarPadOs: View {
    var body: some View {
      //4. Now we set up the NavigationView
        NavigationView {
            SideBar()
            PrimaryView()
            DetailsView()
        }
    }
}

struct SideBarPadOs_Previews: PreviewProvider {
    static var previews: some View {
        SideBarPadOs()
    }
}

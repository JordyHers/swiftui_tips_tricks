//
//  DisclosureGroup.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 24.11.2021.
//

import SwiftUI

struct DisclosureGroupView: View {
    @State private var revealDetails = false
    //The disclosureGroup is th equivalent of DropDownMenuButton
    var body: some View {
        VStack {
            DisclosureGroup("Show terms",isExpanded: $revealDetails) {
                Text("Long terms and conditions here,Long terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions hereLong terms and conditions here ")
                
                Button("Hide Again") {
                    revealDetails.toggle()
                }
            }.padding()
            Spacer()
        }
       
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}

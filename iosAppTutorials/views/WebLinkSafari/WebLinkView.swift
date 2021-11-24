//
//  WebLinkView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 24.11.2021.
//

import SwiftUI

struct WebLinkView: View {
    var body: some View {
        ScrollView {
            VStack (alignment:.center){
                //The Component is called Link
        Link("jordyhers.com",destination: URL(string:"https://www.jordyhers.com/#/")!)
                    .font(.title)
                    .foregroundColor(.indigo)
                
                //More Customization
                Link(destination: URL(string:"https://www.apple.com")!){
                    Image(systemName: "link.circle.fill")
                        .font(.largeTitle)
                }
            }.padding(.vertical,30)
        }
    }
}

struct WebLinkView_Previews: PreviewProvider {
    static var previews: some View {
        WebLinkView()
    }
}

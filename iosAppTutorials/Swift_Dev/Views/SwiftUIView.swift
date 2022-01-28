//
//  SwiftUIView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 28.01.2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            
            
            ///MAP SECTION
            //IgnoreSafeArea makes sure the map reaches the top edge
            MapView().frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            
            
            ///IMAGE SECTION
            //2. Give an Offset and Padding to adjust the image over the MapView
            CircleImageView()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            
            ///TITLE AND SUBTITLE SECTIONS
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)

                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                //the font can be directly attribuated to the HStack
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

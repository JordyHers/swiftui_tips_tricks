//
//  SwiftUIView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 28.01.2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
                .fontWeight(.bold)
         
            
            
            HStack {
                Text("Joshua National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding(.horizontal)
            
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

//
//  LandMarkRow.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 29.01.2022.
//

import SwiftUI

struct LandmarkRow: View {
    
    ///1.Add landmark as a stored property of LandmarkRow.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                         .resizable()
                         .frame(width: 50, height: 50)
                     Text(landmark.name)
                     Spacer()
        }
        .padding(.horizontal)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

//https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

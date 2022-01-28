//
//  LandMarkRow.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 29.01.2022.
//

import SwiftUI

struct LandMarkRow: View {
    
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
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandMarkRow(landmark: landmarks[0])
            LandMarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
       
    }
}

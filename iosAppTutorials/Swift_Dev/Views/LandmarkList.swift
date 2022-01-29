//
//  LandmarkList.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 29.01.2022.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationView {
            List(landmarks) { landmark in
            
     NavigationLink {
                LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
               }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

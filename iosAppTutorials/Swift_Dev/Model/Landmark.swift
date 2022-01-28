//
//  Landmark.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 29.01.2022.
//

import Foundation
import SwiftUI
import CoreLocation

    //1.Adding Codable conformance makes it easier to move data between the structure and a data file.
struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    //2.Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.
    private var coordinates: Coordinates
    
    var getLocationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
    
    
    //Create the Coordinates model
     struct Coordinates: Hashable, Codable {
         var latitude: Double
         var longitude: Double
     }

}

//
//  5:16-HotProspects.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 1.12.2021.
//

import SwiftUI

struct ImageHotProspects: View {
    var body: some View {
        Image("car")
            //This section teaches us about image interpolation
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ImageHotProspects_Previews: PreviewProvider {
    static var previews: some View {
        ImageHotProspects()
    }
}

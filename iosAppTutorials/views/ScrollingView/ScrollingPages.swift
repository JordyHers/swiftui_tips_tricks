//
//  ScrollingPages.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 21.11.2021.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        Text("Home Page")
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity )
            .background(Color.black)
    }
}

struct SecondPage: View {
    var body: some View {
        Text("Second Page")
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity )
            .background(Color.white)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

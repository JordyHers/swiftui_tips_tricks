//
//  ContentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 26.11.2021.
//

import SwiftUI

struct ContentViewWeSplit: View {
  @State private var tapCount = 0
    
    
    var body: some View {
        
        Button("Tap count: \(tapCount)") {
            tapCount += 10
        }
      
    }
}

struct  ContentViewWeSplit_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeSplit()
    }
}

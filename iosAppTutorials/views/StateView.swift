//
//  StateView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 25.11.2021.
//

import SwiftUI


struct StateView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        
        VStack {
        
            Toggle(isOn: $isOn) {
                Text("")
            }.labelsHidden()
        
            Text(self.isOn ? "🌞" : "🌙").font(.custom("Arial", size: 100))
            
        }.frame(width: 800, height: 800)
        .background(self.isOn ? Color.white : Color.black)
        
    }
}

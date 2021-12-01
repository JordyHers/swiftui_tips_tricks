//
//  ContextMenu.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 1.12.2021.
//

import SwiftUI

struct ContextMenu: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Image("car")
                //This section teaches us about image interpolation
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .background(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            Text("Change Color")
                .padding()
            //The context Menu is a popup window linked to a window
                .contextMenu {
                    Button(action: {
                        self.backgroundColor = .white
                    }) {
                        Text("Default")
                    }
                    Button(action: {
                        self.backgroundColor = .red
                    }) {
                        Text("Red")
                        Image(systemName: "checkmark.circle")
                            .background(Color.red)
                    }
                    Button(action: {
                        self.backgroundColor = .black
                    }) {
                        Text("Black")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        self.backgroundColor = .green
                    }) {
                        Text("Green")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                    Button(action: {
                        self.backgroundColor = .blue
                    }) {
                        Text("Blue")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
        }
        
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}

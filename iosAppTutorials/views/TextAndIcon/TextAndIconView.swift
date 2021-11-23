//
//  TextAndIconView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 23.11.2021.
//

import SwiftUI

struct TextAndIconView: View {
    var body: some View {
        VStack {
            //1.First possibility that we have to align text and icon
           Label("Your account",systemImage: "person.crop.circle")
                .font(.title)
            
            //2. Second possibility to add text and icon side by side
            Label {
                Text("Jordy Hers")
                    .foregroundColor(.secondary)
                    .font(.title)
                    .padding(.all,15)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .fill(Color.indigo)
                    .frame(width: 34,height:34)
            }
        }
    }
}

struct TextAndIconView_Previews: PreviewProvider {
    static var previews: some View {
        TextAndIconView()
    }
}

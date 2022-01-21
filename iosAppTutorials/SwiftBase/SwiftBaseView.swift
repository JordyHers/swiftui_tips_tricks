//
//  SwiftBaseView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 9.01.2022.
//

import SwiftUI

struct SwiftBaseView: View {
    var body: some View {
        NavigationView {
            VStack {
                Label("HomePage",systemImage: "person")
                Spacer()
            }
        }
    }
}

struct SwiftBaseView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftBaseView()
    }
}

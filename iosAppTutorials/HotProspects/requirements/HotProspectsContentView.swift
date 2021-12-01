//
//  ContentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 30.11.2021.
//

import SwiftUI

///EXAMPLE CLASS
class User: ObservableObject {
    ///This class is writter as ChangeNotifierProvider in Flutter
    ///In Swift the Published value is accessible anywhere like String get value => _value ; In flutter
    @Published var name = "Jordy Hershel"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}


struct HotProspectsContentView: View {
    let user = User()
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }.environmentObject(user)
        
    }
}

struct HotProspectsContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotProspectsContentView()
    }
}

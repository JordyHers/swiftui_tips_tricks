//
//  TabView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 30.11.2021.
//

import SwiftUI

enum NetworkError: Error {
    case badURL ,requestFailed ,unknown
}

struct TabViewContent: View {
    @State private var selectedTab = 0
    var body: some View {
        
        TabView(selection: $selectedTab){
            Text("Home Page")
                .onAppear() {
                    self.fetchData(from: "https://jordyhers.com") {result in
                        switch result {
                        case .success(let str):
                            print(str)
                            
                        case .failure(let error ):
                            switch error {
                            case .badURL:
                                print("Bad URL...")
                                
                            case .requestFailed:
                                print("Request Failed ...")
                            case .unknown:
                                print("Unknown Error ")
                            }
                    }
                    }
                }
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag("Tab1")
            PublishingObservableObject()
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Two")
                }
                .tag("Tab2")
        }
    }
    
    ///@escaping is used to differ a function as in Flutter future main void
    func fetchData(from urlString: String, completion:
    @escaping (Result<String,NetworkError>)->Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data , response , error in
            DispatchQueue.main.async {
                if let data = data {
                    let stringData = String(decoding: data , as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.unknown))
                }
            }
            
        }.resume()
     
    }
}

struct TabViewContent_Previews: PreviewProvider {
    static var previews: some View {
        TabViewContent()
    }
}

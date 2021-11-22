//
//  ExpandingListView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 22.11.2021.
//

import SwiftUI
//1. Create a struct of type Identifiable

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    //2. It must be th esame type as the struct [Identifiable   ]
    var items: [Bookmark]?
}

struct ExpandingListView: View {
    //3.create the items
    let items: [Bookmark] = [.example1,.example2,.example3]
    var body: some View {
        List(items,children: \.items ){index in
            Image(systemName: index.icon)
            Text(index.name)
        }
    }
}

struct ExpandingListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingListView()
    }
}

extension Bookmark {
    //some example websites
    static let apple = Bookmark(name:"Apple",icon: "1.circle")
    static let bbc = Bookmark(name:"BBC",icon: "square.and.pencil")
    static let swift = Bookmark(name:"Swift",icon: "bolt.fill")
    static let twitter = Bookmark(name:"Twitter",icon: "mic")
    static let jordyhers = Bookmark(name:"Jordyhers",icon: "person")
    
    
    static let example1 = Bookmark(name:"Favorites",icon: "star",items: [Bookmark.apple,Bookmark.bbc,Bookmark.swift,Bookmark.jordyhers,Bookmark.twitter])
    static let example2 = Bookmark(name:"Recent",icon: "timer",items: [Bookmark.apple,Bookmark.jordyhers,Bookmark.twitter])
    static let example3 = Bookmark(name:"Recommended",icon: "hand.thumbsup",items: [Bookmark.swift,Bookmark.jordyhers,Bookmark.twitter])
    
}

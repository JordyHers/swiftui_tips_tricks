//
//  LazyVstack.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 22.11.2021.
//

import SwiftUI
struct SampleRow :View {
    let id: Int
    
    var body: some View {
        Text("Row \(id)")
    }
    init (id:Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

struct LazyVstack: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...1000, id: \.self, content: SampleRow.init)
            }
        }
    }
}

struct LazyVstack_Previews: PreviewProvider {
    static var previews: some View {
        LazyVstack()
    }
}

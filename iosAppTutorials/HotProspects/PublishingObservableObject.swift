//
//  PublishingObservableObject.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 1.12.2021.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    //This Published property is necessary to refresh the UI continually
    ///@Published var value = 0
    
    //Another possibility will be to set it manually
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    ///This function is similar to @override initState in flutter
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}
struct PublishingObservableObject: View {
    @ObservedObject var updater = DelayedUpdater()
    var body: some View {
        Text("Value is : \(updater.value)")
    }
}

struct PublishingObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        PublishingObservableObject()
    }
}

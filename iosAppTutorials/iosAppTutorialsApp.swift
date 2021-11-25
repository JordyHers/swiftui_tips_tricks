//
//  iosAppTutorialsApp.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 21.11.2021.
//
//
//import SwiftUI
//
//@main
//struct iosAppTutorialsApp: App {
//    var body: some Scene {
//        WindowGroup {
//            SideBarPadOs()
//
//        }
//    }
//}
import SwiftUI

@main
struct iosAppTutorialsApp: App {
    var body: some Scene {
        //4. Change the WindowGroup to DocumentGroup
        DocumentGroup (newDocument: TextFile()) {file in
            FileDocumentView(document: file.$document)
            
        }
    }
}

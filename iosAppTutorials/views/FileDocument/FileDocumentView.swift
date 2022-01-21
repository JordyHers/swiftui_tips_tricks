//
//  FileDocumentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 25.11.2021.


// SwiftUi allows the user to create an app that can create, save and Share PDF documents
//or even text documnents

///1. import UniformTypeIdentifiers
import SwiftUI
import UniformTypeIdentifiers

///2. Create the struct TextFile and extend it using FileDocument protocol
///This function takes care of the logic of saving and then writing the written plain text.
struct TextFile: FileDocument {
    
    ///3. set up the type of the document
    var text: String

       init(text: String = "This is a brand new document! 📃") {
           self.text = text
       }

       // A
    static var readableContentTypes: [UTType] { [UTType.plainText] }

       // B
       init(configuration: ReadConfiguration) throws {
           guard let data = configuration.file.regularFileContents,
               let string = String(data: data, encoding: .utf8)
           else {
               throw CocoaError(.fileReadCorruptFile)
           }
           text = string
       }

       // C
       func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
           let data = text.data(using: .utf8)!
           return .init(regularFileWithContents: data)
       }
}


struct FileDocumentView: View {
    @Binding var document: TextFile
    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct FileDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        FileDocumentView(document: .constant(TextFile()))
    }
}

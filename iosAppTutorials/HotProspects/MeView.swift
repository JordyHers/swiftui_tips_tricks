//
//  MeView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 2.12.2021.
//


//SWIFTUI allows us to create and generate QR codes
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@site.com"
    @State private var qrCode = UIImage()
    
    
    //Then we call two classes context and filter
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name",text: $name)
                    .textContentType(.name)
                    .font(.title)
                    .padding(.horizontal)
                
                
                TextField("Email Address",text: $emailAddress)
                    .textContentType(.name)
                    .font(.title)
                    .padding([.horizontal,.bottom])
                Image(uiImage: qrCode)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width:200, height:200)
                    .contextMenu {
                        Button {
                            //save my code
                            let imageSaver = ImageSaver()
                            imageSaver.writeToPhotoAlbum(image: qrCode)
                        } label: {
                           Label("Save to Photos", systemImage: "square.and.arrow.down")
                        }
                    }
                Spacer()
            }
            .navigationBarTitle("Your code")
            .onAppear(perform: updateCode)
            .onChange(of: name) { _ in updateCode() }
            .onChange(of: emailAddress) { _ in updateCode() }
        }
    }
    func updateCode() {
        qrCode = generateQrCode(from: "\(name)\n\(emailAddress)")
    }
    
    //This function takes care of creating the QRCode image
    func generateQrCode (from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}

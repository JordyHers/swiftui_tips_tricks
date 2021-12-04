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
    
    
    //Then we call two classes context and filter
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name",text: $name)
                    .textContentType(.name)
                    .font(.title)
                    .padding(.horizontal)
                
                
                TextField("Email Address",text: $emailAddress)
                    .textContentType(.name)
                    .font(.title)
                    .padding([.horizontal,.bottom])
                Image(uiImage: generateQrCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200, height:200)
                Spacer()
            }
            .navigationBarTitle("Your code")
        }
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

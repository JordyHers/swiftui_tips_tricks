//
//  ColorPickerView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 22.11.2021.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var bgColor = Color.white
    
    var body: some View {
        ColorPicker("Set the background color", selection: $bgColor).frame(height:200).padding(.horizontal)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}

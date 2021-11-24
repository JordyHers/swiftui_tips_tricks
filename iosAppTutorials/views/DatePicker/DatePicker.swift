//
//  DatePicker.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 24.11.2021.
//

import SwiftUI

struct DatePickerView: View {
    @State private var date = Date()
    
    var body: some View {
        //1.We create the datepicker we have to set labelsHidden() to hide the title
        VStack {
            Text("Enter your birthday").font(.title)
            DatePicker("Enter your birthday",selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .frame(maxHeight:400)
        }
        
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

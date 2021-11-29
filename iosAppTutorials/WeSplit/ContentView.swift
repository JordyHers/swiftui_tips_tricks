//
//  ContentView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 26.11.2021.
//

import SwiftUI

struct ContentViewWeSplit: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
     let tipPercentages = [0,5,10,15,20,25]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ///Here Locale is a struct build in SwiftUI that gives us access to locale types of data
                    TextField("Amount",value: $checkAmount,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    ///Set up a picker to get the number of people
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                        //The segmented view gives a better vier in HStack and slidable view
                    }.pickerStyle(.segmented)
                } header: {
                    ///Multiple section allows us to give parameters to the component such as header
                    Text("How much tip do you want to leave ?   ")

                }
                
                Section {
                    ///Here Locale is a struct build in SwiftUI that gives us access to locale types of data
                    Text(checkAmount,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }.navigationTitle("Tipsy")
               
        }
       
    }


struct  ContentViewWeSplit_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeSplit()
    }
}
}

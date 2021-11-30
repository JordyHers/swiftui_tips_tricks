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
    ///Here the focus state variable sets up the states of the focus on the TextField. In order to dismiss the keyboard when
    ///it is not used.
    @FocusState private var amountIsFocused: Bool
    
     let tipPercentages = [0,5,10,15,20,25]
    
    var totalPerPerson: Double {
         ///Calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ///Here Locale is a struct build in SwiftUI that gives us access to locale types of data
                    TextField("Amount",value: $checkAmount,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                
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
                    Text(totalPerPerson,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }
            .navigationTitle("Tipsy")
             .toolbar {
                 //The toolbar is a new feature to SwiftUI / Inside we need to provide a
                 //ToolbarItemGroup. Inside I provide the location of my toolbar
                 ToolbarItemGroup(placement: .keyboard) {
                     Spacer() 
                     Button("Done") {
                         amountIsFocused = false
                     }
                 }
                }
        }
       
    }


struct  ContentViewWeSplit_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeSplit()
    }
}
}

//
//  SamplePackage.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 1.12.2021.
//
import SamplePackage
import SwiftUI

struct SamplePackage: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        //this function of the code just brings up 7 random number from the array of possible number 1-60
        let selected = possibleNumbers.random(7).sorted()

        //Then the numbers are mapped using the init function
        let strings = selected.map(String.init)

        //Finally we need to return the string but seperated bt a comma
        return strings.joined(separator: ", ")
    }
    var body: some View {
        Text(results)
    }
}

struct SamplePackage_Previews: PreviewProvider {
    static var previews: some View {
        SamplePackage()
    }
}

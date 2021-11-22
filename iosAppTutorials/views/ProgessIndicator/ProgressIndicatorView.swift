//
//  ProgressIndicatorView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 22.11.2021.
//

import SwiftUI

struct ProgressIndicatorView: View {
    @State private var downloadAmount = 0.0
    @State private var isFinished :Bool = false
    var body: some View {
        
        //1. ProgressView() just shows the spinning circle
        //2. Value assigns a value for current state
        //3. total refers to the maximum value
        VStack {
            if (isFinished){
                Text("Download completed")
            }
            else{
                ProgressView("Loading",value: downloadAmount,total: 100).padding()
            }
              
            if(!isFinished){
                Button("Increment download"){
                    if(downloadAmount<100){
                        downloadAmount+=10

                    }else {
                        isFinished.toggle()
                    }
                }
            } else {
                Text("")
            }

        }
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorView()
    }
}

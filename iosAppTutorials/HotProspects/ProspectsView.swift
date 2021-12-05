//
//  ProspectsView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 2.12.2021.
//
import CodeScanner
import SwiftUI

struct ProspectsView: View {
    
    //Here now we track if the parent struct have an environment object notice that here we write   @EnvironmentObject var Prospects: Prospects not   @EnvironmentObject var Prospects = Prospects()
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    
    //In the enum we set up the different cases
    enum FilterType {
        case none, contacted, uncontacted
     }
    
    //This is the filter variable from the ENUM
    let filter: FilterType
    
    //The title is set up according to the filterType
    var  title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
            
        }
    }
    
  
    
    
    //The filteredProspects is a list sorted using in SwiftUI [_.filter]
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted}
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted}
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading){
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                        
                    }
                    
                }
            }
                    .navigationBarTitle(title)
                    .navigationBarItems(trailing: Button(action: {
                        
                        self.isShowingScanner = true
                    }) {
                        Image(systemName: "qrcode.viewfinder")
                        Text("Scan")
                    })
                    .sheet(isPresented: $isShowingScanner) {
                        
                        //HEre the simulated data is on purpose seperated by \n
                        CodeScannerView(codeTypes: [.qr], simulatedData: "Jordy Hershel\njordyhers@email.com", completion: self.handleScan)
                    }
        }
        
    }
        func handleScan(result: Result<String, CodeScannerView.ScanError>) {
            //When the function is triggered the boolean is set to false first
            self.isShowingScanner = false
            
            //Then the result are checked: SUCCESS or FAILURE
            switch result {
                
             case .success(let code):
                //In case of SUCCESS the code inside is seperated by \n
                let details = code.components(separatedBy: "\n")
                guard details.count == 2 else { return }
                
                let person = Prospect()
                person.name = details[0]
                person.emailAddress = details[1]
                self.prospects.people.append(person)

            case .failure(let error):
                print("Sanning Failed \(error)")
            }
        }
    }


struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}

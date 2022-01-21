//
//  ProspectsView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 2.12.2021.
//
import CodeScanner
import SwiftUI
import UserNotifications

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
                        
                    } .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark as Uncontacted", systemImage: "person.crop.circle.badge.xmark ")
                              }
                            .tint(.blue)
                        }else {
                            Button {
                                prospects.toggle(prospect)

                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                              }
                            .tint(.green)
                            
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                          }
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
                        
                        //Here the simulated data is on purpose seperated by \n
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
                
                
                //Here we set up the person
                let person = Prospect()
                person.name = details[0]
                person.emailAddress = details[1]
                prospects.add(person)

            case .failure(let error):
                print("Sanning Failed \(error)")
            }
        }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        
        //By doing this we can schedule a notification request at a specific time
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var  dateComponents = DateComponents()
            dateComponents.hour = 9
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            ///______________________________ enable this part to test immediate notifications ____________________________
            //TEST DEBUG TO SEND IMMEDIATE NOTIFICATIONS
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        // more code to come
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options:  [.alert,.badge, .sound ,.criticalAlert]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
            
        }
    }
    }


struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}

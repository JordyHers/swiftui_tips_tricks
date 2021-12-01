//
//  localNotifications.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 1.12.2021.
//
import UserNotifications
import SwiftUI

struct localNotifications: View {
    var body: some View {
        VStack {
            //The first section implements the functions that requests the Notifications
            Button("Request Permission"){
                //First [.alert,.badge,.sound] represents the different aspects of the notification which brings two cases
                //Error case of Success ,
                
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) {
                    success , error in
                    if success {
                        print("All set!")
                    }else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                
            }
            
            Button("Schedule Notifications") {
                //Then the secon sections takes care of the l=notification logic
                //First we set up the content of the dialog (What message will actually appear )
                //content.sound /content.title / content.subtitle
                
            
                // Here the content is instantiated with UNMutableNotificationContent()
                let content = UNMutableNotificationContent()
                
                //This message may vary;
                content.title = "Get ready folks!"
                content.subtitle = "Everythings looks great"
                content.sound = UNNotificationSound.default
                
                //After that we setu up a trigger that will wait for 5 seconds just the time to press CMD+L to lock the screen device
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                    //Finally the request itself is created using the function  *UNNotificationRequest*
                // This function takes two parameters  _CONTENT_ and _TRIGGER_
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // At the end we need to add the created request to the current   UNUserNotificationCenter
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct localNotifications_Previews: PreviewProvider {
    static var previews: some View {
        localNotifications()
    }
}

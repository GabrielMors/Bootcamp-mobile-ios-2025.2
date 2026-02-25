//
//  MessageNotifications.swift
//  MyNotifications
//
//  Created by Vagner Reis on 18/02/26.
//

import Foundation
import Combine
import UserNotifications
import UIKit

struct MyMessage: Equatable {
    let name: String
    let age: String
    var iconName: String { "person.fill" }
    var iconAge: String { "18.circle.fill" }
    
    static let serverData: [MyMessage] =
        [
            .init(name: "Vagner", age: "39"),
            .init(name: "Guilherme", age: "30")
        ]
}

class MessageNotificationsSend {
    
    static let shared = MessageNotificationsSend()
    
    private init() {}
    
    func send() {
        
        let obj: [MyMessage] = MyMessage.serverData
        
        NotificationCenter.default.post(name: .send, object: obj, userInfo: nil)
        
    }
    
    func sendInLive() {
        
        NotificationCenter.default.post(name: .inLive, object: nil, userInfo: ["inLive": Bool.random()])
        
    }
    
}

fileprivate let scheduleIdentifier = "test"

struct LocalNotification {
    
    func removePendingNotifications(withIdentifiers identifiers: [String]) {
        UNUserNotificationCenter
            .current()
            .removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    func scheduling() {
        
        // Antes remover com o identificador
        removePendingNotifications(withIdentifiers: [
            scheduleIdentifier
        ])
        
        let content = UNMutableNotificationContent()
        content.title = "Marcelo"
        content.body = "<send photo>"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)

        let request = UNNotificationRequest(identifier: scheduleIdentifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
        
        print("scheduling")
    }
    
}

//class MessageNotificationsReceive {
//    
////    static let shared = MessageNotificationsReceive()
////    
////    private init() {}
//    
//    func receive() {
//        
//        // Exemplo com UIKIT
//        NotificationCenter.default
//            .addObserver(forName: .send, object: nil, queue: .main) { notification in
//                    if let userInfo = notification.userInfo as? [String: Any] {
//                        print("USER info", userInfo)
//                    }
//    
//                    if let object = notification.object as? [String: String] {
//                        print("object", object)
//                    }
//            }
//             
//    }
//    
//}

//
//  AppDelegate.swift
//  MyNotifications
//
//  Created by Vagner Reis on 19/02/26.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate, MessagingDelegate {
    
    private let remoteNotification = MyRemoteNotifications()
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        FirebaseApp.configure()
       
        UNUserNotificationCenter.current().delegate = self
        
        Messaging.messaging().delegate = self
       
        requestNotificationPermission()
        
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        return true
    }
    
    // Private Methods
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                debugPrint("Permissão concedida ✅")
            } else {
                debugPrint("Permissão negada ❌")
            }
        }
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM Token:", fcmToken ?? "")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        remoteNotification.whenBannerClicked(
            userInfo: response.notification.request.content.userInfo,
            completionHandler: completionHandler
        )
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        remoteNotification.whenBackground(
            userInfo: notification.request.content.userInfo,
            completionHandler: completionHandler
        )
    }
    
}


struct MyRemoteNotifications {
    
    func whenBannerClicked(
        userInfo: [AnyHashable: Any],
        completionHandler: @escaping () -> Void
    ) {
        print("Clicked (A)")
    //        print("title", response.notification.request.content.title)
    //        print("body", response.notification.request.content.body)
            guard let msgClickTela = userInfo["msgClickTela"] as? String else {
                print("N conseguiu encontrar a chave {msgClickTela}")
                return
            }
            
            NotificationCenter.default.post(name: .firebaseMSG, object: nil, userInfo: ["firebaseMSG" : msgClickTela])
            
            completionHandler()
    }
    
    func whenBackground(
        userInfo: [AnyHashable: Any],
        completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        print("Background (B)")
        guard let msgTela = userInfo["msgTela"] as? String else {
            print("N conseguiu encontrar a chave {msgTela}")
            //completionHandler([])
            return
        }
        
        NotificationCenter.default.post(name: .firebaseMSG, object: nil, userInfo: ["firebaseMSG" : msgTela])
        
        completionHandler([.banner, .sound, .badge])
    }
    
}

//dsmDj_hesUuuiihP0TTrKw:APA91bE0mTH3LB3b248z4rJOfCi3xbPCwf7u3vN-i2tevoACFrZNnorqzp6D2WmSwSLETmq_1R5GYRZHiDYVghRKfGtviGU_OE-DWsXYj6S0cgUr95un3pU

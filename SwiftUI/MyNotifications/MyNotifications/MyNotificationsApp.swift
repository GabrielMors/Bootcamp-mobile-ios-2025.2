//
//  MyNotificationsApp.swift
//  MyNotifications
//
//  Created by Vagner Reis on 18/02/26.
//

import SwiftUI

@main
struct MyNotificationsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

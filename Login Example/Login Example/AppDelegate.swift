//
//  AppDelegate.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var userLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "UserLoggedIn")
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "UserLoggedIn")
        }
    }
    
    var userOnboarded: Bool {
        get {
            UserDefaults.standard.bool(forKey: "userOnboarded")
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "userOnboarded")
        }
    }

    var credentials = (userName: "admin", password: "password")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString: String = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
    }
}

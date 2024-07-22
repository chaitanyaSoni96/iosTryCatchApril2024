//
//  ViewController.swift
//  Push Notifications Example
//
//  Created by Chaitanya Soni on 21/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerForRemoteNotification()
        NasaLocalNotificationBuilder()
                    .setCategory()
                    .setContent()
                    .build()
    }
    func registerForRemoteNotification() {
        let center  = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
            if error == nil {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

}
import UserNotifications
class NasaLocalNotificationBuilder {
    private let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
    private var notificationActions: [UNNotificationAction] = []
    private var notificationContent = UNMutableNotificationContent()
    
    
    func setCategory() -> NasaLocalNotificationBuilder {
        let notificationCategory = UNNotificationCategory(
            identifier: "myNotificationCategory",
            actions: notificationActions,
            intentIdentifiers: [],
            hiddenPreviewsBodyPlaceholder: "",
            options: .customDismissAction
        )
        notificationCenter.setNotificationCategories(
           [notificationCategory]
        )
        return self
    }
    
    func setContent() -> NasaLocalNotificationBuilder {
        notificationContent.title = "Your Nasa Daily Photo"
        notificationContent.body = "Long press to see you daily nasa photo"
        notificationContent.sound = UNNotificationSound.default
        notificationContent.categoryIdentifier = "myNotificationCategory"
        notificationContent.userInfo = [
            "title" : "At the Heart of Orion",
            "description" : """
            Near the center of this sharp cosmic portrait, at the heart of the Orion Nebula, are four hot, massive stars known as the Trapezium. Gathered within a region about 1.5 light-years in radius, they dominate the core of the dense Orion Nebula Star Cluster. Ultraviolet ionizing radiation from the Trapezium stars, mostly from the brightest star Theta-1 Orionis C powers the complex star forming region's entire visible glow. About three million years old, the Orion Nebula Cluster was even more compact in its younger years and a recent dynamical study indicates that runaway stellar collisions at an earlier age may have formed a black hole with more than 100 times the mass of the Sun. The presence of a black hole within the cluster could explain the observed high velocities of the Trapezium stars. The Orion Nebula's distance of some 1,500 light-years would make it the closest known black hole to planet Earth.
            """,
            "imageName" : "orion"
        ]
        return self
    }
    
    func build() {
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5,
            repeats: false
        )
        let request = UNNotificationRequest(
            identifier: "myNotificationCategory",
            content: notificationContent,
            trigger: trigger
        )
        notificationCenter.add(request, withCompletionHandler: nil)
    }
}

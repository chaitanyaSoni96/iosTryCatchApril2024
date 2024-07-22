//
//  NotificationViewController.swift
//  RichNotification
//
//  Created by Chaitanya Soni on 21/07/24.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("custom notification loaded")
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        print("custom notification received data")
        print(notification, notification.request, notification.request.content, notification.request.content.body)
        print(#function)
        self.label?.text = notification.request.content.body
        self.label?.textColor = .red
    }

}

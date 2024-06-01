//
//  AppFlow.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 01/06/24.
//

import UIKit

struct AppFlow {
    var window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let context = AppDelegate.shared.persistentContainer.viewContext
        let fetchRequest = SignedInUser.fetchRequest()
        
        if let signedInUsers = try? context.fetch(fetchRequest) {
            
            if signedInUsers.isEmpty {
                // no signed in user
                
                let vc = UIStoryboard(name: "LoginStoryboard", bundle: .main).instantiateInitialViewController()
                window.rootViewController = vc
                
            } else if signedInUsers.count == 1 {
                // user has signed in
                
                let vc = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController()
                window.rootViewController = vc
                
            } else {
                // some bug in app
                fatalError()
            }
        }
    }
    
}

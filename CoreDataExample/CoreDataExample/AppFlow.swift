//
//  AppFlow.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 01/06/24.
//

import UIKit
import CoreData
extension NSNotification.Name {
    static let loggedInUserChanged: NSNotification.Name = NSNotification.Name(rawValue: "loggedInUserChanged")
}
class AppFlow {
    var window: UIWindow
    init(window: UIWindow) {
        self.window = window
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(AppFlow.observeLogin(_:)),
                                               name: NSNotification.Name.loggedInUserChanged,
                                               object: nil)
        
    }
    
    @objc func observeLogin(_ notification: NSNotification) {
        
        if let username = notification.object as? String {
            
            let context = AppDelegate.shared.persistentContainer.viewContext
            let request = User.fetchRequest()
            let users = try? context.fetch(request)
            if let user = users?.first(where: { $0.username == username }) {
                
                let signedInUser = SignedInUser(context: AppDelegate.shared.persistentContainer.viewContext)
                AppDelegate.shared.saveContext()
                setHomeScreen()
            }
            
        } else {
            let fetchRequest = SignedInUser.fetchRequest()
            fetchRequest.returnsObjectsAsFaults = false
            
            if let results = try? AppDelegate.shared.persistentContainer.viewContext.fetch(fetchRequest) {
                
                results.forEach({
                    AppDelegate.shared.persistentContainer.viewContext.delete($0)
                })
            }
            AppDelegate.shared.saveContext()
            setLoginScreen()
        }
    }
    
    func start() {
        
        checkAndSetScreenForLoginState()
    }
    
    private func checkAndSetScreenForLoginState() {
        
        let context = AppDelegate.shared.persistentContainer.viewContext
        let fetchRequest = SignedInUser.fetchRequest()
        
        if let signedInUsers = try? context.fetch(fetchRequest) {
            
            if signedInUsers.isEmpty {
                
                // no signed in user
                setLoginScreen()
                
            } else if signedInUsers.count == 1 {
                
                // user has signed in
                setHomeScreen()
                
            } else {
                
                // some bug in app
                fatalError()
            }
        }
    }
    
    private func setLoginScreen() {
        
        let vc = UIStoryboard(name: "LoginStoryboard", bundle: .main).instantiateInitialViewController()
        window.rootViewController = vc
        
    }
    
    private func setHomeScreen() {
        
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController()
        window.rootViewController = vc
        
    }
}

//
//  NavigationController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        let userLoggedIn = appDelegate?.userLoggedIn ?? false
        let userOnboarded = appDelegate?.userOnboarded ?? false
        
        if userLoggedIn {
            
            self.setViewControllers([HomeViewController.instantiate()],
                                    animated: false)
            
        } else if userOnboarded {
            
            self.setViewControllers([LoginViewController.instantiate()],
                                    animated: false)
            
        } else {
            
            self.setViewControllers([CarouselViewController.instantiate()],
                                    animated: false)
        }
    }
}

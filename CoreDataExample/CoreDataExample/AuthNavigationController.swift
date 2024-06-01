//
//  AuthNavigationController.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 01/06/24.
//

import UIKit

class AuthNavigationController: UINavigationController {
    static func instantiate() -> Self {
        return UIStoryboard(name: "LoginStoryboard",
                            bundle: .main)
        .instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

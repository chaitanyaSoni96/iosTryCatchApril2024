//
//  LoginViewController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginTapped() {
        let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        if usernameTextField.text == appDelegate?.credentials.userName,
           passwordTextField.text == appDelegate?.credentials.password {
            
            appDelegate?.userLoggedIn = true
            
            self.navigationController?.pushViewController(HomeViewController.instantiate(), animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "EmailID or password doesnt match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}

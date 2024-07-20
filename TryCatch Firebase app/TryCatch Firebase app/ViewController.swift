//
//  ViewController.swift
//  TryCatch Firebase app
//
//  Created by Chaitanya Soni on 30/06/24.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController, AuthUIDelegate {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var otpTF: UITextField!
    
    var verificationID: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerForRemoteNotification()
    }

    
    
    @IBAction func submitPhoneNumberTapped(_ sender: Any) {
//        FirebaseAuth.Auth.send
        PhoneAuthProvider.provider().verifyPhoneNumber(usernameTF.text ?? "", uiDelegate: nil) { verificationID, error in
            guard let verificationID else { return }
            
            self.verificationID = verificationID
//            Auth.auth().sign
        }
    }
    
    @IBAction func submitOTPTapped(_ sender: Any) {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationID ?? "",
            verificationCode: self.otpTF.text ?? ""
        )
        Auth.auth().signIn(with: credential) { result, error in
            if error == nil {
                print(#function)
            } else {
                print(#function)
            }
            let request = Auth.auth().currentUser?.createProfileChangeRequest()
            request?.displayName = "Some"
            request?.commitChanges()
//            result?.user.updatepro
        }
        
        
        
        
    }
    
    
    
    func registerForRemoteNotification() {
        let center  = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
            if error == nil, granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

}


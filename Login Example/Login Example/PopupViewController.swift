//
//  PopupViewController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 21/04/24.
//

import Foundation
import UIKit

class PopupViewController: UIViewController, StoryboardLoadable {
    
    
    @IBOutlet weak var textView: UITextView!
    private var enteredPassword: String = ""
    var maskedPassword: String { String(repeating: "*", count: enteredPassword.count) }
    lazy var _onceMasked: String = maskedPassword
    
    let group = DispatchGroup()
    let queue = DispatchQueue(label: "myConcurentQueue", attributes: DispatchQueue.Attributes.concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
#if STAGING
        self.view.viewWithTag(999)?.backgroundColor = .black
#endif
        
        textView.delegate = self
        
        group.enter()
        queue.async {
            sleep(5)
            print("1")
            self.group.leave()
        }
        
        group.enter()
        queue.async {
            print("2")
            self.group.leave()
        }
        
        group.enter()
        queue.async {
            print("3")
            self.group.leave()
        }
        
        group.enter()
        queue.async {
            print("4")
            self.group.leave()
        }
        
        group.enter()
        queue.async {
            print("5")
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print("all done")
        }
        
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
}

extension PopupViewController: UITextViewDelegate {
    
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        
        (enteredPassword as NSString).replacingCharacters(in: range, with: text)
        
        
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        textView.text = String(repeating: "*", count: enteredPassword.count)
    }
}

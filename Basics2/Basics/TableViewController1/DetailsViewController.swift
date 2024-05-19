//
//  DetailsViewController.swift
//  Basics
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit



class DetailsViewController: UIViewController {
    static func instantiate(data: String?) -> DetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.data = data
        
        return vc
    }
    @IBOutlet weak var label: UILabel!
    
    var data: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController.
        self.label.text = data
        
    }
    @IBAction func backTapped(_ sender: Any) {
        
        if let navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
}

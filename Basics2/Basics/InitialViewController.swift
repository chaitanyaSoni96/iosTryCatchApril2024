//
//  InitialViewController.swift
//  Basics
//
//  Created by Chaitanya Soni on 14/04/24.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func tableViewAndAPICallsButtonTapped() {
        let vc = TableViewController1.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonTapped(_ sender: UIButton, forEvent event: UIEvent) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            
            vc.userDetails = UserDetails(name: "Rahul",
                                         educationDetails: EducationDetails(startedYear: "2013",
                                                                            degree: "Bsc IT"))
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destination = segue.destination as? ViewController {
            destination.userDetails = UserDetails(name: "Rahul",
                                                  educationDetails: EducationDetails(startedYear: "2013",
                                                                                     degree: "Bsc IT"))
        }
        print(segue)
    }
}

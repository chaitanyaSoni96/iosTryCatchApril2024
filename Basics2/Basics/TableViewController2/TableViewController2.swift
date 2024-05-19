//
//  TableViewController2.swift
//  Basics
//
//  Created by Chaitanya Soni on 14/04/24.
//

import Foundation
import UIKit

class TableViewController2: UITableViewController {
    static func instantiate() -> TableViewController2 {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController2") as! TableViewController2
        
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
}

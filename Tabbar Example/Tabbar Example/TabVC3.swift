//
//  TabVC3.swift
//  Tabbar Example
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit

class TabVC3: UIViewController {
    static func instantiate() -> TabVC3 {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabVC3") as! TabVC3
        return vc
    }
}

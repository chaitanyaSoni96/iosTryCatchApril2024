//
//  TabVC2.swift
//  Tabbar Example
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit

class TabVC2: UIViewController {
    static func instantiate() -> TabVC2 {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabVC2") as! TabVC2
        return vc
    }
}

//
//  RightViewController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/07/24.
//

import UIKit

class RightViewController: UIViewController {
    static func instantiate() -> RightViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "RightViewController") as! RightViewController
        return vc
    }
}

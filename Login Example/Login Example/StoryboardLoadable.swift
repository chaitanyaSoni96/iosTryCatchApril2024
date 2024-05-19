//
//  StoryboardLoadable.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import Foundation
import UIKit

protocol StoryboardLoadable: UIViewController {
    static func instantiate() -> Self
}
extension StoryboardLoadable {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
        return vc
    }
}

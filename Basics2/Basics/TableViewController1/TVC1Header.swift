//
//  TVC1Header.swift
//  Basics
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit

class TVC1Header: NibView {
    class func instanceFromNib() -> TVC1Header {
        return UINib(nibName: "TVC1Header", bundle: .main).instantiate(withOwner: nil, options: nil)[0] as! TVC1Header
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    
}

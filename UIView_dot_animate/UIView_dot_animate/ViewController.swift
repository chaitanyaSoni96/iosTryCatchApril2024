//
//  ViewController.swift
//  UIView_dot_animate
//
//  Created by Chaitanya Soni on 15/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var boxViewCenterX: NSLayoutConstraint!
    @IBOutlet weak var boxViewCenterY: NSLayoutConstraint!
    
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        animateBox()
        
        
        
    }

    func animateBox() {
        
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: self.flag ? .curveEaseOut : .curveEaseIn,
                       animations: {
            
            self.boxViewCenterY.constant = self.flag ? 10 : -10
            self.boxViewCenterX.constant = self.flag ? 10 : -10
            self.view.layoutIfNeeded()
            
        }, completion: { complete in
            
            if complete {
                
                UIView.transition(with: self.boxView,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: {
                    
                    self.boxView.backgroundColor = self.flag ? .red : .green
                    
                }, completion: { complete in
                    
                    if complete {
                        
                        self.flag.toggle()
//                        self.animateBox()
                    }
                })
            }
        })
        
    }
    @IBAction func tap(_ sender: Any) {
        
        self.present(ViewController2.instantiate(), animated: true)
        
        
    }
}


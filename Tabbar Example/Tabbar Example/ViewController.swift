//
//  ViewController.swift
//  Tabbar Example
//
//  Created by Chaitanya Soni on 05/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabbar: UITabBar!
    
    lazy var tabVC1: TabVC1 = TabVC1.instantiate()
    lazy var tabVC2: TabVC2 = TabVC2.instantiate()
    lazy var tabVC3: TabVC3 = TabVC3.instantiate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabbar.delegate = self
        
        
        self.tabbar.setItems([
            .init(title: "Downloads",
                  image: UIImage.init(systemName: "square.and.arrow.down.on.square.fill"),
                  tag: 1),
            .init(title: "Home",
                  image: UIImage.init(systemName: "house.fill"),
                  tag: 2),
            .init(title: "Notifications",
                  image: UIImage.init(systemName: "note.text"),
                  tag: 3)
        ], animated: true)
        
        if let item = self.tabbar.items?[1] {
            self.tabbar.selectedItem = item
            self.tabbarItemSelected(item: item)
        }
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func tabbarItemSelected(item: UITabBarItem) {
        
        if item.tag == 1 {
            
            self.addChildViewController(vc: tabVC1, to: self.containerView)
            
        } else if item.tag == 2 {

            self.addChildViewController(vc: tabVC2, to: self.containerView)
            
        } else if item.tag == 3 {

            self.addChildViewController(vc: tabVC3, to: self.containerView)
            
        }
    }
    
    func addChildViewController(vc: UIViewController, to: UIView) {
        
        self.addChild(vc)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        to.subviews.forEach({ $0.removeFromSuperview() })
        to.addSubview(vc.view)
        
        to.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 0).isActive = true
        to.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: 0).isActive = true
        to.topAnchor.constraint(equalTo: vc.view.topAnchor, constant: 0).isActive = true
        to.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor, constant: 0).isActive = true
    }
}

extension ViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabbarItemSelected(item: item)
    }
}

//
//  HomeViewController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import Foundation
import UIKit
import SWRevealViewController
import DropDown

//struct HomeModel {
//    enum HomeTableData {
//        case equity
//        case equityDetail
//    }
//    
//    let tableData: [HomeTableData] = []
//}
//
//class HomeViewModel {
//    var delegate: HomeViewModelDelegate {
//        didSet {
//            delegate.loadData(data: .init())
//        }
//    }
//}
//protocol HomeViewModelDelegate {
//    func loadData(data: HomeModel)
//}

class HomeViewController: UIViewController, StoryboardLoadable {
    static func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
        let swRevealVC = SWRevealViewController(rearViewController: nil, frontViewController: UINavigationController(rootViewController: vc))
        let rightVC = RightViewController.instantiate()
        rightVC.buttonPressCompletion = vc.buttonPressed(index:)
        swRevealVC?.rightViewController = rightVC
        swRevealVC?.delegate = vc
        return swRevealVC ?? .init()
    }
    
//    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        
//        self.viewModel.delegate = self
    }
    func buttonPressed(index: Int) {
        
    }
    @IBAction func showPopupTapped(_ sender: Any) {
        let vc = PopupViewController.instantiate()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    @IBAction func showDropdown(_ sender: UIButton) {
        let dropdown = DropDown()
        dropdown.anchorView = sender
        dropdown.dataSource = ["First Option", "Second Option"]
        dropdown.direction = .bottom
        dropdown.bottomOffset = .init(x: 0, y: sender.frame.height)
        dropdown.selectionAction = { index, title in
            print(index, title)
        }
        dropdown.show()
    }
    @IBAction func menuTapped(_ sender: Any) {
        
        self.revealViewController().rightRevealToggle(animated: true)
        
    }
}
extension HomeViewController: SWRevealViewControllerDelegate {
    func revealController(_ revealController: SWRevealViewController!, animationControllerFor operation: SWRevealControllerOperation, from fromVC: UIViewController!, to toVC: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        return nil
    }
}
//extension HomeViewController: HomeViewModelDelegate {
//    func loadData(data: HomeModel) {
//        
//    }
//}

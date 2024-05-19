//
//  HomeViewController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import Foundation
import UIKit

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
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
//        vc.viewModel = HomeViewModel()
        return vc
    }
    
//    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewModel.delegate = self
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
}
//extension HomeViewController: HomeViewModelDelegate {
//    func loadData(data: HomeModel) {
//        
//    }
//}

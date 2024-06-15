//
//  ViewController2.swift
//  UIView_dot_animate
//
//  Created by Chaitanya Soni on 15/06/24.
//

import UIKit


protocol ViewController2ViewModelProtocol {
    var cells: (([String]) -> ())? { get set }
}
class ViewController2ViewModel: ViewController2ViewModelProtocol {
    
    public var cells: (([String]) -> ())?
    
    init(cells: [String]) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.cells?(cells)
            DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: { [weak self] in
                self?.cells?(cells)
            })
        })
    }
    
}



class ViewController2: UIViewController {
    static func instantiate() -> ViewController2 {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: String(describing: Self.self)) as! ViewController2
        
        vc.viewModel = ViewController2ViewModel(cells: (1...1000).map({"\($0)"}))
        
        return vc
    }
    
    var viewModel: ViewController2ViewModelProtocol?
    private var cells: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
    }
    
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel?.cells = { cells in
            DispatchQueue.main.async {
                self.cells = cells
//                UIView.animate(withDuration: 0.3, animations: {
//                    self.tableView.reloadData()
//                })
                self.tableView.reloadData(with: UITableView.RowAnimation.left)
            }
        }
        
//        let range = NSMakeRange(0, self.tableView.numberOfSections)
//        let sections = NSIndexSet(indexesIn: range)
//        self.tableView.reloadSections(sections as IndexSet, with: .automatic)
    }
}

extension ViewController2: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        cell.detailTextLabel?.text = "\(indexPath.section), \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        UIView.transition(with: cell.contentView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            cell.contentView.backgroundColor = .lightGray
            
        }, completion: nil)
    }
    
}
extension ViewController2: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension UITableView {
    func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}

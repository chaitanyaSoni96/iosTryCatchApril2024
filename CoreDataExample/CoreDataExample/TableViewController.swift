//
//  TableViewController.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 19/05/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data: [ToDo]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc = ViewController.instantiate()
        vc.listRefreshTrigger = { [weak self] in
            self?.refreshFromDatabase()
        }
        self.present(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshFromDatabase()
    }
    
    func refreshFromDatabase() {
        let fetchRequest = ToDo.fetchRequest()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let objects = try? context.fetch(fetchRequest)
        self.data = objects
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = data?[indexPath.row].taskName
        cell.detailTextLabel?.text = data?[indexPath.row].taskDescription
        return cell
    }
}

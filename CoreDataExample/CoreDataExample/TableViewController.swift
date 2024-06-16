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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshFromDatabase()
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.loggedInUserChanged, object: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc = ViewController.instantiate()
        vc.listRefreshTrigger = { [weak self] in
            self?.refreshFromDatabase()
        }
        self.present(vc, animated: true)
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            if let data = data?[indexPath.row] {
                AppDelegate.shared.persistentContainer.viewContext.delete(data)
                AppDelegate.shared.saveContext()
                refreshFromDatabase()
            }
        }
    }
}

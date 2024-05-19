//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 19/05/24.
//

import UIKit

class ViewController: UIViewController {
    static func instantiate() -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! ViewController
        return vc
    }
    
    var listRefreshTrigger: (() -> ())?
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func saveTapped() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let todo = ToDo(context: context)
        todo.id = .init()
        todo.taskName = titleTF.text
        todo.taskDescription = titleTF.description
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        listRefreshTrigger?()
        self.dismiss(animated: true)
    }

}


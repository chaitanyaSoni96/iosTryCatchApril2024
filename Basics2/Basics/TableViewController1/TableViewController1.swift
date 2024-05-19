//
//  TableViewController1.swift
//  Basics
//
//  Created by Chaitanya Soni on 14/04/24.
//

import Foundation
import UIKit


class Singleton {
    /*
     accessed using -
     let singletonObject = Singleton.shared
     */
    static let shared = Singleton()
    
    private init() {
        
    }
}

class singleton {
    /*
     accessed using -
     let singletonObject = singleton.shared
     OR
     let object = singleton()
     */
    static let shared = singleton()
    
    public init() {
        
    }
}

class TableViewController1: UIViewController {
    static func instantiate() -> TableViewController1 {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController1") as! TableViewController1
        
        return vc
    }
    
    var data: DrinksByLetter? = nil
    var restApiDevArray: RESTAPIDev? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let allCocktailsByFirstLetter = try? JSONDecoder().decode(AllCocktailsByFirstLetter.self, from: jsonData)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "TableView1Cell", bundle: .main), forCellReuseIdentifier: "cell")
        
        
        let item = UIBarButtonItem(systemItem: .trash)
        item.target = self
        item.action = #selector(self.trashTapped)
        let item2 = UIBarButtonItem(systemItem: .add)
        let item3 = UIBarButtonItem(systemItem: .camera)
        let item4 = UIBarButtonItem(systemItem: .trash)
        let item5 = UIBarButtonItem(systemItem: .trash)
        let item6 = UIBarButtonItem(systemItem: .trash)
        let item7 = UIBarButtonItem(systemItem: .trash)
        self.navigationItem.setRightBarButtonItems([item, item2, item3, item4, item5, item6, item7], animated: true)
        
        
        
        let url1 = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")!
        
        var url2 = URLComponents(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php")
        url2?.queryItems = [URLQueryItem(name: "f", value: "b")]
        
        var request = URLRequest(url: url2!.url!)
        
        request.httpMethod = "GET"
        
        let requestDict = ["f":"a"]
        let data = try? JSONSerialization.data(withJSONObject: requestDict, options: [])
        //{"f":"a"}
        /*pretty printed
         {
             "f" : "a"
         }
         */
//        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                
                guard let data else { return }
                
                let drinkByLetter = try? JSONDecoder().decode(DrinksByLetter.self, from: data)
                
                DispatchQueue.main.async {
                    self.data = drinkByLetter
                    self.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Something went wrong.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
            }
            
        })
        
        task.resume()
        
        
        
        NetworkManager.shared.callAPI(endpoint: Endpoint.listOfAllObject) { data, response, error in
            print(String(data: data!, encoding: .utf8)!)
            
            guard let response else { return }
            
            if response.statusCode == 200 {
                
                guard let data else { return }
                
                let restApiDevArray = try? JSONDecoder().decode(RESTAPIDev.self, from: data)
                
                DispatchQueue.main.async {
                    self.restApiDevArray = restApiDevArray
                    self.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Something went wrong.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true)
                }
            }
            
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let tvc2 = TableViewController2.instantiate()
        self.navigationController?.pushViewController(tvc2, animated: false)
    }
    
    @objc func trashTapped() {
        
    }
    
}


extension TableViewController1: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if data == nil && restApiDevArray == nil {
            return 0
        } else if data != nil && restApiDevArray != nil {
            return 2
        } else if data == nil && restApiDevArray != nil {
            return 1
        } else if data != nil && restApiDevArray == nil {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return restApiDevArray?.count ?? 0
        } else if section == 1 {
            return data?.drinks?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "defaultCell")
            let data = restApiDevArray?[indexPath.row]
            cell.textLabel?.text = data?.name
            cell.detailTextLabel?.text = data?.data?.cpuModel
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableView1Cell
            else {
                return .init()
            }
            if let data = self.data?.drinks?[indexPath.row] {
                cell.titleLabel.text = data.strDrink
                cell.subtitleLabel.text = data.strCategory
                cell.buttonTapCompletion = {
                    let data = self.data?.drinks?[indexPath.row]
                    let vc = DetailsViewController.instantiate(data: data?.strDrink)
                    self.present(vc, animated: true)
                }
            }
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = UILabel()
        footer.textAlignment = .center
        footer.font = UIFont.preferredFont(forTextStyle: .title1)
        footer.text = "Footer for section \(section)"
        
        if section == 0 {
            footer.backgroundColor = .white
        } else {
            footer.backgroundColor = .gray
        }
        
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TVC1Header().loadNib() //as! TVC1Header
//        header.label.textAlignment = .center
//        header.label.font = UIFont.preferredFont(forTextStyle: .title1)
//        header.label.text = "Header for section \(section)"
//        
        if section == 0 {
            header.backgroundColor = .white
        } else {
            header.backgroundColor = .gray
        }
        
        
        return header
    }
}

extension TableViewController1: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let data = restApiDevArray?[indexPath.row]
            let vc = DetailsViewController.instantiate(data: data?.name)
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 {
            
        }
    }
    
    
}

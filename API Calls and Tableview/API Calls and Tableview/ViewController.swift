//
//  ViewController.swift
//  API Calls and Tableview
//
//  Created by Chaitanya Soni on 04/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        callGetAPI()
        callPostAPI()
//        callPutAPI()
    }

    func callGetAPI() {
        let request = URLRequest(url: URL(string: "https://api.restful-api.dev/objects")!)
        NetworkManager.shared.callAPI(request) { data, response, error in
            if let data {
                print(String(data: data, encoding: .utf8))
            }
        }
    }
    func callGetAPIForSingleObject(objectID: String) {
        let request = URLRequest(url: URL(string: "https://api.restful-api.dev/objects/\(objectID)")!)
        NetworkManager.shared.callAPI(request) { data, response, error in
            if let data {
                print(String(data: data, encoding: .utf8))
            }
        }
    }
    
    func callPostAPI() {
        
        var request = URLRequest(url: URL(string: "https://api.restful-api.dev/objects")!)
        
        /*
         {
            "name": "Apple MacBook Pro 16",
            "data": {
               "year": 2019,
               "price": 1849.99,
               "CPU model": "Intel Core i9",
               "Hard disk size": "1 TB"
            }
         }
         */
        let dataDict: [String : Any] = [
            "name": "8989 Apple MacBook Pro 16",
            "data": [
                "year": 2025,
                "price" : 40000,
                "CPU model" : "Intel Core i99",
                "Hard disk size" : "1 PB"
            ]
        
        ]
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: dataDict)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        NetworkManager.shared.callAPI(request) { data, response, error in
            if let data {
                print(String(data: data, encoding: .utf8))
                
                let dict = try? JSONSerialization.jsonObject(with: data) as? [String : Any]
                if let id = dict?["id"] as? String {
                    
                    self.callPutAPI(objectID: id)
                    
                }
                
            }
        }
    }
    
    func callPutAPI(objectID: String) {
//        let objectID = "ff8081818f3e2e62018f41fce20308f4"
        var request = URLRequest(url: URL(string: "https://api.restful-api.dev/objects/\(objectID)")!)
        
        /*
         {
            "name": "Apple MacBook Pro 16",
            "data": {
               "year": 2019,
               "price": 1849.99,
               "CPU model": "Intel Core i9",
               "Hard disk size": "1 TB"
            }
         }
         */
        let dataDict: [String : Any] = [
            "name": "PUT Updated Apple MacBook Pro 16",
            "data": [
                "year": 2019,
                "price" : 1849.99,
                "CPU model" : "Intel Core i9",
                "Hard disk size" : "1 TB"
            ]
        
        ]
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: dataDict)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        NetworkManager.shared.callAPI(request) { data, response, error in
            if let data {
                print(String(data: data, encoding: .utf8))
                
                self.callPatchAPI(objectID: objectID)
            }
        }
    }

    func callPatchAPI(objectID: String) {
        
        
        let dict = [
            "name": "Apple MacBook Pro 16 (Updated Name)"
        ]
        
        var request = URLRequest(url: URL(string: "https://api.restful-api.dev/objects/\(objectID)")!)
        request.httpMethod = "PATCH"
        request.httpBody = try? JSONSerialization.data(withJSONObject: dict)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        NetworkManager.shared.callAPI(request) { data, response, error in
            if let data {
                print(String(data: data, encoding: .utf8) ?? "")
                
                self.callDeleteAPI(objectID: objectID)
            }
        }
    }
    
    func callDeleteAPI(objectID: String) {
        
        NetworkManager.shared.callAPI(Endpoint.deleteObject(id: objectID)) { data, response, error in
            
        }
    }
}


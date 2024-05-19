//
//  NetworkManager.swift
//  API Calls and Tableview
//
//  Created by Chaitanya Soni on 04/05/24.
//

import Foundation

class NetworkManager { //Singleton
    static let shared = NetworkManager()
    private init() {}
    
    private let session: URLSession = URLSession.shared
    
    func callAPI(_ request: URLRequest, completion: @escaping ((_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ())) {
        
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
        
    }
    
    func callAPI(_ endpoint: EndpointProtocol, completion: @escaping ((_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ())) {
        
        let task = session.dataTask(with: endpoint.getRequest(), completionHandler: completion)
        task.resume()
    }
}

protocol EndpointProtocol {
    
    func getRequest() -> URLRequest
    func getHeaders() -> [String : String]
}

enum Endpoint: EndpointProtocol {
    case listOfAllObject
    case listOfObjectsByIDs(ids: [Int])
    case singleObject(id: String)
    case addObject(object: RESTAPIDevElement)
    case updateObject(id: String, object: RESTAPIDevElement)
    case patchObject(id: String, object: RESTAPIDevElement)
    case deleteObject(id: String)
    
    private var baseURL: URL { URL(string: "https://api.restful-api.dev")! }
    
    func getRequest() -> URLRequest {
        
        switch self {
        case .listOfAllObject:
            
            let url = baseURL.appendingPathComponent("objects")
            var request = URLRequest(url: url)
            
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            return request
            
        case .listOfObjectsByIDs(let ids):
            
            var urlComponents = URLComponents(url: baseURL.appendingPathComponent("objects"), resolvingAgainstBaseURL: true)
            
            urlComponents?.queryItems?.append(contentsOf: ids.map({ URLQueryItem(name: "id", value: "\($0)") }))
            
            var request = URLRequest(url: urlComponents!.url!)
            
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            
            return request
            
        case .singleObject(let id):
            
            let url = baseURL.appendingPathComponent("objects").appendingPathComponent(id)
            var request = URLRequest(url: url)
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            
            
            return request
            
            
        case .addObject(let object):
            
            let url = baseURL.appendingPathComponent("objects")
            var request = URLRequest(url: url)
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            
            request.httpMethod = "POST"
            
            let data = try? JSONSerialization.data(withJSONObject: object)
            request.httpBody = data
            
            return request
            
        case .updateObject(let id, let object):
            
            let url = baseURL.appendingPathComponent("objects").appendingPathComponent(id)
            var request = URLRequest(url: url)
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            
            request.httpMethod = "PUT"
            let data = try? JSONSerialization.data(withJSONObject: object)
            request.httpBody = data
            
            return request
            
        case .patchObject(let id, let object):
            
            let url = baseURL.appendingPathComponent("objects").appendingPathComponent(id)
            var request = URLRequest(url: url)
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            request.httpMethod = "PATCH"
            let data = try? JSONSerialization.data(withJSONObject: object)
            request.httpBody = data
            
            return request
            
        case .deleteObject(let id):
            
            let url = baseURL.appendingPathComponent("objects").appendingPathComponent(id)
            var request = URLRequest(url: url)
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            request.httpMethod = "DELETE"
            return request
            
        }
    }
    
    func getHeaders() -> [String : String] {
        return ["Content-Type" : "application/json"]
    }
    
}

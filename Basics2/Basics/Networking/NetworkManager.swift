//
//  NetworkManager.swift
//  Basics
//
//  Created by Chaitanya Soni on 20/04/24.
//

import Foundation


@available(iOS 15.0, *)
class NetworkManager: NSObject {
    static let shared = NetworkManager()
    private override init() {}
    
    private lazy var session: URLSession = {
        let session = URLSession(configuration: {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 30
            config.timeoutIntervalForResource = 600
            config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            return config
        }())
        return session
    }()
    
    private var taskDict: [URLSessionTask : ((_ data: Data?, _ response: HTTPURLResponse?, _ error: Error?) -> ())] = .init()
    
    func callAPI(endpoint: Endpoint, completion: @escaping ((_ data: Data?, _ response: HTTPURLResponse?, _ error: Error?) -> ())) {
        let request = endpoint.getRequest()
        let task = self.session.dataTask(with: request)
        task.delegate = self
        taskDict[task] = completion
        task.resume()
    }
}

@available(iOS 15.0, *)
extension NetworkManager: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        taskDict[dataTask]?(data,
                            dataTask.response as? HTTPURLResponse,
                            nil)
        taskDict[dataTask] = nil
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: (URLSession.ResponseDisposition) -> Void) {
        
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error {
            taskDict[task]?(nil,
                                task.response as? HTTPURLResponse,
                                error)
            taskDict[task] = nil
        }
    }
}

enum Endpoint {
    case listOfAllObject
    case listOfObjectsByIDs(ids: [Int])
    case singleObject
    case addObject
    case updateObject
    case patchObject
    case deleteObject
    
    private var baseURL: URL { URL(string: "https://api.restful-api.dev")! }
    
    func getRequest() -> URLRequest {
        
        switch self {
        case .listOfAllObject:
            
            let url = baseURL.appendingPathComponent("objects")
            let request = URLRequest(url: url)
            
            return request
            
        case .listOfObjectsByIDs(let ids):
            
            var urlComponents = URLComponents(url: baseURL.appendingPathComponent("objects"), resolvingAgainstBaseURL: true)
            
            urlComponents?.queryItems?.append(contentsOf: ids.map({ URLQueryItem(name: "id", value: "\($0)") }))
            
            let request = URLRequest(url: urlComponents!.url!)
            
            return request
            
        case .singleObject:
            
            break
            
        case .addObject:
            
            break
            
        case .updateObject:
            
            break
            
        case .patchObject:
            
            break
            
        case .deleteObject:
            
            break
            
        }
         
        
        
        return .init(url: URL(string: "")!)
    }
    
}


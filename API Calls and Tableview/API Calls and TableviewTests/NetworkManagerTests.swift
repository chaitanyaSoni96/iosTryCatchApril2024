//
//  NetworkManagerTests.swift
//  API Calls and TableviewTests
//
//  Created by Chaitanya Soni on 04/05/24.
//

import XCTest
@testable import API_Calls_and_Tableview

final class NetworkManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print(#function)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print(#function)
    }
    
    func test_GET_API_FAILS_ON_EMPTY_HEADERS() throws {
        
        let sut = NetworkManager.shared
        
        let expectation = XCTestExpectation(description: "Waiting for failing api to complete")
        
        sut.callAPI(SampleEndpoint.failingAPICall(object: .init(id: "", name: "some", data: nil))) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
                
                if response.statusCode != 200 {
                    XCTAssert(true)
                }
                expectation.fulfill()
                
                return
            }
            
            print(String(data: data ?? .init(), encoding: .utf8))
            
            XCTAssert(false, "Bad Response")
            
            expectation.fulfill()
        }
        wait(for: [expectation])
    }
    
    func test_PASSING_API_CALL_DOES_NOT_FAIL() throws {
        let sut = NetworkManager.shared
        
        let expectation = XCTestExpectation(description: "Waiting for failing api to complete")
        
        sut.callAPI(SampleEndpoint.passingAPICall) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
                
                XCTAssert(response.statusCode == 200)
                
                expectation.fulfill()
                
                return
            }
            
            print(String(data: data ?? .init(), encoding: .utf8))
            
            XCTAssert(false, "Bad Response")
            
            expectation.fulfill()
        }
        wait(for: [expectation])
    }
    
}

enum SampleEndpoint: EndpointProtocol {
    case failingAPICall(object: RESTAPIDevElement)
    case passingAPICall
    
    private var baseURL: URL { URL(string: "https://api.restful-api.dev")! }
    
    func getRequest() -> URLRequest {
        switch self {
        case .failingAPICall(let object):
            
            let url = baseURL.appendingPathComponent("objects")
            var request = URLRequest(url: url)
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            
            request.httpMethod = "POST"
            
            
            return request
        case .passingAPICall:
            let url = baseURL.appendingPathComponent("objects")
            var request = URLRequest(url: url)
            
            
            for header in self.getHeaders() {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            return request
        }
    }
    
    func getHeaders() -> [String : String] {
        switch self {
        case .failingAPICall:
            return [:]
        case .passingAPICall:
            return ["Content-Type" : "application/json"]
        }
    }
}

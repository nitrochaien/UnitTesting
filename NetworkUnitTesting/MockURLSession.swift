//
//  MockURLSession.swift
//  NetworkUnitTesting
//
//  Created by Dinh Vu Nam on 9/28/17.
//  Copyright © 2017 NamDV. All rights reserved.
//

import UIKit

class MockURLSession: URLSessionProtocol {
    var nextDataTask = MockURLSessionDataTask()
    var nextData: Data?
    var nextError: Error?
    
    private (set) var lastURL: URL?
    
    //URLSessionProtocol
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request.url
        
        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        return nextDataTask
    }
    
    func successHttpURLResponse(request: URLRequest) -> URLResponse {
        //create fake reponse
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }
}

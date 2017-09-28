//
//  HttpClient.swift
//  NetworkUnitTesting
//
//  Created by Dinh Vu Nam on 9/28/17.
//  Copyright © 2017 NamDV. All rights reserved.
//

import UIKit

class HttpClient {
    typealias completeClosure = ( _ data: Data?, _ error: Error?) -> Void
    private var session: URLSessionProtocol
    
    init(_ session: URLSessionProtocol) {
        self.session = session
    }
    
    func get( url: URL, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}

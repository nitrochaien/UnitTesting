//
//  URLSessionProtocol.swift
//  NetworkUnitTesting
//
//  Created by Dinh Vu Nam on 9/28/17.
//  Copyright © 2017 NamDV. All rights reserved.
//

import Foundation

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

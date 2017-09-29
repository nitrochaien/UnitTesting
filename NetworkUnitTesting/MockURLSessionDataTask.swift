//
//  MockURLSessionDataTask.swift
//  NetworkUnitTesting
//
//  Created by Dinh Vu Nam on 9/28/17.
//  Copyright © 2017 NamDV. All rights reserved.
//

import UIKit

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}

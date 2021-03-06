//
//  NetworkUnitTestingTests.swift
//  NetworkUnitTestingTests
//
//  Created by Dinh Vu Nam on 9/28/17.
//  Copyright © 2017 NamDV. All rights reserved.
//

import XCTest
@testable import NetworkUnitTesting

class NetworkUnitTestingTests: XCTestCase {
    
    var httpClient: HttpClient!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        httpClient = HttpClient(session)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }
    
    
    func testGetRequestWithURL() {
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        // Assert
        XCTAssert(session.lastURL == url)
    }
    
    func testGetResumeCalled() {
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func testGetShouldReturnData() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        httpClient.get(url: URL(string: "http://mockurl")!) { (data, error) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
}

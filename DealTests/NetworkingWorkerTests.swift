//
//  NetworkingWorkerTests.swift
//  DealTests
//
//  Created by Pierre Doury on 03/10/2022.
//

import XCTest
@testable import Deal
class NetworkingWorkerTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expectation = XCTestExpectation(description: "Test settings endpoint")
        let networkWorker = NetworkingWorker()
        let url = URL(string: "http://testfoodios.herokuapp.com/settings")
        XCTAssertNotNil(url)
        networkWorker.request(fromURL: url!) { (result: Result<[Cities], Error>) in
            switch result {
            case .success(let cities):
                XCTAssertTrue(cities.count > 0)
            case .failure(let error):
                XCTFail(String(describing: error))
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

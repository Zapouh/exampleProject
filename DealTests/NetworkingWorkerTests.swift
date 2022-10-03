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

    func testEndpointSettingsSuccess() async throws {
        let networkWorker = NetworkingWorker()
        let url = URL(string: "http://testfoodios.herokuapp.com/settings")
        XCTAssertNotNil(url)
        
        let result: Result<Cities, Error> = await networkWorker.request(fromURL: url!)
        do {
            switch result {
            case .success(let result):
                XCTAssertTrue(result.cities.count > 0)
            case .failure(let error):
                throw error
            }
        } catch {
            XCTFail(String(describing: error))
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

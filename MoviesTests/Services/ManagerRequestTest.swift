//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Reinner Daza Leiva on 12/06/21.
//

import XCTest
// import Mockingbird
@testable import Movies

class ManagerRequestTest: XCTestCase {
    
    var sut:ManagerRequest?
    let expectation = XCTestExpectation(description: "Download Images")
     
    override func setUpWithError() throws {
        self.sut = ManagerRequest()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func testDownloadImage() {
        self.sut?.downloadImage(from: "/z8CExJekGrEThbpMXAmCFvvgoJR.jpg") { (data, error) in
            XCTAssertNil(error, "Error, Error was not nill")
            XCTAssertNotNil(data, "Error, Data is nill")
            self.expectation.fulfill()
        }
        wait(for: [self.expectation], timeout: 10)
    }
    

    func testDownloadImageError() {
        self.sut?.downloadImage(from: "/cas.jpg") { (data, error) in
            XCTAssertNil(data, "Error, Data is not nill")
            self.expectation.fulfill()
        }
        wait(for: [self.expectation], timeout: 10)
    }
    
    func testDownloadAllMovies()  {
        self.sut?.makeRequest(method: .GET, baseUrl: .BASE_URL, endpoint: .NOW_PLAYING, params: "", body: nil, completion: { (data, error) in
            XCTAssertNil(error, "Error, Error was not nill")
            XCTAssertNotNil(data, "Error, Data is nill")
            self.expectation.fulfill()
        })
        wait(for: [self.expectation], timeout: 10)
    }

}
    

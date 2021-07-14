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
    let expectationDownloadmoviesImages = XCTestExpectation(description: "Download Images")
    let expectationDownloadMovies = XCTestExpectation(description: "Download Images")
     
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
            self.expectationDownloadmoviesImages.fulfill()
        }
        wait(for: [self.expectationDownloadmoviesImages], timeout: 10)
    }
    
    func testDownloadImageError() {
        self.sut?.downloadImage(from: "/cas.jpg") { (data, error) in
            XCTAssertNotNil(data, "Error, Data is not nill")
            self.expectationDownloadmoviesImages.fulfill()
        }
        wait(for: [self.expectationDownloadmoviesImages], timeout: 10)
    }
    
    func testDownloadAllMovies()  {
        self.sut?.makeRequest(method: .GET, baseUrl: .BASE_URL, endpoint: .NOW_PLAYING, params: "", body: nil, completion: { (data, error) in
            XCTAssertNil(error, "Error, Error was not nill")
            XCTAssertNotNil(data, "Error, Data is nill")
            self.expectationDownloadMovies.fulfill()
        })
        wait(for: [self.expectationDownloadMovies], timeout: 10)
    }
    
    func testDownloadMovie() {
        self.sut?.makeRequest(method: .GET, baseUrl: .BASE_URL, endpoint: .MOVIE, params: "804435", body: nil, completion: { (data, error) in
            XCTAssertNil(error, "Error, Error was not nill")
            XCTAssertNotNil(data, "Error, Data is nill")
            self.expectationDownloadMovies.fulfill()
        })
    }

}
    

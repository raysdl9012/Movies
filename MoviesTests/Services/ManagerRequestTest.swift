//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Reinner Daza Leiva on 12/06/21.
//

import XCTest
import Mockingbird
@testable import Movies

class ManagerRequestTest: XCTestCase {
    
    var sut:ManagerRequest!
    
    var mockManagerRequest: ManagerRequestMock = mock(ManagerRequest.self)

    override func setUpWithError() throws {
        self.sut = ManagerRequest()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMakeRequestDownloadImage() {
        // Create an expectation for a background download task.
           let expectation = XCTestExpectation(description: "Download apple.com home page")
           
        self.sut.downloadImage(from: "4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg") { data, error in
            
            XCTAssertNil(error, "-> Error not nil")
            if let image = UIImage(data: data as! Data) {
                print(image)
                XCTAssertEqual(image, UIImage(), "No es una imagen")
            }
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
         wait(for: [expectation], timeout: 60.0)
        
    }
}

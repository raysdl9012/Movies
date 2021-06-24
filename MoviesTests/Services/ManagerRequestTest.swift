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

    func makeRequestTest() {
        
        //given() ~> true
    }
}

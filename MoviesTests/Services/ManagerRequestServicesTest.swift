//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Reinner Daza Leiva on 12/06/21.
//

import XCTest
@testable import Movies

class ManagerRequestServicesTest: XCTestCase {
    
    var sut:ManagerRequestServices!

    override func setUpWithError() throws {
        self.sut = ManagerRequestServices()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func getAllMovies() {
        print("aca")
    }
}

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
    
    let expectationDownloadmoviesImages = XCTestExpectation(description: "Download Images")
    let expectationDownloadMovies = XCTestExpectation(description: "Download Images")

    override func setUpWithError() throws {
        self.sut = ManagerRequestServices()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.sut = nil
    }
    
    func testDownloadImage()  {
        self.sut.getImageByPosterPath(posterPath: "/z8CExJekGrEThbpMXAmCFvvgoJR.jpg") { data, error in
            XCTAssertNotNil(data, "Error, Data was nill")
            XCTAssertNil(error, "Error, Error was not nill")
            let image = data as! UIImage
            let image2 = data as! UIImage
            let equalImage = type(of: image) == UIImage.self
            XCTAssert(equalImage, "The data is not a image")
            XCTAssertEqual(image, image2)
            self.expectationDownloadmoviesImages.fulfill()
        }
        wait(for: [self.expectationDownloadmoviesImages], timeout: 10)
    }
    
    func testDownloadImageError()  {
        self.sut.getImageByPosterPath(posterPath: "/casa.jpg") { data, error in
            XCTAssertNil(data, "Error, Data is not nill")
            self.expectationDownloadmoviesImages.fulfill()
        }
        wait(for: [self.expectationDownloadmoviesImages], timeout: 10)
    }
    
    func testDownloadAllMovies()  {
        self.sut?.getALLMovies(completion: { data, error in
            XCTAssertNil(error, "Error, Error was not nill")
            XCTAssertNotNil(data, "Error, Data is nill")
            let allMovies = data as? AllMovie
            XCTAssertNotNil(allMovies, "Error, allMovies is nill")
            self.expectationDownloadMovies.fulfill()
        })
        wait(for: [self.expectationDownloadMovies], timeout: 10)
    }
    
    func testDownloadMovie() {
        self.sut?.getMovieById(id: "804435", completion: { data, error in
            XCTAssertNil(error, "Error, Error was not nill")
            XCTAssertNotNil(data, "Error, Data is nill")
            let movie = data as? Movie
            print(movie)
            XCTAssertNotNil(movie, "Error, allMovies is nill")
            self.expectationDownloadMovies.fulfill()
        })
        wait(for: [self.expectationDownloadMovies], timeout: 10)
    }

}

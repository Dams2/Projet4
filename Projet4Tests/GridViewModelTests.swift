//
//  GridViewModelTests.swift
//  Projet4Tests
//
//  Created by Damien Rojo on 27/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

@testable import Projet4
import XCTest

final class GridViewModelTests: XCTestCase {

    func testGivenGridViewModel_WhenDidSelectSpotAtIndex0_ThenSelectedSpotIsCorrectlyReturned() {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for index 0")
        
        viewModel.selectedSpot = { spot in
            XCTAssertEqual(spot, .top)
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 0)
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenGridViewModel_WhenDidSelectSpotAtIndex1_ThenSelectedSpotIsCorrectlyReturned() {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for index 1")
        
        viewModel.selectedSpot = { spot in
            XCTAssertEqual(spot, .topLeft)
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 1)
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenGridViewModel_WhenDidSelectSpotAtIndex2_ThenSelectedSpotIsCorrectlyReturned() {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for index 2")
        
        viewModel.selectedSpot = { spot in
            XCTAssertEqual(spot, .topRight)
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 2)
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenGridViewModel_WhenDidSelectSpotAtIndex3_ThenSelectedSpotIsCorrectlyReturned()  {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for index 3")
        
        viewModel.selectedSpot = { spot in
            XCTAssertEqual(spot, .bottom)
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 3)
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenGridViewModel_WhenDidSelectSpotAtIndex4_ThenSelectedSpotIsCorrectlyReturned() {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for index 4")
        
        viewModel.selectedSpot = { spot in
            XCTAssertEqual(spot, .bottomLeft)
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 4)
        waitForExpectations(timeout: 1.0, handler:  nil)
    }

    func testGivenGridViewModel_WhenDidSelectSpotAtIndex5_ThenSelectedSpotIsCorrectlyReturned() {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for index 5")
        
        viewModel.selectedSpot = { spot in
            XCTAssertEqual(spot, .bottomRight)
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 5)
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenGridViewModel_WhenDidSelectSpotWithBigIndex_ThenNothingIsReturned() {
        let viewModel = GridViewModel()
        let expectation = self.expectation(description: "Returned spot for big index")
        expectation.isInverted = true
        
        viewModel.selectedSpot = { spot in
            XCTFail()
            expectation.fulfill()
        }
        viewModel.didSelectSpot(at: 1000)
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

//
//  HomeViewModelTests.swift
//  Projet4Tests
//
//  Created by Damien Rojo on 22/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

@testable import Projet4
import XCTest

final class HomeViewModelTests: XCTestCase {

    func testGivenAHomeViewModelWhenViewDidLoadThenTitletextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Title text returned")

        viewModel.titleText = { text in
            XCTAssertEqual(text, "Instagrid")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenViewDidLoadThenDirectionTextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Direction text returned")
        
        viewModel.directionText = { text in
            XCTAssertEqual(text, "^")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenViewDidLoadThenSwipeDirectionTextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Swipe direction text returned")
        
        viewModel.swipeDirectionText = { text in
            XCTAssertEqual(text, "Swipe-up")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenViewDidLoadThenSelectedConfigurationIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Selected configuration returned")
        
        viewModel.selectedConfiguration = { configuration in
            XCTAssertEqual(configuration, .firstGrid)
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenDidPressFirstGridThenSelectedConfigurationIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Selected configuration returned for first grid ")
        
        var counter = 0
        viewModel.selectedConfiguration = { configuration in
            if counter == 1 {
                XCTAssertEqual(configuration, .firstGrid)
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didPressFirstGrid()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenDidPressSecondGridThenSelectedConfigurationIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Selected configuration returned for second grid")
        
        var counter = 0
        viewModel.selectedConfiguration = { configuration in
            if counter == 1 {
                XCTAssertEqual(configuration, .secondGrid)
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didPressSecondGrid()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenDidPressThirdGridThenSelectedConfigurationIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Selected configuration returned for third grid")
        var counter = 0
        viewModel.selectedConfiguration = { configuration in
            if counter == 1 {
                XCTAssertEqual(configuration, .thirdGrid)
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didPressThirdGrid()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenHomeViewModelWhenDidChangeToCompactThenDirectionTextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Direction text returned for compact")
        
        var counter = 0
        viewModel.directionText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "^")
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didChangeToCompact()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenDidChangeToCompactThenSwipeDirectionTextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Swipe direction text returned for compact")
        
        var counter = 0
        viewModel.swipeDirectionText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "Swipe-up to share")
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didChangeToCompact()
        waitForExpectations(timeout: 1.0, handler:  nil)
    }
    
    func testGivenAHomeViewmodelWhenDidChangeToRegularThenDirectionTextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Direction text returned for regular")

        var counter = 0
        viewModel.directionText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "<")
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didChangeToRegular()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenHomeViewModelWhenDidChangeToRegularThenSwipeDirectionTextIsCorrectlyReturned() {
        let viewModel = HomeViewModel()
        let expectation = self.expectation(description: "Swipe direction text returned for regular")
        var counter = 0
        viewModel.swipeDirectionText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "Swipe-left to share")
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didChangeToRegular()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

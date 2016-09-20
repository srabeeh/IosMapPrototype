//
//  MapkitPrototypeTests.swift
//  MapkitPrototypeTests
//
//  Created by Sam Rabeeh on 2016-09-19.
//  Copyright © 2016 Sam Rabeeh - RCI. All rights reserved.
//

import XCTest
@testable import MapkitPrototype

class MapkitPrototypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testBeerModelInitialization(){
        // Success case.
        let myBeer = Beer()
        XCTAssertNotNil(myBeer)
    }
}

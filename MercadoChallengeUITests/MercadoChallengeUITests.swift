//
//  MercadoChallengeUITests.swift
//  MercadoChallengeUITests
//
//  Created by troquer on 7/20/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import XCTest

class MercadoChallengeUITests: XCTestCase {
    var app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func initialView() throws {
        app.launch()
        XCTAssertTrue(app.otherElements["searchView"].exists, "Search view is not launched at start")
    }
    
    func testSearchChangesScreen() throws {
        app.buttons["SearchBtn"].tap()
        XCTAssertTrue(app.otherElements["productListView"].exists, "Product list view is not visible after search")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

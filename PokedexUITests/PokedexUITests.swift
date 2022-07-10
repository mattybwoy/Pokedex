//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Matthew Lock on 06/07/2022.
//

import XCTest

class PokedexUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSplashScreenDisplaysLoadingText() {
        let loadScreenText = app.staticTexts["Initializing Pokédex"]
        XCTAssertNotNil(loadScreenText)
    }
    
    func testHeaderViewIsDisplayedOnMainScreen() {
        let header = app.staticTexts["Pokedéx"]
        XCTAssertNotNil(header)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}


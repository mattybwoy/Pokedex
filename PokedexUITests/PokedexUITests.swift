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

    
}


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
    
    func testMainScreenDisplaysPokemonList() {
        let tablesQuery = app.tables
        let firstCell = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["bulbasaur"]/*[[".cells[\"bulbasaur\"].staticTexts[\"bulbasaur\"]",".staticTexts[\"bulbasaur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertNotNil(tablesQuery)
        XCTAssertNotNil(firstCell)
    }
    
    func testMainScreenDisplaysWorkingSearchBar() {
        sleep(2)
        let searchSearchField = app.searchFields["search"]
        searchSearchField.tap()
        searchSearchField.typeText("Weedle")
        let result = app.tables.staticTexts["weedle"]
        result.tap()
        XCTAssertTrue(app.staticTexts["Pokemon name is weedle"].exists)
    }
    
}


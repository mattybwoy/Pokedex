//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Matthew Lock on 06/07/2022.
//

import XCTest
@testable import Pokedex

class PokedexNetworkingTests: XCTestCase {
    
    var sut: DataManager!

    override func setUpWithError() throws {
        sut = DataManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testAPICallRetrievesListOfPokemon() async {
        await sut.testAPI()
        XCTAssertNotNil(sut.pokelist)
        XCTAssertEqual(sut.pokelist.count, 151)
    }
    

}

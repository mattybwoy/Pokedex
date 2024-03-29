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
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = DataManager(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testfetchPokemonListRetrievesRealListOfPokemon() async throws {
        sut = nil
        sut = DataManager()
        try await sut.fetchPokemonList()
        XCTAssertNotNil(sut.pokelist)
        XCTAssertEqual(sut.pokelist.count, 151)
    }
    
    func testwhenUnsuccessfulRequestReturnError() async throws {
        let count = 1154
        let jsonString = "{\"count\": \(count), \"next\": \"https://pokeapi.co/api/v2/pokemon/?limit=151\", \"previous\": null, \"results\": [{\"name\": \"bulbasaur\", \"url\": \"https://pokeapi.co/api/v2/pokemon/1/\"}]}"
        
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        try await sut.fetchPokemonList(api: "")
        XCTAssertThrowsError(APIError.noResponse)
        XCTAssertThrowsError(APIError.no200)
    }
    
    func testfetchPokemonDetailRetrievesSelectedPokemonInformation() async throws {
        let count = 1154
        let jsonString = "{\"count\": \(count), \"next\": \"https://pokeapi.co/api/v2/pokemon/?offset=1&limit=1\", \"previous\": null, \"results\": [{\"name\": \"bulbasaur\", \"url\": \"https://pokeapi.co/api/v2/pokemon/1/\"}]}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        try await sut.fetchPokemonDetail(id: 1)
        XCTAssertNotNil(sut.selectedPokemon)
        
    }
    

}

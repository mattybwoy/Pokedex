//
//  DataManager.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation

class DataManager {
    static let sharedInstance = DataManager()
    var pokelist = [String]()
    
    func testAPI() async -> [String] {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") {
            do {
                let (data, error) = try await URLSession.shared.data(from: url)
                let status = try JSONDecoder().decode(PokemonList.self, from: data)
                for pokemon in status.results {
                    pokelist.append(pokemon.name)
                }
                return pokelist
            }
            catch {
                print("\(error)")
                return []
            }
        }
        return []
    }
}

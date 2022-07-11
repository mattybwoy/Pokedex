//
//  DataManager.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation

class DataManager: ObservableObject {
    
    static let sharedInstance = DataManager()
    @Published var pokelist = [Pokemon]()
    
    func testAPI() async {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let status = try JSONDecoder().decode(PokemonList.self, from: data)
                DispatchQueue.main.async {
                    self.pokelist = status.results
                    print(self.pokelist)
                }
            }
            catch {
                print("\(error)")
                return
            }
        }
    }
}

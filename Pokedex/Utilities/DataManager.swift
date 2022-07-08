//
//  DataManager.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation

class DataManager {
    static let sharedInstance = DataManager()
    
    func testAPI() {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let status = try JSONDecoder().decode(PokemonList.self, from: data)
                    print(status)
                }
                catch {
                    return
                }
            }
            task.resume()
        }
    }
}

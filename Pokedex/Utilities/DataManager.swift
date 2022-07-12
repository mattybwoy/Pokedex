//
//  DataManager.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation
import Combine

class DataManager: ObservableObject {
    
    static let sharedInstance = DataManager()
    @Published var pokelist = [Pokemon]()
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func testAPI() async {
        if let url = URL(string: apiType.pokemonList.rawValue) {
            do {
                let (data, _) = try await urlSession.data(from: url)
                let status = try JSONDecoder().decode(PokemonList.self, from: data)
                DispatchQueue.main.async {
                    self.pokelist = status.results
                    print(status)
                }
            }
            catch {
                print("\(error)")
                return
            }
        }
    }
}

//
//  DataManager.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation
import Combine

class DataManager {
    
    static let sharedInstance = DataManager()
    var pokelist = [Pokemon]()
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchOnePokemon() async throws {
        if let url = URL(string: APIType.onePokemon.rawValue) {
            let (data, response) = try await urlSession.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            
            guard let status = try JSONDecoder().decode(PokemonList?.self, from: data) else {
                throw APIError.noData
            }
            DispatchQueue.main.async {
                self.pokelist = status.results
            }
        }
    }
    
    func fetchPokemonList() async throws {
        if let url = URL(string: APIType.pokemonList.rawValue) {
            let (data, response) = try await urlSession.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            
            guard let status = try JSONDecoder().decode(PokemonList?.self, from: data) else {
                throw APIError.noData
            }
            DispatchQueue.main.async {
                self.pokelist = status.results
            }
        }
    }
    
    func fetchPokemonDetail(id: Int) async throws {
        if let url = URL(string: APIType.pokemonDetail.rawValue + String(id)) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let status = try JSONDecoder().decode(PokemonDetail.self, from: data)
            DispatchQueue.main.async {
                print(status.name)
                print(status.height)
            }
        }
    }
    
}

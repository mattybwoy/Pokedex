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
    var selectedPokemon: PokemonDetail?
    var pokemonDescriptionText: String?
    var weaknesses: [String] = []
    
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
            
            guard let decodedData = try JSONDecoder().decode(PokemonList?.self, from: data) else {
                throw APIError.noData
            }
            DispatchQueue.main.async {
                self.pokelist = decodedData.results
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
            let decodedData = try JSONDecoder().decode(PokemonDetail.self, from: data)
            try await fetchPokemonWeakness(url: decodedData.types[0].type.url)
            DispatchQueue.main.async {
                self.selectedPokemon = decodedData
            }
        }
    }
    
    func fetchPokemonSpeciesData(id: Int) async throws {
        if let url = URL(string: APIType.pokemonSpecies.rawValue + String(id)) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let decodedData = try JSONDecoder().decode(Species.self, from: data)
            DispatchQueue.main.async {
                self.pokemonDescriptionText = decodedData.flavor_text_entries[0].flavor_text
            }
        }
    }
    
    func fetchPokemonWeakness(url: String) async throws {
        if let url = URL(string: url) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let decodedData = try JSONDecoder().decode(PokemonWeakness.self, from: data)
            self.weaknesses = []
                for pokemon in decodedData.damage_relations.double_damage_from {
                    self.weaknesses.append(pokemon.name)
            }
        }
    }
    
    
    
}

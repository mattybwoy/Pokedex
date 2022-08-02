//
//  DataManager.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation

class DataManager {
    
    static let sharedInstance = DataManager()
    var pokelist = [Pokemon]()
    var selectedPokemon: PokemonDetail?
    var pokemonDescriptionText: String?
    var weaknesses: [String] = []
    var firstFormSprite: String?
    var secondFormSprite: String?
    var finalFormSprite: String?
    var isLegendary: Bool = false
    
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
    
    func fetchPokemonList(api: String = APIType.pokemonList.rawValue) async throws {
        if let url = URL(string: api) {
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
                self.firstFormSprite = nil
                self.secondFormSprite = nil
                self.finalFormSprite = nil     
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
            try await fetchPokemonEvolutions(url: decodedData.evolution_chain.url)
            DispatchQueue.main.async {
                guard let engIndex = decodedData.flavor_text_entries.firstIndex(where: { $0.language.name == "en" }) else {
                    return
                }
                self.pokemonDescriptionText = decodedData.flavor_text_entries[engIndex].flavor_text
                self.isLegendary = decodedData.is_legendary

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
    
    func fetchPokemonEvolutions(url: String) async throws {
        if let url = URL(string: url) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let decodedData = try JSONDecoder().decode(Evolution_Chain.self, from: data)
            let firstPokemon = decodedData.chain.species.name
            try await fetchFirstEvolutionFormSprites(pokemonName: firstPokemon)
            
            guard let secondPokemon = decodedData.chain.evolves_to else {
               return
            }
            if secondPokemon.count > 1 {
                self.secondFormSprite = "unknown"
            } else {
                if secondPokemon.count > 0 {
                    let secondFormPokemon = secondPokemon[0].species.name
                    try await fetchSecondEvolutionFormSprites(pokemonName: secondFormPokemon)
                }
            }
            
            guard let finalPokemon = decodedData.chain.evolves_to else {
               return
            }
            
            if finalPokemon.count > 1 {
                self.finalFormSprite = "unknown"
            } else {
                if finalPokemon.count > 0 {
                    guard let finalForm = finalPokemon[0].evolves_to else {
                        return
                    }
                    if finalForm.count > 0 {
                        let finalFormPokemon = finalForm[0].species.name
                        try await fetchFinalEvolutionFormSprites(pokemonName: finalFormPokemon)
                    }
                }
            }
            

        }
    }
    
    func fetchFirstEvolutionFormSprites(pokemonName: String) async throws {
        if let url = URL(string: APIType.pokemonDetail.rawValue + pokemonName) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let decodedData = try JSONDecoder().decode(PokemonDetail.self, from: data)
            DispatchQueue.main.async {
                self.firstFormSprite = decodedData.sprites.front_default
            }
        }
    }
    
    func fetchSecondEvolutionFormSprites(pokemonName: String) async throws {
        if let url = URL(string: APIType.pokemonDetail.rawValue + pokemonName) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let decodedData = try JSONDecoder().decode(PokemonDetail.self, from: data)
            DispatchQueue.main.async {
                self.secondFormSprite = decodedData.sprites.front_default
                
            }
        }
    }
    
    func fetchFinalEvolutionFormSprites(pokemonName: String) async throws {
        if let url = URL(string: APIType.pokemonDetail.rawValue + pokemonName) {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard response.statusCode == 200 else {
                throw APIError.no200
            }
            let decodedData = try JSONDecoder().decode(PokemonDetail.self, from: data)
            DispatchQueue.main.async {
                self.finalFormSprite = decodedData.sprites.front_default
            }
        }
    }
    
    
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        return data
    }
}

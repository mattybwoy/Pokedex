//
//  ViewModel.swift
//  Pokedex
//
//  Created by Matthew Lock on 12/07/2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokemonList = [Pokemon]()
    @Published var selectPokemon: PokemonDetail?
    @Published var pokemonDescription: String?
    
    func getPokemonID(id: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: id) {
            return index + 1
        }
        return 0
    }
    
    func setup() async throws {
        try await DataManager.sharedInstance.fetchPokemonList()
        DispatchQueue.main.async {
            self.pokemonList = DataManager.sharedInstance.pokelist
        }
      
    }
    
    func setupSelectedPokemonView(pokemonID: Int) async throws {
        try await DataManager.sharedInstance.fetchPokemonDetail(id: pokemonID)
        try await DataManager.sharedInstance.fetchPokemonSpeciesData(id: pokemonID)
        DispatchQueue.main.async {
            self.selectPokemon = DataManager.sharedInstance.selectedPokemon
            self.pokemonDescription = DataManager.sharedInstance.pokemonDescriptionText
        }
    }
    
    var pokemonHeight: Int {
        if let height = selectPokemon?.height {
            return height * 10
        }
        return 0
    }
    
    var pokemonWeight: Int {
        if let weight = selectPokemon?.weight {
            return weight / 10
        }
        return 0
    }
    
    var pokemonTypes: [Nature] {
        guard let pokemonTypes = selectPokemon?.types else {
            return []
        }
        return pokemonTypes
    }
    
    
}

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
        DispatchQueue.main.async {
            self.selectPokemon = DataManager.sharedInstance.selectedPokemon
        }
        
    }
    
    
}

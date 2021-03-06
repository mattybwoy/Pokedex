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
    @Published var pokemonStats: [PokemonStat]?
    @Published var pokemonChainArray = [String]()
    
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
            self.setupSelectedPokemonStats()
            self.setupPokemonEvolutionArray()
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
    
    var pokemonWeaknesses: [String] {
        return DataManager.sharedInstance.weaknesses
    }
    
    func setupSelectedPokemonStats() {
        guard let selected = selectPokemon else {
            return
        }
        pokemonStats = [
        PokemonStat(stat: "atk", value: selected.stats[1].base_stat),
        PokemonStat(stat: "def", value: selected.stats[2].base_stat),
        PokemonStat(stat: "s.atk", value: selected.stats[3].base_stat),
        PokemonStat(stat: "s.def", value: selected.stats[4].base_stat),
        PokemonStat(stat: "spd", value: selected.stats[5].base_stat)
        ]
    }
    
    func setupPokemonEvolutionArray() {
        pokemonChainArray = []
        guard let firstSprite = DataManager.sharedInstance.firstFormSprite else {
            return
        }
        pokemonChainArray.append(firstSprite)
        guard let secondSprite = DataManager.sharedInstance.secondFormSprite else {
            return
        }
        pokemonChainArray.append(secondSprite)
        guard let finalSprite = DataManager.sharedInstance.finalFormSprite else {
            return
        }
        pokemonChainArray.append(finalSprite)
    }
    
    var isLegend: Bool {

        return DataManager.sharedInstance.isLegendary
    }
    
    var pokemonSprite: String {
        guard let sprite = DataManager.sharedInstance.selectedPokemon?.sprites.front_default else {
            return ""
        }
        return sprite
    }
    
    
}

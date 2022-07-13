//
//  ViewModel.swift
//  Pokedex
//
//  Created by Matthew Lock on 12/07/2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokemonList = [Pokemon]()
    
    func setup() async {
        await DataManager.sharedInstance.fetchPokemonList()
        DispatchQueue.main.async {
            self.pokemonList = DataManager.sharedInstance.pokelist
        }
        await DataManager.sharedInstance.fetchPokemonDetail(id: 1)
    }
    
    
}

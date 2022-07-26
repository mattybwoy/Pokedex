//
//  Evolution_Chain.swift
//  Pokedex
//
//  Created by Matthew Lock on 19/07/2022.
//

import Foundation

struct Evolution_Chain: Codable {
    let chain: Chain
}

struct Chain: Codable {
    let evolves_to: [EvoChain]
    let species: PokemonType
}

struct EvoChain: Codable {
    let evolves_to: [FinalPokemon]
    let species: PokemonType
}

struct FinalPokemon: Codable {
    let species: PokemonType
}

struct PokemonType: Codable {
    let name: String
    let url: String
}

//
//  Evolution_Chain.swift
//  Pokedex
//
//  Created by Matthew Lock on 19/07/2022.
//

import Foundation

struct Evolution_Chain: Codable {
    let chain: Chain
    let species: PokemonType
}

struct Chain: Codable {
    let evolves_to: [Chain]
    let species: PokemonType
}

struct PokemonType: Codable {
    let name: String
    let url: String
}

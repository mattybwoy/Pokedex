//
//  PokemonList.swift
//  Pokedex
//
//  Created by Matthew Lock on 08/07/2022.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable, Hashable {
    let name: String
    let url: String
}

//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Matthew Lock on 13/07/2022.
//

import Foundation

struct PokemonDetail: Codable {
    let height: Int
    let id: Int
    let name: String
    let species: PokeSpecies
    let sprites: PokemonImage
    let stats: [BaseStat]
    let types: [Nature]
    let weight: Int
}

struct PokeSpecies: Codable {
    let url: String
}

struct PokemonImage: Codable {
    let front_default: String
}

struct BaseStat: Codable {
    let base_stat: Int
    let stat: Stat
}

struct Stat: Codable {
    let name: String
}

struct Nature: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
    }
    let slot: Int
    let type: NatureType
}

struct NatureType: Codable, Hashable {
    let name: String
    let url: String
}


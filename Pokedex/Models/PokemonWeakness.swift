//
//  PokemonWeakness.swift
//  Pokedex
//
//  Created by Matthew Lock on 22/07/2022.
//

import Foundation

struct PokemonWeakness: Codable {
    let damage_relations: Relation
}

struct Relation: Codable {
    let double_damage_from: [Elements]
}

struct Elements: Codable {
    let name: String
}

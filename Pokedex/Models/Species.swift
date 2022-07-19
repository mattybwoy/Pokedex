//
//  Species.swift
//  Pokedex
//
//  Created by Matthew Lock on 18/07/2022.
//

import Foundation

struct Species: Codable {
    let evolution_chain: Evolution
    let flavor_text_entries: [Description]
}

struct Evolution: Codable {
    let url: String
}

struct Description: Codable {
    let flavor_text: String
}



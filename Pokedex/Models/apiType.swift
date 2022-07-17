//
//  APIType.swift
//  Pokedex
//
//  Created by Matthew Lock on 17/07/2022.
//

import Foundation

enum APIType: String {
    case onePokemon = "https://pokeapi.co/api/v2/pokemon/?limit=1"
    case pokemonList = "https://pokeapi.co/api/v2/pokemon/?limit=151"
    case pokemonDetail = "https://pokeapi.co/api/v2/pokemon/"
}

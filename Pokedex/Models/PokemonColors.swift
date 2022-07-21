//
//  PokemonColors.swift
//  Pokedex
//
//  Created by Matthew Lock on 18/07/2022.
//

import Foundation
import UIKit

struct PokemonColor {
    
    func pokemonType(type: String) -> UIColor {
        switch type {
        case "bug":
            return UIColor(red: 169/255, green: 185/255, blue: 26/255, alpha: 1)
        case "dragon":
            return UIColor(red: 113/255, green: 53/255, blue: 248/255, alpha: 1)
        case "electric":
            return UIColor(red: 248/255, green: 209/255, blue: 44/255, alpha: 1)
        case "fighting":
            return UIColor(red: 193/255, green: 44/255, blue: 35/255, alpha: 1)
        case "fire":
            return UIColor(red: 240/255, green: 129/255, blue: 44/255, alpha: 1)
        case "flying":
            return UIColor(red: 169/255, green: 145/255, blue: 240/255, alpha: 1)
        case "ghost":
            return UIColor(red: 113/255, green: 87/255, blue: 153/255, alpha: 1)
        case "grass":
            return UIColor(red: 121/255, green: 201/255, blue: 79/255, alpha: 1)
        case "ground":
            return UIColor(red: 225/255, green: 193/255, blue: 104/255, alpha: 1)
        case "ice":
            return UIColor(red: 153/255, green: 217/255, blue: 217/255, alpha: 1)
        case "normal":
            return UIColor(red: 169/255, green: 170/255, blue: 121/255, alpha: 1)
        case "poison":
            return UIColor(red: 161/255, green: 62/255, blue: 161/255, alpha: 1)
        case "psychic":
            return UIColor(red: 248/255, green: 87/255, blue: 137/255, alpha: 1)
        case "rock":
            return UIColor(red: 185/255, green: 161/255, blue: 53/255, alpha: 1)
        default:
            return UIColor(red: 104/255, green: 145/255, blue: 240/255, alpha: 1)
        }
    }
    
}

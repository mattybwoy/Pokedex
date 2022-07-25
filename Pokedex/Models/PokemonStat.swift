//
//  ChartStruct.swift
//  Pokedex
//
//  Created by Matthew Lock on 25/07/2022.
//

import Foundation
import PrettyAxis

struct PokemonStat: Decodable {
    let stat: String
    let value: Int
}


extension PokemonStat: Axisable {
    var x: String {
        return stat
    }
    
    var y: Double {
        return Double(value)
    }
    
    var z: AnyHashable? { return nil}
    var group: AnyHashable? { return nil}
}

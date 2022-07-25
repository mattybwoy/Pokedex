//
//  ChartView.swift
//  Pokedex
//
//  Created by Matthew Lock on 23/07/2022.
//

import SwiftUI
import PrettyAxis


struct ChartView: View {
    
    public var pokemonColorType: String
    
    var pokemonData = [PokemonStat(stat: "atk", value: 49), PokemonStat(stat: "def", value: 49), PokemonStat(stat: "s.atk", value: 65), PokemonStat(stat: "s.def", value: 65), PokemonStat(stat: "spd", value: 45)]
    
    var body: some View {
        
        AxisView(style: .bar, data: pokemonData)
            .fill(Color(PokemonColor().pokemonType(type: pokemonColorType)))
            .fromZero(true)
            .xAxisLabelColor(Color.black)
            .referenceLine(style: ReferenceLineStyle(axisColor: Color.black))
            .spacing(35)
            .enableLegend(true, style: LegendStyle(labelColor: Color.black))
            .xAxisLabelFont(.custom("PokemonGB", size: 8)).lineLimit(1)
    }
}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(pokemonColorType: "green")
    }
}

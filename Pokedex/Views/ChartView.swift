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
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        if let selectedPokemonStats = vm.pokemonStats {
            AxisView(style: .bar, data: selectedPokemonStats)
                .fill(Color(PokemonColor().pokemonType(type: pokemonColorType)))
                .fromZero(true)
                .xAxisLabelColor(Color.black)
                .referenceLine(style: ReferenceLineStyle(axisColor: Color.black))
                .spacing(35)
                .enableLegend(true, style: LegendStyle(labelColor: Color.black))
                .xAxisLabelFont(.custom("PokemonGB", size: 8)).lineLimit(1)
        }
    }
}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(pokemonColorType: "green", vm: ViewModel())
    }
}

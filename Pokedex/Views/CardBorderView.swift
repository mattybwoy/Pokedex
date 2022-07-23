//
//  CardBorderView.swift
//  Pokedex
//
//  Created by Matthew Lock on 19/07/2022.
//

import SwiftUI

struct CardBorderView: View {
    
    public var pokemonColorType: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
        
            .stroke(Color(PokemonColor().pokemonType(type: pokemonColorType)), lineWidth: 40)
            .border(Color.black, width: 10).cornerRadius(12)
            .frame(width: 330, height: 670)
            .foregroundColor(.clear)
            .background(RadialGradient(gradient: Gradient(colors: [Color.white, Color("background")]), center: UnitPoint(x: 0.5, y: 0.3), startRadius: 10, endRadius: 200))
            
    }
}

struct CardBorderView_Previews: PreviewProvider {
    static var previews: some View {
        CardBorderView(pokemonColorType: "grass")
    }
}

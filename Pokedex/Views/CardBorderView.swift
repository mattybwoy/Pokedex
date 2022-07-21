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
            .stroke(Color(PokemonColor().pokemonType(type: pokemonColorType)), lineWidth: 8)
            .frame(width: 300, height: 650)
            .foregroundColor(.clear)
            .background(RadialGradient(gradient: Gradient(colors: [Color.gray, Color("background")]), center: .center, startRadius: 20, endRadius: 250))
    }
}

struct CardBorderView_Previews: PreviewProvider {
    static var previews: some View {
        CardBorderView(pokemonColorType: "grass")
    }
}

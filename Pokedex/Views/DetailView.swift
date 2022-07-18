//
//  DetailView.swift
//  Pokedex
//
//  Created by Matthew Lock on 18/07/2022.
//

import SwiftUI

struct DetailView: View {
    
    private var pokemonChakra = PokemonColor()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color(pokemonChakra.pokemonType(type: "green")), lineWidth: 8)
            .frame(width: 300, height: 650)
            .foregroundColor(.clear)
            
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

//
//  PokemonBioView.swift
//  Pokedex
//
//  Created by Matthew Lock on 19/07/2022.
//

import SwiftUI

struct PokemonBioView: View {
    
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        AsyncImage(url: URL(string: "/\(vm.selectPokemon?.sprites)")) { image in
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        } placeholder: {
            ProgressView()
                .frame(width: 250, height: 250)
        }
    }
}

struct PokemonBioView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBioView(pokemon: Pokemon(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
            .environmentObject(ViewModel())
    }
}

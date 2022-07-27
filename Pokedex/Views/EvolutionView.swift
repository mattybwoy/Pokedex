//
//  EvolutionView.swift
//  Pokedex
//
//  Created by Matthew Lock on 26/07/2022.
//

import SwiftUI

struct EvolutionView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            Text("Evolution Chain")
                .font(.custom("PokemonGB", size: 15))
                .baselineOffset(-5)
                .padding(.bottom, 5)
            HStack {
                ForEach(vm.pokemonChainArray, id: \.self) { pokemon in
                    AsyncImage(url: URL(string: pokemon)) { image in
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                        }
                    } placeholder: {
                        ProgressView()
                            .frame(width: 70, height: 70)
                    }
                    if pokemon == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png" {
                        Text("?")
                            .font(.custom("PokemonGB", size: 18))
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionView(vm: ViewModel())
    }
}

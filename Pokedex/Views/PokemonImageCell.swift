//
//  PokemonImageCell.swift
//  Pokedex
//
//  Created by Matthew Lock on 13/07/2022.
//

import SwiftUI

struct PokemonImageCell: View {
    
    @ObservedObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(id: pokemon)).png")) { image in
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        } placeholder: {
            ProgressView()
                .frame(width: 100, height: 100)
        }
        .background(.thinMaterial)
        .clipShape(Circle())
    }
}

struct PokemonImageCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageCell(vm: ViewModel(), pokemon: Pokemon(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
            .environmentObject(ViewModel())
    }
}

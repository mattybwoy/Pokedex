//
//  PokemonBioView.swift
//  Pokedex
//
//  Created by Matthew Lock on 19/07/2022.
//

import SwiftUI

struct PokemonBioView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        if let selected = vm.selectPokemon {
            AsyncImage(url: URL(string: "\(selected.sprites.front_default)")) { image in
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
}

struct PokemonBioView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBioView(vm: ViewModel())
            .environmentObject(ViewModel())
    }
}

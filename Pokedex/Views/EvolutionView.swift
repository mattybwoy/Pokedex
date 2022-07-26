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
            }
        }
    }
}

struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionView(vm: ViewModel())
    }
}

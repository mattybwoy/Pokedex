//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Matthew Lock on 23/07/2022.
//

import SwiftUI

struct PokemonTypeView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        HStack {
            VStack {
                Text("Type")
                    .baselineOffset(-5)
                    .font(.custom("PokemonGB", size: 12))
                    .padding(.top, 5)
                ForEach(vm.pokemonTypes, id: \.self) { nature in
                    Image(nature.type.name)
                        .resizable()
                        .frame(width: 50, height: 20)
                }
            }
            .padding(.horizontal, 30)
            VStack {
                Text("Weak to")
                    .baselineOffset(-5)
                    .font(.custom("PokemonGB", size: 12))
                HStack {
                    ForEach(vm.pokemonWeaknesses, id: \.self) { weakness in
                        Image("\(weakness)Type")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
        .frame(width: 320, height: 50)
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeView(vm: ViewModel())
    }
}

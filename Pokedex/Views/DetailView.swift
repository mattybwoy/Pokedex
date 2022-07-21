//
//  DetailView.swift
//  Pokedex
//
//  Created by Matthew Lock on 18/07/2022.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            CardBorderView()
            VStack {
                if let selected = vm.selectPokemon {
                    Text("\(selected.stats[0].base_stat)HP")
                        .baselineOffset(-5)
                        .offset(x: 90, y: -128)
                        .font(.custom("PokemonGB", size: 15))
                    Text(selected.name)
                        .font(.custom("PokemonGB", size: 23))
                    PokemonBioView(vm: vm)
                    Text("Height: " + "\(vm.pokemonHeight) cm")
                        .font(.custom("PokemonGB", size: 12))
                    Text("Weight: " + "\(vm.pokemonWeight) kg")
                        .font(.custom("PokemonGB", size: 12))
                    Divider().frame(width: 200)
                        .background(.black)
                }

            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: ViewModel())
    }
}

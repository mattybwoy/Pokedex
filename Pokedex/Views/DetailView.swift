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
            if let selected = vm.selectPokemon {
                CardBorderView(pokemonColorType: selected.types[0].type.name)
                VStack {
                    HStack {
                        Image("\(selected.types[0].type.name)Type")
                            .resizable()
                            .offset(y: -10)
                            .frame(width: 50, height: 50)
                            .padding(.horizontal, 80)
                        Spacer()
                        Text("\(selected.stats[0].base_stat)HP")
                            .baselineOffset(-5)
                            .offset(y: -10)
                            .font(.custom("PokemonGB", size: 15))
                            .padding(.trailing, 80)
                    }
                    Text(selected.name)
                        .font(.custom("PokemonGB", size: 23))
                        .baselineOffset(-5)
                    PokemonBioView(vm: vm)
                        .offset(y: -20)
                    Text("No: \(selected.id)")
                        .font(.custom("PokemonGB", size: 18))
                        .padding(.bottom, 5)
                    Text("Height: " + "\(vm.pokemonHeight) cm")
                        .font(.custom("PokemonGB", size: 12))
                    Text("Weight: " + "\(vm.pokemonWeight) kg")
                        .font(.custom("PokemonGB", size: 12))
                    Divider().frame(width: 250)
                        .background(.black)
                    TabView {
                        DescriptionView(vm: vm)
                        Text("Bananas")
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(width: 270, height: 130)
                    Divider().frame(width: 250)
                        .background(.black)
                    PokemonTypeView(vm: vm)
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

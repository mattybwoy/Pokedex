//
//  ContentView.swift
//  Pokedex
//
//  Created by Matthew Lock on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                HeaderView()
                NavigationView {
                    List {
                        ForEach(searchText == "" ? vm.pokemonList : vm.pokemonList.filter( {$0.name.contains(searchText.lowercased())} )) { pokemon in
                            HStack {
                                NavigationLink(destination: Text("Pokemon name is \(pokemon.name)"))
                                {
                                    HStack {
                                        Text("\(vm.getPokemonID(id: pokemon)).")
                                            .font(.custom("PokemonGB", size: 13))
                                            .baselineOffset(-5)
                                            .padding()
                                        Text(pokemon.name)
                                            .font(.custom("PokemonGB", size: 13))
                                            .baselineOffset(-5)
                                        Spacer()
                                        PokemonImageCell(pokemon: pokemon)
                                    }

                                }

                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        Task.init {
                            try await vm.setup()
                        }
                    }
                    .searchable(text: $searchText, prompt: "search")
                    .font(.custom("PokemonGB", size: 20))
                    Spacer()
                }
                .environmentObject(vm)
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

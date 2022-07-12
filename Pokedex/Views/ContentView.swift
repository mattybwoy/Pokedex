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
                                Text(pokemon.name)
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        Task.init {
                            await vm.setup()
                        }
                    }
                    .searchable(text: $searchText, prompt: "search")
                    .font(.custom("PokemonGB", size: 20))
                    Spacer()
                }
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

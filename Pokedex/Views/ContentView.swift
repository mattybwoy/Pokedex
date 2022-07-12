//
//  ContentView.swift
//  Pokedex
//
//  Created by Matthew Lock on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokemonList = DataManager.sharedInstance
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                HeaderView()
                NavigationView {
                    List {
                        ForEach(searchText == "" ? pokemonList.pokelist : pokemonList.pokelist.filter( {$0.name.contains(searchText.lowercased())} )) { pokemon in
                            Text(pokemon.name)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        async {
                            await DataManager.sharedInstance.testAPI()
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

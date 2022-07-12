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
                    List(pokemonList.pokelist, id: \.self) { pokemon in
                        Text(pokemon.name)
                }
                    .navigationBarTitleDisplayMode(.inline)
                }
                .searchable(text: $searchText)
                

                Spacer()
            }
        }
        .onAppear {
            async {
                await DataManager.sharedInstance.testAPI()
                
        }
    }
        
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

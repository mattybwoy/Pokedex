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
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("background"))
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .darkGray
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .white
        UINavigationBar.appearance().tintColor = .darkGray
    }
    
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
                                NavigationLink(destination: DetailView(vm: vm)
                                    .onAppear {
                                        Task.init {
                                            try await vm.setupSelectedPokemonView(pokemonID: vm.getPokemonID(id: pokemon))
                                        }
                                    }.onDisappear {
                                        vm.selectPokemon = nil
                                    })
                                {
                                    HStack {
                                        Text("\(vm.getPokemonID(id: pokemon)).")
                                            .font(.custom("PokemonGB", size: 13))
                                            .baselineOffset(-5)
                                            .scaledToFill()
                                            .minimumScaleFactor(0.3)
                                            .lineLimit(1)
                                            .padding()
                                        Text(pokemon.name)
                                            .font(.custom("PokemonGB", size: 13))
                                            .baselineOffset(-5)
                                            .scaledToFill()
                                            .minimumScaleFactor(0.3)
                                            .lineLimit(1)
                                        Spacer()
                                        PokemonImageCell(vm: vm, pokemon: pokemon)
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color.gray)
                        .background(Color("background"))
                        .foregroundColor(Color.black)
                        .cornerRadius(15)
                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.8)), radius: 15, x: 0, y: 5)
                        
                        NavigationLink(destination: EmptyView()) { // <---- Here
                                            EmptyView()
                                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        Task.init {
                            try await vm.setup()
                        }
                    }
                    .searchable(text: $searchText, prompt: "search")
                    .foregroundColor(Color.white)
                    .animation(.default, value: searchText)
                    .tint(Color(UIColor.white))
                    .disableAutocorrection(true)
                    .accessibilityIdentifier("searchBar")
                    .font(.custom("PokemonGB", size: 20))
                    Spacer()
                }
                .environmentObject(vm)
            }
            .background(.red)
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

//
//  PokemonBioView.swift
//  Pokedex
//
//  Created by Matthew Lock on 19/07/2022.
//

import SwiftUI
import NukeUI

struct PokemonBioView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        if let selected = vm.selectPokemon {
            LazyImage(url: URL(string: ("\(selected.sprites.front_default)")), resizingMode: .aspectFill)
            .frame(width: 220, height: 220)
            
        }
    }
}

struct PokemonBioView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBioView(vm: ViewModel())
            .environmentObject(ViewModel())
    }
}

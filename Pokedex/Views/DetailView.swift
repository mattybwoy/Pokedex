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
            Color(.lightGray)
                .ignoresSafeArea()
            CardBorderView()
            VStack {
                if let selected = vm.selectPokemon {
                    Text(selected.name)
                    .font(.custom("PokemonGB", size: 20))
                    PokemonBioView(vm: vm)
                    
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

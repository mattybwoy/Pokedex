//
//  DescriptionView.swift
//  Pokedex
//
//  Created by Matthew Lock on 22/07/2022.
//

import SwiftUI

struct DescriptionView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        if let description = vm.pokemonDescription {
            Text(description)
                .font(.custom("PokemonGB", size: 15))
                .baselineOffset(-5)
                .frame(alignment: .topTrailing)
                .minimumScaleFactor(0.5)

        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(vm: ViewModel())
    }
}

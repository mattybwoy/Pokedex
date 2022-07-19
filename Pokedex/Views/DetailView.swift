//
//  DetailView.swift
//  Pokedex
//
//  Created by Matthew Lock on 18/07/2022.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm: ViewModel
    
    var body: some View {
        CardBorderView()
        Text(vm.selectPokemon?.name ?? "Matthew")
    }
        
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: ViewModel())
    }
}

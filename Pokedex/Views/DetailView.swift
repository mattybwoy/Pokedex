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
        ZStack{
            Color(.lightGray)
                .ignoresSafeArea()
            CardBorderView()
            VStack {
                Text(vm.selectPokemon?.name ?? "Matthew")
                AsyncImage(url: URL(string: "\(vm.selectPokemon?.sprites)")) { image in
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: 250, height: 250)
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

//
//  HeaderView.swift
//  Pokedex
//
//  Created by Matthew Lock on 06/07/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        HStack {
            Spacer()
            Image("pokeball")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(x: 0, y: 10)

                Text("\nPokedex")
                    .font(.custom("PokemonGB", size: 30))
                    .foregroundColor(.white)
                    .padding()
            
            Image("pokeball")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(x: 0, y: 10)
            Spacer()
        }
        .background(Color("headerBackground"))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

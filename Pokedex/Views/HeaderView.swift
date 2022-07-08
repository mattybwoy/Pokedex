//
//  HeaderView.swift
//  Pokedex
//
//  Created by Matthew Lock on 06/07/2022.
//

import SwiftUI

struct HeaderView: View {
    @State private var animating = false
    
    var body: some View {
        
        HStack {
            Spacer()
            Image("pokeball")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(y: animating ? 5: -5)

                Text("Pokedex")
                    .font(.custom("PokemonGB", size: 30))
                    .baselineOffset(-5)
                    .foregroundColor(.white)
                    .padding()
            
            Image("pokeball")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(y: animating ? 5 : -5)
            
            Spacer()
        }
        .background(Color("headerBackground"))
        .onAppear {
            animate()
        }
    }
    
    func animate() {
        withAnimation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
            animating.toggle()
        }
    }
        
        
}



struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

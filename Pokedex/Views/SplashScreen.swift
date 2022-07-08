//
//  SplashScreen.swift
//  Pokedex
//
//  Created by Matthew Lock on 07/07/2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var writing = false
    @State private var movingCursor = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("Initializing Pokédex")
                            .baselineOffset(-5)
                            .multilineTextAlignment(.center)
                            .font(.custom("PokemonGB", size: 20))

                        HStack {
                            Image("pokeball")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                            Image("pokeball")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                            Image("pokeball")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                        }
                        .mask(Rectangle().offset(x: writing ? 0 : -150))
                        Rectangle()
                        .opacity(0)
                        .frame(width: 2, height: 24)
                        .offset(x: movingCursor ? 148 : 0)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                            writing.toggle()
                            movingCursor.toggle()
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
            }
            }
        }

    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

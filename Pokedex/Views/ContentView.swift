//
//  ContentView.swift
//  Pokedex
//
//  Created by Matthew Lock on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                HeaderView()
                Spacer()
            }
        }
        .onAppear {
            async {
                let pokemonList = await DataManager.sharedInstance.testAPI()
                print("This is the List" + "\(pokemonList)")
        }
    }
        
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

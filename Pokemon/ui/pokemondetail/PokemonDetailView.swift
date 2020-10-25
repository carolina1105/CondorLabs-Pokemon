//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import SwiftUI

struct PokemonDetailView: View {
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .navigationBarTitle(Text("Generation Pokémon"), displayMode: .inline)
        .foregroundColor(Color.nSecondary)
        .navigationBarColor(UIColor.nThird)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}

//
//  ContentView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            PokemonListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

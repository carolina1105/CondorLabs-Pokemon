//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var pokemonVM = PokemonListViewModel.shared

    
    var body: some View {
        VStack{
            Text("Pokemón")
                .titleFont()
            SectionSpacerView(text: "List of Breeds")
                .padding(.top, 30)
            VStack {
                ListPageView(values: self.$pokemonVM.pokemon,
                             isLoading: $pokemonVM.isLoading,
                             nextPage: {self.pokemonVM.getPokemonByPage()}) { pokemon in
                    Text(pokemon.name)
                }
            }
            Spacer()
        }.onAppear{
            pokemonVM.pokemonList {
                
            } failure: {
                
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

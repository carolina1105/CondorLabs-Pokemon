//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import SwiftUI

class PokemonListViewModel: ObservableObject {
    static let shared = PokemonListViewModel()
    
    var count = 0
    var poke: [PokemonModel] = []
    var repository = PokemonListRepository.shared
    var repositoryPokemonDetail = PokemonDetailRepository.shared
    private var nextPage: Int = 0    
    
    @Published var pokemon: [PokemonModel] = []
    @Published var isLoading: Bool = false
    @Published var activeSection: Int? = nil
    @Published var namePokemon: String = ""
    @Published var pokemonDetail: PokemonDetailModel = .empty
    @Published var showAlert: Bool = false
    @Published var messageAlert: String = ""
    @Published var titleMessage: String = ""

    func pokemonList() {
        isLoading = true
        pokemon = []
        repository.pokemonList(page: nil) { data in
            for row in data.results {
                self.count = self.count + 1
                self.poke.append(PokemonModel(id: self.count, name: row.name , url: row.url))
            }
            self.pokemon.append(contentsOf: self.poke)
            self.nextPage = self.charArray(text: data.next) 
            self.isLoading = false
        } failure: { error in
            self.isLoading = false
            self.showAlert = true
            self.titleMessage = "Advertencia"
            self.messageAlert = "Se ha producido un error"
        }
    }
    
    func getPokemonByPage()  {
        repository.pokemonList(page: nextPage, 
                               success: { data in 
                                for row in data.results {
                                    self.count = self.count + 1
                                    self.poke.append(PokemonModel(id: self.count, name: row.name , url: row.url))
                                }
                                self.pokemon.append(contentsOf: self.poke)
                                self.nextPage = self.charArray(text: data.next) 
                                self.isLoading = false
                               }, failure: { error in 
                                self.isLoading = false
                                self.showAlert = true
                                self.titleMessage = "Advertencia"
                                self.messageAlert = "Se ha producido un error"
                               })
    }
    
    func charArray(text: String) -> Int {
        let array =  text.components(separatedBy: "=")
        let array2 = array[1].components(separatedBy: "&")
        return Int(array2[0]) ?? .zero
    } 
    
    func pokemonDetail(success: @escaping () -> Void) {
        isLoading = true
        repositoryPokemonDetail.pokemonDetail(name: namePokemon) { data in
            self.pokemonDetail = data
            self.isLoading = false
            success()
        } failure: { error in
            self.isLoading = false
            //TODO: Manejar el caso de error
            print("error.... \(error)")
        }
    }
}

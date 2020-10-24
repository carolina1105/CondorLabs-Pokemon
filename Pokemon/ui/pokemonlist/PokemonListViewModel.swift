//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import SwiftUI
import Firebase
import UIKit

class PokemonListViewModel: ObservableObject {
    static let shared = PokemonListViewModel()
    
    let defaults = DefaultsConfig.shared
    let keychain = KeychainConfig.shared
    var count = 0
    var poke: [PokemonModel] = []
    var repository = PokemonListRepository.shared
    private var nextPage: Int = 0
    
    
    @Published var pokemon: [PokemonModel] = []
    @Published var isLoading: Bool = false
    
    func pokemonList(success: @escaping () -> Void,
                     failure: @escaping () -> Void) {
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
            print("error.... \(error)")
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
                               }, failure: {_ in 
                                self.isLoading = false
                               })
    }
    
    func charArray(text: String) -> Int {
        
        print(text.split(separator: " ", omittingEmptySubsequences: false))
        let array =  text.components(separatedBy: "=")
        let array2 = array[1].components(separatedBy: "&")
        print(text.components(separatedBy: "="))
        print(array2)
        
        print("iiiii. \(text)")
        return Int(array2[0]) ?? 0
        
    }
    
    
    
}

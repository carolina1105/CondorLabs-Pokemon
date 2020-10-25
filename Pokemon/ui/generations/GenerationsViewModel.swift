//
//  GenerationsPokemonViewModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import SwiftUI
import Firebase
import UIKit

class GenerationsViewModel: ObservableObject {
    static let shared = GenerationsViewModel()
    
    let defaults = DefaultsConfig.shared
    let keychain = KeychainConfig.shared
    var count = 0
    var poke: [PokemonModel] = []
    var repository = GenerationRepository.shared
    private var nextPage: Int = 0
    
    
    @Published var generations: [PokemonModel] = []
    @Published var isLoading: Bool = false
    @Published var activeSection: Int? = nil
    @Published var type: Int = 0
    @Published var message: String = "Please select the generation of the Pokémon"

    func getGenerations(type: Int) {
        self.type = type
        isLoading = true
        generations = []
        repository.generations(type: self.type) { data in
            self.message = ""
            self.generations = data.pokemonSpecies
            self.isLoading = false
        } failure: { message in
            self.isLoading = false
            //TODO: Manejar el caso de error
            print("error.... \(message)")  
        }
    }
    
}

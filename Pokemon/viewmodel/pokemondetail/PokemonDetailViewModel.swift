//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    static let shared = PokemonDetailViewModel()
    
    var repository = PokemonDetailRepository.shared
    
    @Published var namePokemon: String = ""
    @Published var isLoading: Bool = false

    
}

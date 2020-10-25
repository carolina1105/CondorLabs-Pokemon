//
//  GenerationResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct GenerationResDTO: Codable {
    
    var name: String
    var pokemonSpecies: [PokemonResDTO]
    
    private enum CodingKeys: String, CodingKey {
        case name 
        case pokemonSpecies = "pokemon_species"
    }
    
}

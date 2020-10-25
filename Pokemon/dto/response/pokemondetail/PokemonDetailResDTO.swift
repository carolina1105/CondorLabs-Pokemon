//
//  PokemonDetailResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct PokemonDetailResDTO: Codable {
    
    var sprites: SpritesResDTO
    var types: [PokemonTypeResDTO]
    var height: Int
    var weight: Int
    var moves: [MovesResDTO]
    
    
    private enum CodingKeys: String, CodingKey {
        case sprites 
        case types
        case height
        case weight
        case moves
    }
    
}



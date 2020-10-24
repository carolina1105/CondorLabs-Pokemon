//
//  PokemonResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct PokemonResDTO: Codable {
    
    var name: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name 
        case url
    }
    
}

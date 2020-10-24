//
//  PokemonPageResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct PokemonPageResDTO: Codable {
    var count: Int
    var next: String
    var previous: String?
    var results: [PokemonResDTO]

    private enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

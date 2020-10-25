//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct PokemonModel: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var url: String

    
    init(id: Int = Int.random(in: 1...200),
         name: String = "",
         url: String = "") {
        self.id = id
        self.name = name
        self.url = url
    }
    
    static func toModel(dto: PokemonResDTO) -> PokemonModel {
        let model = PokemonModel(name: dto.name, 
                                 url: dto.url)
        return model
    }
    
    static func toModels(dto: [PokemonResDTO]) -> [PokemonModel] {
        return dto.map {
            toModel(dto: $0)
        }
    }
}

//
//  PokemonTypeModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct PokemonTypeModel: Codable, Hashable {
    var slot: Int
    var type: PokemonModel
    
    init(slot: Int,
         type: PokemonModel) {
        self.slot = slot
        self.type = type
    }
    
    static func toModel(dto: PokemonTypeResDTO) -> PokemonTypeModel {
        let model = PokemonTypeModel(slot: dto.slot, 
                                     type: PokemonModel.toModel(dto: dto.type))
        return model
    }
    
    static func toModels(dto: [PokemonTypeResDTO]) -> [PokemonTypeModel] {
        return dto.map {
            toModel(dto: $0)
        }
    }
}

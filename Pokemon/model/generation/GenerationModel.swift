//
//  GenerationModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct GenerationModel: Codable, Hashable  {
    
    var name: String
    var pokemonSpecies: [PokemonModel]
    
    init(name: String = "",
         pokemonSpecies: [PokemonModel] = []) {
        self.name = name
        self.pokemonSpecies = pokemonSpecies
    }
    
    static func toModel(dto: GenerationResDTO) -> GenerationModel {
        let model = GenerationModel(name: dto.name, 
                                    pokemonSpecies: PokemonModel.toModels(dto: dto.pokemonSpecies))
        return model
    }

}



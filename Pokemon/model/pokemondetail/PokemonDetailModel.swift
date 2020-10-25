//
//  PokemonDetailModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct PokemonDetailModel: Codable, Hashable {
    var sprites: SpritesModel
    var types: [PokemonTypeModel]
    var height: Int
    var weight: Int
    var moves: [MovesModel]
    
    init(sprites: SpritesModel,
         types: [PokemonTypeModel],
         height: Int, 
         weight: Int,
         moves: [MovesModel]) {
        self.sprites = sprites
        self.types = types
        self.height = height
        self.weight = weight
        self.moves = moves
        
    }
    
    static func toModel(dto: PokemonDetailResDTO) -> PokemonDetailModel {
        let model = PokemonDetailModel(sprites: SpritesModel.toModel(dto: dto.sprites), 
                                       types: PokemonTypeModel.toModels(dto: dto.types),
                                       height: dto.height,
                                       weight: dto.weight, 
                                       moves: MovesModel.toModels(dto: dto.moves))
        return model
    }
}


extension PokemonDetailModel {
    static var empty = PokemonDetailModel(sprites: SpritesModel(backDefault: "", 
                                                                backFemale: "", 
                                                                backShiny: "", 
                                                                frontDefault: "", 
                                                                frontFemale: "", 
                                                                otherSprite: OtherSpriteModel(officialArtwork: OfficialArtworkModel(frontDefault: ""))), 
                                          types: [PokemonTypeModel(slot: .zero, type: .empty)],
                                          height: .zero,
                                          weight: .zero, 
                                          moves: [])
}

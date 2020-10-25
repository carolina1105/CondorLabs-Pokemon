//
//  SpritesModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct SpritesModel: Codable, Hashable {
    var backDefault: String?
    var backFemale: String?
    var backShiny: String?
    var frontDefault: String?
    var frontFemale: String?
    var otherSprite: OtherSpriteModel
    
    
    init(backDefault: String? = "",
         backFemale: String? = "",
         backShiny: String? = "",
         frontDefault: String? = "",
         frontFemale: String? = "",
         otherSprite: OtherSpriteModel) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.otherSprite = otherSprite
    }
    
    static func toModel(dto: SpritesResDTO) -> SpritesModel {
        let model = SpritesModel(backDefault: dto.backDefault, 
                                 backFemale: dto.backFemale, 
                                 backShiny: dto.backShiny, 
                                 frontDefault: dto.frontDefault, 
                                 frontFemale: dto.frontFemale,
                                 otherSprite: OtherSpriteModel.toModel(dto: dto.otherSprite))
        return model
    }
}

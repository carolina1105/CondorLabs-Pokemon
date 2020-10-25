//
//  PokemonDetailModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct PokemonDetailModel: Codable, Hashable {
    var sprites: SpritesModel

    init(sprites: SpritesModel) {
        self.sprites = sprites
        
    }
    
    static func toModel(dto: PokemonDetailResDTO) -> PokemonDetailModel {
        let model = PokemonDetailModel(sprites: SpritesModel.toModel(dto: dto.sprites))
        return model
    }
}


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

struct OtherSpriteModel: Codable, Hashable {
    var officialArtwork: OfficialArtworkModel
    
    init(officialArtwork: OfficialArtworkModel) {
        self.officialArtwork = officialArtwork
    }
    
    static func toModel(dto: OtherSpriteResDTO) -> OtherSpriteModel {
        let model = OtherSpriteModel(officialArtwork:  OfficialArtworkModel.toModel(dto: dto.officialArtwork))
        return model
    }
}

struct OfficialArtworkModel: Codable, Hashable {
    var frontDefault: String
    
    init(frontDefault: String) {
        self.frontDefault = frontDefault
    }
    
    static func toModel(dto: OfficialArtworkResDTO) -> OfficialArtworkModel {
        let model = OfficialArtworkModel(frontDefault: dto.frontDefault)
        return model
    }
}

//
//  SpritesResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct SpritesResDTO: Codable {
    
    var backDefault: String?
    var backFemale: String?
    var backShiny: String?
    var frontDefault: String?
    var frontFemale: String?
    var otherSprite: OtherSpriteResDTO
    
    private enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case otherSprite = "other"
    }
    
}

//
//  PokemonDetailResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

struct PokemonDetailResDTO: Codable {
    
    var sprites: SpritesResDTO
    
    private enum CodingKeys: String, CodingKey {
        case sprites 
    }
    
}

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


struct OtherSpriteResDTO: Codable {
    var officialArtwork: OfficialArtworkResDTO
    
    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }    
}


struct OfficialArtworkResDTO: Codable {
    var frontDefault: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }    
}

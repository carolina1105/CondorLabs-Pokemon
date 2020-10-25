//
//  OtherSpriteResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct OtherSpriteResDTO: Codable {
    var officialArtwork: OfficialArtworkResDTO
    
    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }    
}

//
//  OtherSpriteModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

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

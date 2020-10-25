//
//  OfficialArtworkModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

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

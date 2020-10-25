//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct PokemonModel: Identifiable, Codable, Hashable {
    var id: Int?
    var name: String
    var url: String
    var votingStatus: Int

    init(id: Int? = Int.random(in: 1...200),
         name: String = "",
         url: String = "",
         votingStatus: Int = 0) {
        self.id = id
        self.name = name
        self.url = url
        self.votingStatus = votingStatus
    }
    
    static func toModel(dto: PokemonResDTO) -> PokemonModel {
        let model = PokemonModel(name: dto.name, 
                                 url: dto.url)
        return model
    }
    
    static func toModels(dto: [PokemonResDTO]) -> [PokemonModel] {
        return dto.map {
            toModel(dto: $0)
        }
    }
}

extension PokemonModel {
    static var empty = PokemonModel(id: .zero, 
                                    name: "", 
                                    url: "",
                                    votingStatus: .zero)
}

extension PokemonModel {
    static var mock = PokemonModel(id: 1, 
                                    name: "dunsparce", 
                                    url: "https://pokeapi.co/api/v2/pokemon/206/",
                                    votingStatus: .zero)
}

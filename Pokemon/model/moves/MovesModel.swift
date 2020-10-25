//
//  MoveModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct MovesModel: Codable, Hashable {
    var move: MoveModel
    
    
    init(move: MoveModel) {
        self.move = move
    }
    
    static func toModel(dto: MovesResDTO) -> MovesModel {
        let model = MovesModel(move: MoveModel.toModel(dto: dto.move))
        return model
    }
    
    static func toModels(dto: [MovesResDTO]) -> [MovesModel] {
        return dto.map {
            toModel(dto: $0)
        }
    }
}


struct MoveModel: Codable, Hashable {
    var name: String
    var url: String
    
    
    init(name: String = "",
         url: String = "") {
        self.name = name
        self.url = url
    }
    
    static func toModel(dto: MoveResDTO) -> MoveModel {
        let model = MoveModel(name: dto.name, 
                              url: dto.url)
        return model
    }
    
    static func toModels(dto: [MoveResDTO]) -> [MoveModel] {
        return dto.map {
            toModel(dto: $0)
        }
    }
}

extension MoveModel {
    static var empty = MoveModel(name: "", 
                                 url: "")
}

extension MoveModel {
    static var mock = MoveModel(name: "tackle", 
                                url: "https://pokeapi.co/api/v2/move/33/")
}

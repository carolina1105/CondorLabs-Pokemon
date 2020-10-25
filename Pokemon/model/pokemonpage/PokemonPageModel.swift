//
//  PokemonPageModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct PokemonPageModel: Codable, Equatable {
    var count: Int
    var next: String
    var previous: String
    var results: [PokemonModel]
    
    init(count: Int,
         next: String = "",
         previous: String = "",
         results: [PokemonModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    init() {
        self.count = .zero
        self.next = ""
        self.previous = ""
        self.results = []
    }
    
    mutating func set(count: Int,
                      next: String,
                      previous: String,
                      results: [PokemonModel])  {
        self.count = count
        self.next = next
        self.previous = previous
        self.results.append(contentsOf: results)
    }
    
    static func toModel(dto: PokemonPageResDTO) -> PokemonPageModel {
        let model = PokemonPageModel(count: dto.count, 
                                     next: dto.next, 
                                     previous: dto.previous ?? "", 
                                     results: PokemonModel.toModels(dto: dto.results))
        return model
    }
}


extension PokemonPageModel {
    static var mock = PokemonPageModel(count: 200 ,
                                       next: "100", 
                                       previous: "10", 
                                       results: [PokemonModel(id: 1, 
                                                              name: "dunsparce", 
                                                              url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                              votingStatus: .zero),
                                                 PokemonModel(id: 1, 
                                                              name: "pikachu", 
                                                              url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                              votingStatus: .zero),
                                                 PokemonModel(id: 1, 
                                                              name: "sneasel", 
                                                              url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                              votingStatus: .zero),
                                                 PokemonModel(id: 1, 
                                                              name: "ursaring", 
                                                              url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                              votingStatus: .zero)])
}

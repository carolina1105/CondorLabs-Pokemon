//
//  PokemonListWS.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

class PokemonListWS {
    
    static let shared = PokemonListWS()
    let endPoints = Constant.default    
    var manager = ManagerWS.shared
    
    func pokemonList(page: String,
                     limit: Int = 10,
                     completion: @escaping (PokemonPageResDTO?, ErrorDTO?) -> Void ) {
        let pageNext: Int = Int(page) ?? .zero
        let url = endPoints.serverUrl + String(format: endPoints.pokemonPage, limit, pageNext)
        
        manager.make2(url: url, 
                      method: .get, 
                      success: { data in 
                        let pokemon: PokemonPageResDTO? = ResDTO.toDTO(data: data)
                        if pokemon != nil {
                            completion(pokemon, nil)
                            return
                        }
                      }) { (nil, error) in
        }
    }
}

//
//  PokemonDetailWS.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

class PokemonDetailWS {
    
    static let shared = PokemonDetailWS()
    let endPoints = Constant.default    
    var manager = ManagerWS.shared
    
    func pokemonDetail(name: String,
                       completion: @escaping (PokemonDetailResDTO?, ErrorDTO?) -> Void ) {
        let url = endPoints.serverUrl + String(format: endPoints.pokemonDetail, name)
        
        manager.make(url: url, 
                      method: .get, 
                      success: { data in 
                        let pokemon: PokemonDetailResDTO? = ResDTO.toDTO(data: data)
                        if pokemon != nil {
                            completion(pokemon, nil)
                            return
                        }
                      }) { (nil, error) in
        }
    }
}

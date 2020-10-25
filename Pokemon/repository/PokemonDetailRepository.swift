//
//  PokemonDetailRepository.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation
import RealmSwift
import RxRealm

class PokemonDetailRepository {
    
    static let shared = PokemonDetailRepository()
    var errorUtility = ErrorUtility.shared
    
    private var manager = PokemonDetailWS.shared
    private var database = PokemonDB.shared
    private var defaults = DefaultsConfig.shared
    private var fileManager = FileManager.default
    
    func pokemonDetail(name: String,
                       success: @escaping (PokemonDetailModel) -> Void,
                       failure: @escaping (String) -> Void) {
        manager.pokemonDetail(name: name) { (detail, error) in
            if error != nil {
                failure(error!.error)
                return
            }
            if detail != nil {
                let model = PokemonDetailModel.toModel(dto: detail!)
                success(model)
                return
            } else {
                print("Error")
            }
            failure("error@@")
        }
        
    }
    
    func dispose(with id: AnyHashable) {
        //        database.dispose(by: id)//TODO
    }
}

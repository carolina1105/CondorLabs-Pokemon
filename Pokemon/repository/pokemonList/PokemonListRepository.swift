//
//  PokemonListRepository.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import RealmSwift
import RxRealm

class PokemonListRepository {
    
    static let shared = PokemonListRepository()
    var errorUtility = ErrorUtility.shared
    
    private var manager = PokemonListWS.shared
    private var database = PokemonDB.shared
    private var fileManager = FileManager.default
    
    func pokemonList(page: Int? = nil,
                     limit: Int? = nil,
                     success: @escaping (PokemonPageModel) -> Void,
                     failure: @escaping (String) -> Void) {
        manager.pokemonList(page: String(page ?? 0),
                            limit: limit ?? 20) { data, error in
            if error != nil {
                failure(error!.error)
                return
            }
            if data != nil {
                let model = PokemonPageModel.toModel(dto: data!)
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

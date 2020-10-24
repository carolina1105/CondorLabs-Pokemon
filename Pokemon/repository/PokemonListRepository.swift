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
    private var defaults = DefaultsConfig.shared
    private let contactPathContact: String = "Contact/"
    private var fileManager = FileManager.default
    private let contactName: String = "Contact%@.png"
    
//    func load(with id: AnyHashable,
//              didChanges: @escaping (RealmChangeset, [PokemonModel]) -> Void) {
//        database.load(with: id) { pokemons, changes in
//            didChanges(changes, PokemonModel.toModels(entities: pokemons.toArray()))
//        }
//    }
    
//    func sync(success: @escaping ([PokemonModel]) -> Void,
//              _ failure: @escaping (String) -> Void) {
////        manager.breedsList(completion: T##([PokemonResDTO], PokemonErrorResDTO?, ErrorDTO?) -> Void)
//        manager.breedsList { response, error  in
//            DispatchSyncMainThreadSafe {
//                if error != nil {
//                    failure(error!.error)
//                    return
//                }
//                var pokemons: [Pokemon] = []
//                for dto in response {
//                    let pokemon = Pokemon.toModel(dto: dto)
//                    pokemons.append(pokemon)
//                }
//                success(pokemons)
////                self.save(contacts: contacts) //**verify
//
//                success([])
//            }
//        }
//    }
    
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
                print("model= success \(model.results.count)")
                success(model)
                return
            } else {
                print("Error in CommentaryRepository by getComments")
            }
            failure("error@@")
        }
    }
 
    func dispose(with id: AnyHashable) {
//        database.dispose(by: id)//TODO
    }
}

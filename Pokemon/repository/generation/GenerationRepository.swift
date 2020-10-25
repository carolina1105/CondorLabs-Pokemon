//
//  GenerationRepository.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation
import RealmSwift
import RxRealm

class GenerationRepository {
    
    static let shared = GenerationRepository()
    var errorUtility = ErrorUtility.shared
    
    private var manager = GenerationWS.shared
    private var database = PokemonDB.shared
    private var fileManager = FileManager.default
    
    func generations(type: Int,
                     success: @escaping (GenerationModel) -> Void,
                     failure: @escaping (String) -> Void) {
        manager.generations(type: type) { (generations, error) in
            if error != nil {
                failure(error!.error)
                return
            }
            if generations != nil {
                let model = GenerationModel.toModel(dto: generations!)
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

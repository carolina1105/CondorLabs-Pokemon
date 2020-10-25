//
//  PokemonDB.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import RealmSwift

class PokemonDB {
    
    static let shared = PokemonDB()
    let byId = "SELF.id == %d"
    let byName = "SELF.name == %d"
    let byVotingStatus = "SELF.votingStatus == %d"

    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    func pokemon(by id: Int) -> PokemonEntity {
        guard let entitiy = realm.objects(PokemonEntity.self).filter(byId, id).first else {
            return PokemonEntity()
        }
        return entitiy
    }
    
    func pokemon(name: String) -> PokemonEntity? {
        guard let entitiy = realm.objects(PokemonEntity.self).filter(byName, name).first else {
            return nil
        }
        return entitiy
    }
//    func pokemon(vottingSucces: Int) -> PokemonEntity? {
//        let entitiy : PokemonEntity?
//
//        guard let isEntitiy: Bool = realm.objects(PokemonEntity.self).filter(byVotingStatus, 1).count > 0 else {
//            return nil
//        }
//        if isEntitiy {
//            entitiy =  realm.objects(PokemonEntity.self).filter(byVotingStatus, 1)
//        }
//
//        return entitiy
//    }
    
    func update(by id: Int64,
                status: Int) {
        DispatchSyncMainThreadSafe {
            guard let entity = realm.objects(PokemonEntity.self).filter(byName, id).first else {
                return
            }
            realm.writeAsync(obj: entity,
                             block: { realm, thread in
                                guard let entity = thread else {
                                    return
                                }
                                entity.votingStatus = status
            }) { error in
                print(error)
            }
        }
    }
    
    func save(pokemon: PokemonEntity) {
        try! realm.write {
            realm.add(pokemon)
        }
    }
    
    func delete(by id: Int64){
        try! realm.write {
            realm.delete(realm.objects(PokemonEntity.self).filter(byId, id))
        }
    }
}

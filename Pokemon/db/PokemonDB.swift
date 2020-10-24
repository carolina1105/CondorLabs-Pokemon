//
//  PokemonDB.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import RealmSwift
import RxCocoa
import RxRealm
import RxSwift

class PokemonDB {
    static let shared = PokemonDB()
        let byId = "SELF.id == %d"
        let byName = "SELF.name == %@"
        
        lazy var realm: Realm = {
            return try! Realm()
        }()

}

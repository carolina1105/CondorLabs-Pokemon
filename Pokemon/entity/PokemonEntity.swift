//
//  PokemonDB.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import RealmSwift

class PokemonEntity: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var votingStatus: Int = 0


}

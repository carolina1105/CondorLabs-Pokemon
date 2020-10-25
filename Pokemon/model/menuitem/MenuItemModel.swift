//
//  MenuItemModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct MenuItemModel: Identifiable, Codable {
    
    var id: String
    var tag: Int
    var name: String
    var icon: String
    
    init(id: String,
         tag: Int,
         name: String,
         icon: String) {
        self.id = id
        self.tag = tag
        self.name = name
        self.icon = icon
    }
}

extension MenuItemModel {
    static var mock = MenuItemModel(id: "1",
                                    tag: 1,
                                    name: "List Pokemons",
                                    icon: "")
}

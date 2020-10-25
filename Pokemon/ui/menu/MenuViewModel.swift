//
//  MenuViewModel.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import SwiftUI

class MenuViewModel: ObservableObject {
    
    static let shared = MenuViewModel()
    
    @Published var menuItems: [MenuItemModel] =
        [MenuItemModel(id: "1",
                        tag: 1,
                        name: "Generation Pokémon",
                        icon: "sparkles"),
          MenuItemModel(id: "2",
                        tag: 2,
                        name: "Vote",
                        icon: "pencil")
    ]
}

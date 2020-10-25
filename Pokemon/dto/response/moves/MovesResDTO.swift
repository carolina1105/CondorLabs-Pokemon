//
//  MoveResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

struct MovesResDTO: Codable {
    
    var move: MoveResDTO
    
    private enum CodingKeys: String, CodingKey {
        case move 
    }
    
}


struct MoveResDTO: Codable {
    
    var name: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name 
        case url
    }
    
}

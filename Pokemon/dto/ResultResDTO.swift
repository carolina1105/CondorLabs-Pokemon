//
//  ResultResDTO.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct ResultResDTO: Codable {
    var result: Bool
    private enum CodingKeys: String, CodingKey {
        case result = "success"
    }
}

//
//  ErrorUtility.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

class ErrorUtility {
    
    static let shared = ErrorUtility()
    
    func getMessage(by list: [String]) -> String {
        var message: String = ""
        for propery in list {
            message = message + propery + "\n"
        }
        return message
    }
    
}

//
//  KeychainConfig.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation
import KeychainSwift

class KeychainConfig {
    static let shared = KeychainConfig()
    static let group = "group.com.naposystems.napoleonchat.group"
    
    lazy var keychain: KeychainSwift = {
        return KeychainSwift()
    }()
    
    func set(value: String, for key: String) {
        keychain.accessGroup = KeychainConfig.group
        keychain.set(value, forKey: key, withAccess: .accessibleAfterFirstUnlock)
    }
    
    func get(for key: String) -> String {
        keychain.accessGroup = KeychainConfig.group
        guard let value = keychain.get(key) else {
            return ""
        }
        return value
    }
}

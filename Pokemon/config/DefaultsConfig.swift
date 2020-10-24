//
//  DefaultsConfig.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

class DefaultsConfig {
    
    static let shared = DefaultsConfig()
    
    let keyisAlertLogout                : String = "keyisAlertLogout"
    
    let keyBackgrounState               : String = "BackgrounState"
    
    let keyAuthProcess                  : String = "AuthProcess"
    let keyLandingProcess               : String = "LandingProcess"
    
    let keyFirebaseId                   : String = "FirebaseId"
    let keyDeviceToken                  : String = "DeviceToken"

    
    let keyTheme                        : String = "Theme"
    let keyThemeType                    : String = "ThemeType"
    let keyLanguage                     : String = "NapoleonLanguage"
 
    
    let defaults = UserDefaults(suiteName: "group.com.naposystems.napoleonchat.group")!
    
    func set(value: Any, for key: String) {
        defaults.set(value, forKey: key)
    }
    
    func get(for key: String) -> Any? {
        defaults.value(forKey: key)
    }
    
    func delete(for key: String) -> Any? {
        defaults.removeObject(forKey: key)
    }
    
    func removeAll() {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

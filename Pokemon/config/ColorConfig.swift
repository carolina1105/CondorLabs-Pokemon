//
//  ColorConfig.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

fileprivate let defBackground       = "Background"


class ColorConfig {
    private static var sharedInstance: ColorConfig?
    
    var background:       Color
    

    init() {
        self.background       = Color(defBackground + AppTheme.getTheme())
        


    }
    
    class var shared: ColorConfig {
        guard let shared = self.sharedInstance else {
            let sharedInstance = ColorConfig()
            self.sharedInstance = sharedInstance
            return sharedInstance
        }
        return shared
    }
    
    class func destroy() {
        sharedInstance = nil
    }
}

class UIColorConfig {
    private static var sharedInstance: UIColorConfig?
    
    var background:       UIColor
    

    init() {
        self.background       = UIColor(named: defBackground + AppTheme.getTheme())!
        

    }
    
    class var shared: UIColorConfig {
        guard let shared = self.sharedInstance else {
            let sharedInstance = UIColorConfig()
            self.sharedInstance = sharedInstance
            return sharedInstance
        }
        return shared
    }
    
    class func destroy() {
        sharedInstance = nil
    }
}

enum ThemeAppType: String {
    case systemOne = "1"
    case systemTwo = "2"
    case darkOne = "3"
    case darkTwo = "6"
    case darkThree = "7"
    case lightOne = "4"
    case lightTwo = "5"
    case LightThree = "8"
}

struct AppTheme {
    
    private static let theme = "Theme"
    private static let deftheme = "1"
    
    static func getTheme() -> String {
        let defaults = DefaultsConfig.shared
        let theme = defaults.get(for: AppTheme.theme) as? String ?? AppTheme.deftheme
        return "-" + theme
    }
    
}

//
//  Constant.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

import Foundation


fileprivate let defServerUrl                   = "https://pokeapi.co/api/v2"
fileprivate let defEnvironmentType             = 2

// Request Configurations
fileprivate let defApplication                 = "application/json"
fileprivate let defContentType                 = "Content-Type"
fileprivate let defLanguageIso                 = "languageIso"
fileprivate let defApiAuthKey                  = "X-API-Key"
fileprivate let defApiKey                      = "cc0cd24598a24f72a1cb05b581cddd3e"

fileprivate let defSocketID                    = "X-Socket-ID"

// End-points
fileprivate let defPokemonPage                 = "/pokemon?limit=%d&offset=%d"
fileprivate let defGenerations                 = "/generation/%d/"

fileprivate let defSecretKey                   = "SecretKey"

//KeyDisplayNameKey
struct Constant {
    let serverUrl                   : String
    let environmentType             : Int
    let application                 : String
    let contentType                 : String
    let languageIso                 : String
    let apiAuthKey                  : String
    let apiKey                      : String
    let socketID                    : String
    let pokemonPage                 : String
    let generations                 : String
    let secretKey                   : String
    
    static let `default` = Constant(serverUrl                   : defServerUrl,
                                    environmentType             : defEnvironmentType,
                                    application                 : defApplication,
                                    contentType                 : defContentType,
                                    languageIso                 : defLanguageIso,
                                    apiAuthKey                  : defApiAuthKey,
                                    apiKey                      : defApiKey,
                                    socketID                    : defSocketID,
                                    pokemonPage                 : defPokemonPage, 
                                    generations                 : defGenerations,
                                    secretKey                   : defSecretKey)
}

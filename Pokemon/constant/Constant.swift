//
//  Constant.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

import Foundation


fileprivate let defServerUrl                   = "https://pokeapi.co/api/v2"

// Request Configurations
fileprivate let defApplication                 = "application/json"
fileprivate let defContentType                 = "Content-Type"
fileprivate let defLanguageIso                 = "languageIso"
fileprivate let defApiAuthKey                  = "X-API-Key"
fileprivate let defApiKey                      = "cc0cd24598a24f72a1cb05b581cddd3e"

// End-points
fileprivate let defPokemonPage                 = "/pokemon?limit=%d&offset=%d"
fileprivate let defGenerations                 = "/generation/%d/"
fileprivate let defPokemonDetail               = "/pokemon/%@/"

//KeyDisplayNameKey
struct Constant {
    let serverUrl                   : String
    let application                 : String
    let contentType                 : String
    let languageIso                 : String
    let apiAuthKey                  : String
    let apiKey                      : String
    let pokemonPage                 : String
    let generations                 : String
    let pokemonDetail               : String
    
    static let `default` = Constant(serverUrl                   : defServerUrl,
                                    application                 : defApplication,
                                    contentType                 : defContentType,
                                    languageIso                 : defLanguageIso,
                                    apiAuthKey                  : defApiAuthKey,
                                    apiKey                      : defApiKey,
                                    pokemonPage                 : defPokemonPage, 
                                    generations                 : defGenerations, 
                                    pokemonDetail               : defPokemonDetail)
}

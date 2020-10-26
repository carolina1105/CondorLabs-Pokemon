//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import XCTest
@testable import Pokemon

class PokemonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testGetPokemonList() {
        //Arrange - expect
        let expectation = self.expectation(description: "pokemon list")
        
        let expectedPokemon = PokemonModel(id: 1,
                                   name: "dunsparce",
                                   url: "https://pokeapi.co/api/v2/pokemon/206/",
                                   votingStatus: .zero)
        
        var pokemonRepo: PokemonModel?
        
        //Act
        PokemonModel.mock { pokemon in
            pokemonRepo = pokemon
            expectation.fulfill()
        }
        
        //Assert
        waitForExpectations(timeout: 5)
        XCTAssertEqual(expectedPokemon, pokemonRepo)
    }
    
    func testGetPokemonListFailure() {
        //Arrange
        let expectation = self.expectation(description: "pokemon list failure")
        
        let expectedMessage = "URLSessionTask failed with error: unsupported URL"
        
        var errorMessage: AppError?
        
        //Act
        PokemonModel.mockError { error in
            errorMessage = error
            expectation.fulfill()
        }
        
        //Assert
        waitForExpectations(timeout: 5)
        XCTAssertEqual(expectedMessage, errorMessage?.rawValue)
    }
    
    func testGetGenerations() {
        //Arrange - expect
        let expectation = self.expectation(description: "generation list")
        
        let expectedGeneration = GenerationModel(name: "Slock",
                                                 pokemonSpecies: [PokemonModel(id: 1,
                                                                               name: "dunsparce",
                                                                               url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                                               votingStatus: .zero),
                                                                  PokemonModel(id: 1,
                                                                               name: "pikachu",
                                                                               url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                                               votingStatus: .zero),
                                                                  PokemonModel(id: 1,
                                                                               name: "sneasel",
                                                                               url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                                               votingStatus: .zero),
                                                                  PokemonModel(id: 1,
                                                                               name: "ursaring",
                                                                               url: "https://pokeapi.co/api/v2/pokemon/206/",
                                                                               votingStatus: .zero)])
        
        var generationRepo: GenerationModel?
        
        //Act
        GenerationModel.mock { generation in
            generationRepo = generation
            expectation.fulfill()
        }
        
        //Assert
        waitForExpectations(timeout: 5)
        XCTAssertEqual(expectedGeneration, generationRepo)
    }
    
    func testGetGenerationsFailure() {
        //Arrange
        let expectation = self.expectation(description: "generation list failure")
        
        let expectedMessage = "URLSessionTask failed with error: unsupported URL"
        
        var errorMessage: AppError?
        
        //Act
        GenerationModel.mockError { error in
            errorMessage = error
            expectation.fulfill()
        }
        
        //Assert
        waitForExpectations(timeout: 5)
        XCTAssertEqual(expectedMessage, errorMessage?.rawValue)
    }
    
    func testGetPokemonDetail() {
        //Arrange
        let expectation = self.expectation(description: "pokemon detail")
        
        var pokemonDetailRepo: PokemonDetailModel?
        
        //Act
        PokemonDetailModel.mock { pokemonDetail in
            pokemonDetailRepo = pokemonDetail
            expectation.fulfill()
        }
        
        //Assert
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(pokemonDetailRepo)
    }
    
    func testGetPokemonDetailThrowsError() {
        //Arrange - Act
        
        //Assert
        XCTAssertThrowsError(try PokemonDetailModel.mockError())
        
    }
    
    
}

//
//  API.swift
//  SimpleAppWithMoya
//
//  Created by User on 26.01.2023.
//

import Foundation
import Moya

struct API {
    
    private static let provider = MoyaProvider<MoyaConfig>()

    static func requestPokemonsList(completionHandler: @escaping (PokemonsListModel) -> Void) {
        provider.request(.getListOfPokemons) { result in
            switch result {
            case .success(let response):
                print(response)
                if let parsedListOfPokemons = try? JSONDecoder().decode(PokemonsListModel.self, from: response.data) {
                    completionHandler(parsedListOfPokemons)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func requestNamedPokemon(name: String, completionHandler: @escaping (PokemonModel) -> Void) {
        provider.request(.getSpecificPokemon(name: name.lowercased())) { result in
            switch result {
            case .success(let response):
                print(response)
                if let parsedNamedPokemon = try? JSONDecoder().decode(PokemonModel.self, from: response.data) {
                    completionHandler(parsedNamedPokemon)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

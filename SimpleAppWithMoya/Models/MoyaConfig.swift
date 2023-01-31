//
//  APIManager.swift
//  SimpleAppWithMoya
//
//  Created by User on 21.01.2023.
//

import Foundation
import Moya

enum MoyaConfig {
    case getListOfPokemons
    case getSpecificPokemon(name: String)
}

extension MoyaConfig: TargetType {
    
    var baseURL: URL { URL(string: "https://pokeapi.co/api/v2")! }
    
    var path: String {
        switch self {
        case .getListOfPokemons:
            return "/pokemon"
        case .getSpecificPokemon(name: let name):
            return "/pokemon/\(name)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getListOfPokemons, .getSpecificPokemon:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getListOfPokemons, .getSpecificPokemon:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

//
//  pokemonsListModel.swift
//  SimpleAppWithMoya
//
//  Created by User on 21.01.2023.
//

import Foundation

// MARK: - PokemonsListModel
struct PokemonsListModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?    
}



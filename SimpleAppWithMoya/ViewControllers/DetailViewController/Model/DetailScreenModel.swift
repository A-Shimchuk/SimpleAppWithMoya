//
//  DetailScreenModel.swift
//  SimpleAppWithMoya
//
//  Created by User on 29.01.2023.
//

import Foundation

protocol DetailViewModelDelegate {
    func reloadData()
    func pokemonDidLoad()
}

class DetailScreenModel {
    
    var namedPokemon: PokemonModel?
    var delegate: DetailViewModelDelegate?

    func makeNamedPokemonRequest(name: String) {
        API.requestNamedPokemon(name: name) { [weak self] result in
            guard let strongSelf = self else { return }
            
            strongSelf.namedPokemon = result
            
            strongSelf.delegate?.pokemonDidLoad()
            
        }
    }
}

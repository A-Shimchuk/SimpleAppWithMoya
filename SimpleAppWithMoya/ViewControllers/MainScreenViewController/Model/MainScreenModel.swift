//
//  MainScreenModel.swift
//  SimpleAppWithMoya
//
//  Created by User on 21.01.2023.
//

import Foundation

protocol MainScreenModelDelegate {
    func reloadData()
    func pokemonsListDidLoad()
}

class MainScreenModel {
    
    var pokemosList: PokemonsListModel?
    var delegate: MainScreenModelDelegate?
    
    func requestPokemonsList() {
        
        API.requestPokemonsList { [weak self] list in
            guard let strongSelf = self else { return }
            
            strongSelf.pokemosList = list
            
            strongSelf.delegate?.pokemonsListDidLoad()
        }
    }
}

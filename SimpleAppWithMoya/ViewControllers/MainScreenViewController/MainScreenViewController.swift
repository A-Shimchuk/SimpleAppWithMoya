//
//  MainScreenViewController.swift
//  SimpleAppWithMoya
//
//  Created by User on 21.01.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var model = MainScreenModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        setupTableView()
        model.requestPokemonsList()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: MainTableViewCell.identifier)
    }
}

extension MainScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MainTableViewCell else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        if let nameOfPokemon = cell.nameLabel.text {
            let vc = DetailViewController(name: nameOfPokemon)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height/10
    }
}

extension MainScreenViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as! MainTableViewCell
        // TODO: Выход за пределы indexPath.row после прокрутки до упора и краш
        cell.nameLabel.text = model.pokemosList?.results?[indexPath.row].name?.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.pokemosList?.count ?? 5
    }
}


extension MainScreenViewController: MainScreenModelDelegate {
   
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func pokemonsListDidLoad() {
        reloadData()
    }
}

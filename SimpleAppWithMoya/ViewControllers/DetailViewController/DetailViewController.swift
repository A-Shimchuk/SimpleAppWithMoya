//
//  DetailViewController.swift
//  SimpleAppWithMoya
//
//  Created by User on 29.01.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var nameOfPokemon: String
    private let model = DetailScreenModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        model.delegate = self
        setupCollectionView()
        model.makeNamedPokemonRequest(name: nameOfPokemon)
    }

    init(name: String) {
        nameOfPokemon = name
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
    }
}


extension DetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        
        switch indexPath.row {
        case 0:
            guard let name = model.namedPokemon?.name?.capitalized else { fallthrough }
            cell.titleLabel.text = "The name is \(name)"
        case 1:
            guard let weight = model.namedPokemon?.weight else { fallthrough }
            cell.titleLabel.text = "Pokemon weight - \(weight) gramm"
        case 2:
            guard let height = model.namedPokemon?.height else { fallthrough }
            cell.titleLabel.text = "Pokemon height - \(height) cm"
        case 3:
            // TODO: Пульнуть каждую абилку в ячеку поочередно, а не общее кол-во
            guard let abilities =  model.namedPokemon?.abilities?.count else { fallthrough }
            cell.titleLabel.text = "Count of abilities - \(abilities)"
        case 4:
            guard let forms = model.namedPokemon?.forms?.count else { fallthrough }
            cell.titleLabel.text = "Count of forms - \(forms)"
        default:
            break
        }
        return cell
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func pokemonDidLoad() {
        reloadData()
    }
}

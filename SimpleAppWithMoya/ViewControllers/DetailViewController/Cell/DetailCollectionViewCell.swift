//
//  DetailCollectionViewCell.swift
//  SimpleAppWithMoya
//
//  Created by User on 29.01.2023.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    static let identifier = "DetailCollectionViewCell"
    
    @IBOutlet weak var mainCellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupApearance()
    }

    private func setupApearance() {
        mainCellView.backgroundColor = .systemTeal
        mainCellView.layer.borderWidth = 0.5
        mainCellView.layer.cornerRadius = 25
        titleLabel.textColor = .systemRed
    }
}

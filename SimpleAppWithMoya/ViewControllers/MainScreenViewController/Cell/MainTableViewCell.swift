//
//  MainTableViewCell.swift
//  SimpleAppWithMoya
//
//  Created by User on 25.01.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let identifier = "MainTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppearance()
    }
    
    private func setupCellAppearance() {
        nameLabel.textColor = UIColor.systemBlue
        arrowImage.image = UIImage(named: "arrowRight")
    }
    
}

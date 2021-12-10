//
//  EmptyTableViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 05/11/2021.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var messageImageView: UIImageView!
    
    // MARK: - Configure
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        // message for nothing found or nothing saved
        
        
        self.titleLabel.text = NSLocalizedString("No recipes Found", comment: "Go back to search view")
        self.subtitleLabel.text = NSLocalizedString("No favorites saved yet! 📜 will be display 👇", comment: "If you saved somes recipes")
        self.messageImageView.image = UIImage(named: "nothing")
    }
    

    
}

//
//  EmptyViewCell.swift
//  covidTraker
//
//  Created by Paul Ghibeaux on 09/12/2021.
//

import UIKit

class EmptyViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var messageImageView: UIImageView!
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        // message for nothing found or nothing saved
        
        
        self.titleLabel.text = NSLocalizedString("⚠️ No info Found", comment: "Go back to search view")
        self.subtitleLabel.text = NSLocalizedString("Check your network and your 📍 🎛 settings", comment: "")
        self.messageImageView.image = UIImage(named: "nothing")
    }
}

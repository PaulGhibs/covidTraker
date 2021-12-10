//
//  HospitalCell.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import UIKit

class HospitalCell: UICollectionViewCell {

    @IBOutlet weak var HospitalName: UILabel!
    
    @IBOutlet weak var imagePlace: UIImageView!
    
    
    @IBOutlet weak var adress: UILabel!
    
    
    
    override func layoutSubviews() {
      
        contentView.layer.cornerRadius = 12
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.backgroundColor = UIColor.systemBackground.cgColor
        contentView.layer.masksToBounds = true
        contentView.layer.shadowRadius = 3.0
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
   
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? HospitalCellViewModel else {
               return
           }
      
        
        
        self.HospitalName.text = cellVM.name
        
        self.adress.text = cellVM.adress
        
      
    }
    
    
    }

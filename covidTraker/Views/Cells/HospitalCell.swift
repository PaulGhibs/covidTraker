//
//  HospitalCell.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import UIKit

class HospitalCell: UICollectionViewCell {

    @IBOutlet weak var HospitalName: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        HospitalName.textDropShadow()
        
    }
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? HospitalCellViewModel else {
               return
           }
      
        
        
      
    }
    
    
    }

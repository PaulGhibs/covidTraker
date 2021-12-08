//
//  HospitalCell.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import UIKit
import SDWebImage

class HospitalCell: UICollectionViewCell {

    @IBOutlet weak var HospitalName: UILabel!
    
    @IBOutlet weak var imagePlace: UIImageView!
    
    @IBOutlet weak var establishmentPlace: UILabel!
    
    var hospitalCollection : HospitalCollections?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        HospitalName.textDropShadow()
        
    }
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? HospitalCellViewModel else {
               return
           }
      
        
        self.hospitalCollection = cellVM.hospitalCollection
        self.HospitalName.text = cellVM.hospitalCollection?.results.first?.name
        
      
    }
    
    
    }

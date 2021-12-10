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
    
    
    var hospitalCollection: HospitalCollections?
    
   
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? HospitalCellViewModel else {
               return
           }
      
        
        
        self.HospitalName.text = cellVM.name
        
        self.adress.text = cellVM.adress
        
      
    }
    
    
    }

//
//  HospitalHeaderView.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import UIKit

class HospitalHeaderView: UICollectionReusableView {

    @IBOutlet weak var TitleHeader: UILabel!
    
    override func layoutSubviews() {
        TitleHeader.textDropShadow()
    }
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
            guard let headerVM = cellViewModel as? HospitalHeaderVM else {
                return
            }
        
            
            self.TitleHeader.text = headerVM.world
            
        }
        
  
    
}

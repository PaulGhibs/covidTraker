//
//  MapCell.swift
//  covidTraker
//
//  Created by Paul Ghb on 01/12/2021.
//

import UIKit
import MapKit

class MapCell: UICollectionViewCell {

    @IBOutlet weak var searchmap: MKMapView!
    
    @IBOutlet weak var searchCountryBar: UISearchBar!
    
    
    override func layoutSubviews() {
        searchmap.layer.cornerRadius = 20
        
    }
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
           guard let cellVM = cellViewModel as? WorldCellViewModel else {
               return
           }
      
        
        
        
//
     }

}

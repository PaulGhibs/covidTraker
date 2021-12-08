//
//  HospitalCellViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import Foundation

class HospitalCellViewModel: CellViewModel {
 
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (350, 153)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "HospitalCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var hospitalCollection : HospitalCollections?
  
    init(hospitalCollection: HospitalCollections, routingEntry : RoutingEntry) {
        self.hospitalCollection = hospitalCollection
        self.routingEntry = routingEntry
    }
    
}

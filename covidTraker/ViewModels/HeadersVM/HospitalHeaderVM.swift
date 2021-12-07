//
//  HospitalHeaderVM.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import Foundation

class HospitalHeaderVM: CollectionCellViewModel {
    
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (150, 170)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "HospitalHeaderView"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var world : String
    
    init(world: String) {
     
        self.world = world
    }
    
}

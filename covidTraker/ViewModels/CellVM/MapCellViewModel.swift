//
//  MapCellViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 29/11/2021.
//

import Foundation

class MapCellViewModel: CellViewModel {
 
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (50, 153)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "MapCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var covidCollection : CovidCollection?
  
    init( routingEntry : RoutingEntry) {
  
        self.routingEntry = routingEntry
    }
    
}

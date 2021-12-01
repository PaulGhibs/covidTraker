//
//  WorldCellViewModel.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation

class WorldCellViewModel: CellViewModel {
 
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (50, 153)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "WorldCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var covidCollection : CovidCollection?
   
    
    
    
    init(covidCollection : CovidCollection, routingEntry : RoutingEntry) {
  
        self.covidCollection = covidCollection
        self.routingEntry = routingEntry
    }
    
}

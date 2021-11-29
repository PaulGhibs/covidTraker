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
    var firstHeader: String?
    var secondsubtitle: String?
    
    
    
    init(covidCollection : CovidCollection, firstHeader: String, secondsubtitle: String, routingEntry : RoutingEntry) {
        self.firstHeader = firstHeader
        self.secondsubtitle = secondsubtitle
        self.covidCollection = covidCollection
        self.routingEntry = routingEntry
    }
    
}

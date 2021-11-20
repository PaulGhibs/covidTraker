//
//  WorldCellViewModel.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation

class WorldCellViewModel: CollectionCellViewModel {
 
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (350, 153)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "WorldCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var firstHeader: String?
    var secondsubtitle: Int?
    
    
    init(firstHeader: String, secondsubtitle: Int, routingEntry : RoutingEntry) {
        self.firstHeader = firstHeader
        self.secondsubtitle = secondsubtitle
      
        self.routingEntry = routingEntry
    }
    
}

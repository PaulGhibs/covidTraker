//
//  HeaderVM.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 20/11/2021.
//

import Foundation

class WorldHeaderVM: CollectionCellViewModel {
    
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (150, 170)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "WorldReusableView"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var world : String
    
    init(world: String) {
     
        self.world = world
    }
    
}
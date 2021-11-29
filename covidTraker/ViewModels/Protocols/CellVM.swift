//
//  CellVM.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation

@objc protocol CellViewModel {
    var nibName: String? { get set }
    var reuseIdentifier: String { get set }
    var indexPath: IndexPath? { get set }
    var routingEntry: RoutingEntry? { get set }
}


protocol CollectionCellViewModel: CellViewModel {
    var size: (width: Float, height: Float) { get }
   
}


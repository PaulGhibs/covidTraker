//
//  EmptyRecipeCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 05/11/2021.
//


import Foundation
// MARK: - EmptyCellViewModel

class EmptyCollectionCellViewModel : CollectionCellViewModel {
    var size: (width: Float, height: Float) {
        return (50, 153)
    }
    
    
   
    
   
    var nibName: String? = "EmptyViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)
    
    var indexPath: IndexPath?
    
    var routingEntry: RoutingEntry?

}

class EmptyTableCellViewModel : TableCellViewModel {
    var height: Float {
        return 185
    }
 
    var nibName: String? = "EmptyTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)
    
    var indexPath: IndexPath?
    
    var routingEntry: RoutingEntry?

}

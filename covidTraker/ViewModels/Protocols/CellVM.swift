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

protocol TableCellViewModel: CellViewModel {
    var height: Float { get }

}

protocol TableEditedCellViewModel: TableCellViewModel {
    // Favorite cellviewmodel the user can delete one from the favorite with completionedit function
    var canEdit : Bool { get }
    func completionEdit(callback: @escaping (Error?) -> ())
}


protocol CollectionCellViewModel: CellViewModel {
    var size: (width: Float, height: Float) { get }
   
}


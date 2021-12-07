//
//  GreenButtonVM.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation



class ButtonCellViewModel : TableCellViewModel {

    var nibName: String? = "InfoButton"
    
    lazy var reuseIdentifier: String = String(describing: self)
    
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?

    var name: String

    var height: Float {
        return 90
    }
 
    var title: String?
    
    
    init(title : String, routingEntry : RoutingEntry? = nil) {
        self.title = title
        self.routingEntry = routingEntry
        self.name = ""    }

    
    
    
}

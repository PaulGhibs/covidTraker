//
//  ResultCellViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 06/12/2021.
//

import Foundation


class ResultCellViewModel: TableCellViewModel {
   
    
    var routingEntry: RoutingEntry?
    
    
    var height: Float {
        return 550
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "labelCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var covidCollection : CovidCollection?

    init(covidCollection : CovidCollection) {
        self.covidCollection = covidCollection
        
    }
}

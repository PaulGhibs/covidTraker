//
//  SearchCountryCellViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 05/12/2021.
//

import Foundation


class CountryCellViewModel: TableCellViewModel {
   
    
    var routingEntry: RoutingEntry?
    
    
    var height: Float {
        return 420
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "CountryCell"
    lazy var reuseIdentifier: String = String(describing: self)
    



    var country : String?

    init(country : String) {
        self.country = country
        
    }
}





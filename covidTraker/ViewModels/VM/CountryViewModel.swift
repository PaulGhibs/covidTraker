//
//  SearchViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 06/12/2021.
//

import Foundation


class CountryViewModel: ViewModel {
    
    
    var titleTabBar = NSLocalizedString("Covid cases by 📍 ", comment: "")
    
    var shouldDisplayBackButton = false

    var sections: [Section] = []
  
    
    func loadData(callback: @escaping (Error?) -> ()) {
        // api service protocol with typed ingredients
        
        self.sections.append(SearchSection())
        callback(nil)
    }
    
   
}


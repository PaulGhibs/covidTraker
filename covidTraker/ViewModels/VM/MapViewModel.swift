//
//  MapViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 29/11/2021.
//

import Foundation


class MapViewModel: ViewModel {
   
    var titleTabBar = NSLocalizedString("Search by countries", comment: "")

    var shouldDisplayBackButton = true
    
    var sections: [Section] = []
    
    var apiService: APIService?
    
    // recipe collection empty
    var covidTab : CovidCollection?

    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    // is requesting
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var updateLoadingStatus: (()->())?
    
    func loadData(callback: @escaping (Error?) -> ()) {
        self.isLoading = true
        // api service protocol with typed ingredients
        self.sections.append(MapSection())
        callback(nil)
        
    }
    
    
   
}

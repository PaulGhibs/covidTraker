//
//  HospitalViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import Foundation


class HospitalViewModel: ViewModel {
   
    var titleTabBar = NSLocalizedString("Hospital List", comment: "")

    var shouldDisplayBackButton = false
    
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
        
            self.sections.append(HospitalSection())

        
        callback(nil)
        
    }
    
    
   
}

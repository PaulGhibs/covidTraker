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
    var covidTab = HospitalCollections(results: [], status: "")

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
        _ = apiService?.requestInfos(with: "") { (success, resource) in
            // temps sections for append if success
            var tempSections: [Section] = []
            if success, let resource = resource {
                // parse resourc(e as recipe collection)!
                
                self.covidTab = resource as! HospitalCollections
                let currentCollectionSection = HospitalSection(HospitalCollection: self.covidTab)
                tempSections.append(currentCollectionSection)
               
                // append temps sections with recipeviewsection collection parsed
                // define tempssections as sections
                self.sections = tempSections
                

            }
            // callback no recipeFound if error
            callback(CovidError.noInfoFound)
        }
        
    }
    
    
   
}

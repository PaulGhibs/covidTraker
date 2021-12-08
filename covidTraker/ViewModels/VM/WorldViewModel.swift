//
//  WorldViewModel.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation


class WorldViewModel: ViewModel {
   
    var titleTabBar = NSLocalizedString("Covid Tracker", comment: "")

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
        _ = apiService?.requestInfos(with: "World") { (success, resource) in
            // temps sections for append if success
            var tempSections: [Section] = []
            if success, let resource = resource {
                // parse resource as recipe collection
                
                self.covidTab = resource as? CovidCollection
                let currentCollectionSection = WorldSection(collection : self.covidTab!)
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

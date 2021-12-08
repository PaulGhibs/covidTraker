//
//  ResultViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 07/12/2021.
//

import Foundation


class ResultViewModel: ViewModel {
    
    
    var titleTabBar = NSLocalizedString("Covid cases by 📍 ", comment: "")
    
    var shouldDisplayBackButton = false

    var sections: [Section] = []

    
    static var countryChoosen: String {
        get {
            return UserDefaults.standard.string(forKey: CountryChoosen.choosenCountry) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: CountryChoosen.choosenCountry)
        }
       
    }
  
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
        _ = apiService?.requestInfos(with: ResultViewModel.countryChoosen) { (success, resource) in
            // temps sections for append if success
            var tempSections: [Section] = []
            if success, let resource = resource {
                // parse resource as recipe collection
                
                self.covidTab = resource as? CovidCollection
                let currentCollectionSection = ResultSection(covidCollection: self.covidTab!)
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

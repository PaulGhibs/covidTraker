//
//  SearchController.swift
//  covidTraker
//
//  Created by Paul Ghb on 05/12/2021.
//

import Foundation
import UIKit
import MapKit

class SearchController : BaseCollectionViewController, UISearchResultsUpdating {
   
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchController.searchBar.backgroundColor = .systemBackground
        searchController.searchBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top)
    }

   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        guard (self.viewModel as? CellViewModel) != nil else {
          
            navigationItem.title = viewModel?.titleTabBar
            return
        }
    }
   
    
    
  
  
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty, let resultsVC = searchController.searchResultsController
        as? ResultsViewController else {
            return
        }
        
        GoogleMapService.shared.findPlaces(query: query) { result in
            switch result {
            case .success(let places):
                DispatchQueue.main.async {
                    resultsVC.update(with: places)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}



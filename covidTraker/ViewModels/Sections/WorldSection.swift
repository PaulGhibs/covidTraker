//
//  WorldSection.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation

class WorldSection: CollectionSection {

    var headerVM: CollectionCellViewModel?
    var footerVM: CollectionCellViewModel?
    
    var position: Int
    var title: String?
    var cellsVM: [CellViewModel]
    
    init(collection : CovidCollections) {
        self.position = 0
        self.title = ""
        
       
      
        self.headerVM = HeaderVM(covidCollection: collection)

        self.cellsVM = [CellViewModel]()
   
        let cellVM = WorldCellViewModel(firstHeader: collection.country.country,
                                            secondsubtitle: 1,
                                            routingEntry: WorldCellEntry())
            self.cellsVM.append(cellVM)
        
   
    }
}

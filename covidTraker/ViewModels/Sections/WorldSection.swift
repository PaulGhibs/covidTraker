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
    
    init(collection : CovidCollection) {
        self.position = 0
        self.title = ""
        
       
      
        self.headerVM = WorldHeaderVM(world: "  World Situation 🌍 ")

        self.cellsVM = [CellViewModel]()
        
      
        
        let worldcellVM = WorldCellViewModel(covidCollection: collection,
                                                routingEntry: WorldCellEntry())
        self.cellsVM.append(worldcellVM)
        
   
      
        
   
    }
}

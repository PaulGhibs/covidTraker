//
//  MapSection.swift
//  covidTraker
//
//  Created by Paul Ghb on 29/11/2021.
//

import Foundation

class MapSection: CollectionSection {

    var headerVM: CollectionCellViewModel?
    var footerVM: CollectionCellViewModel?
    
    var position: Int
    var title: String?
    var cellsVM: [CellViewModel]
    
    init() {
        self.position = 0
        self.title = ""
        
 
        self.cellsVM = [CellViewModel]()
        
      
        
        let mapCellVM = MapCellViewModel(routingEntry: WorldCellEntry())
        self.cellsVM.append(mapCellVM)

    }
}

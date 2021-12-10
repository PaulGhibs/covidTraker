//
//  HospitalSection.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import Foundation

class HospitalSection: CollectionSection {

    var headerVM: CollectionCellViewModel?
    var footerVM: CollectionCellViewModel?
    
    var position: Int
    var title: String?
    var cellsVM: [CellViewModel]
    
    init(HospitalCollection: HospitalCollections) {
        self.position = 0
        self.title = ""
        
        self.headerVM = HospitalHeaderVM(world: "📍🏥 Nearby your position")

        self.cellsVM = [CellViewModel]()
        if HospitalCollection.results.count == 0 {
            let empty = EmptyCollectionCellViewModel()
            cellsVM.append(empty)
        } else {
            for hospital in HospitalCollection.results {
                let hospitalcellVM = HospitalCellViewModel(name: hospital.name, image: URL(string: hospital.icon) , adress: hospital.vicinity, openNow: hospital.openingHours?.openNow ?? false)
            self.cellsVM.append(hospitalcellVM)
            }
            
       
          
        
    }
}
}

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
    
    init() {
        self.position = 0
        self.title = ""
        
        self.headerVM = HospitalHeaderVM(world: "📍 Hospitals 🏥 ")

        self.cellsVM = [CellViewModel]()

        for _ in 0..<4 {
        let hospitalcellVM = HospitalCellViewModel(routingEntry: WorldCellEntry())
        self.cellsVM.append(hospitalcellVM)
        }
    }
}
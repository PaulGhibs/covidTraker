//
//  SearchSections.swift
//  covidTraker
//
//  Created by Paul Ghb on 06/12/2021.
//

import Foundation


class SearchSection: TableSection {
    var heightForHeader = 50
    
    
    
    var title: String?
    
    var position: Int
    
    
    var cellsVM: [CellViewModel]
    
    
    
    init() {
        self.position = 1
        self.title = ""
        
       
        self.cellsVM = [CellViewModel]()
        
        let countrySelected = CountryCellViewModel()
        self.cellsVM.append(countrySelected)
       
        let greenButton = ButtonCellViewModel(title: "Get infos 🦠 ", routingEntry: SearchRountingEntry())
        self.cellsVM.append(greenButton)
        }
}

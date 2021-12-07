//
//  ResultSection.swift
//  covidTraker
//
//  Created by Paul Ghb on 06/12/2021.
//

import Foundation
class ResultSection: TableSection {
    var heightForHeader = 50
    
    
    
    var title: String?
    
    var position: Int
    
    
    var cellsVM: [CellViewModel]
    
    
    
    init(covidCollection: CovidCollection) {
        self.position = 1
        self.title = ""
        
       
        self.cellsVM = [CellViewModel]()
    
        
        let resultSelected = ResultCellViewModel(covidCollection: covidCollection)
        self.cellsVM.append(resultSelected)
       
        
        }
}

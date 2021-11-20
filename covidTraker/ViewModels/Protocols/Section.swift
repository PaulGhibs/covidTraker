//
//  Section.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation


protocol Section {
    var position: Int { get set }
    var title: String? { get set }
    var cellsVM: [CellViewModel] { get set }
}


protocol CollectionSection: Section {
    var headerVM: CollectionCellViewModel? { get }
    var footerVM: CollectionCellViewModel? { get }

}

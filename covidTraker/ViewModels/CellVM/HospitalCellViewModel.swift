//
//  HospitalCellViewModel.swift
//  covidTraker
//
//  Created by Paul Ghb on 02/12/2021.
//

import Foundation

class HospitalCellViewModel: CellViewModel {
 
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (350, 153)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "HospitalCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var name : String
    var image: URL?
    var adress: String
    var openNow: Bool
    // init name ingredients, images, duration and likes, routing entry

    init(name: String,  image: URL?, adress: String,openNow: Bool, routingEntry: RoutingEntry? = nil) {
        self.name = name
        self.image = image
        self.adress = adress
        self.openNow = openNow
        self.routingEntry = routingEntry
    }
    
}

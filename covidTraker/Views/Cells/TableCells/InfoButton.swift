//
//  GreenButton.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 15/09/2021.
//

import UIKit

let cellIdentifier = "InfoButton"

class InfoButton: UITableViewCell {
    
    @IBOutlet weak var greenButton: UIButton!
    
    // MARK: - Configure & cell pressed
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // routing entry for going on recipe result view
        guard let routingEntry = cellViewModel.routingEntry,
              let navController = controller.navigationController else {
                  return
              }
        
        let newRouting = Routing()
        
        _ = newRouting
            .route(routingEntry: routingEntry,
                   fromController: navController,
                   animated: true)
        
        
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        // connect button view and viewmodel
        guard let tableCVM = cellViewModel as? ButtonCellViewModel else {
            return
        }
        
        
        greenButton.setTitle(tableCVM.title, for: .normal)
        greenButton.layer.cornerRadius = 20
      
        
        
    }
    
    
}

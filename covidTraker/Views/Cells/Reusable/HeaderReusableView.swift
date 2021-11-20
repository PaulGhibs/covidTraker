//
//  HeaderReusableView.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 20/11/2021.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {

    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var details: UIButton!
   
    var controller : UIViewController?
    var collection : [Country]?

    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
            guard let headerVM = cellViewModel as? HeaderVM else {
                return
            }
            self.controller = controller
        
            guard let covidInfo = collection else {
                return
            }
            
            for infos in covidInfo {
                self.header.text = flag(country: infos.country)
            }
            self.details.setTitle("details", for: .normal)
            
        }
        
  
    
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    @IBAction func detailsButton(_ sender: Any) {
        guard self.collection != nil else {
            return
        }
        
        let newRouting = Routing()
            
        _ = newRouting
            .route(routingEntry: WorldCellEntry(),
                   fromController: self.controller!,
                   animated: true)

    }
}

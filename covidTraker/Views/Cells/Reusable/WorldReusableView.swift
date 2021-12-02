//
//  HeaderReusableView.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 20/11/2021.
//

import UIKit

class WorldReusableView: UICollectionReusableView {

    @IBOutlet weak var header: UILabel!
    
   
    var controller : UIViewController?
    var collection : CovidCollection?
    
  

    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
            guard let headerVM = cellViewModel as? WorldHeaderVM else {
                return
            }
            self.controller = controller
        
            
            self.header.text = headerVM.world
            header.textDropShadow()
            
        }
        
  
    
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
   
}

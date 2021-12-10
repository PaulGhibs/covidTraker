//
//  HospitalController.swift
//  covidTraker
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import UIKit


class HospitalController: BaseCollectionViewController {
    fileprivate var aView : UIView?

    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
   
        self.showSpinner()

        // Load data and register cells
        self.viewModel?.loadData { _ in
            
            self.registerCells()
            self.stopSpinner()
            
            self.collectionView.reloadData()
            
        }
    }
}


extension HospitalController {
    func showSpinner() {
        aView = UIView(frame: self.view.frame)
        aView?.backgroundColor = UIColor.systemBackground
        let ai = UIActivityIndicatorView(style: .medium)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
        
    }
    func stopSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}

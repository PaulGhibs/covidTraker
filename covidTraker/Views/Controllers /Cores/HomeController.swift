//
//  HomeController.swift
//  covidTraker
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import Foundation
class HomeController: BaseCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.loadData { error in
            self.registerCells()
            self.collectionView.reloadData()
            
        }
    }
}

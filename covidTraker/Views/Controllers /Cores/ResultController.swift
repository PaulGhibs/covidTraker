//
//  ResultController.swift
//  covidTraker
//
//  Created by Paul Ghb on 07/12/2021.
//

import UIKit

class ResultController: BasicTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.loadData {[weak self] _ in
            
                self?.tableView.reloadData()
                self?.registerCells()

        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

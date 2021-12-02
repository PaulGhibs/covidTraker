//
//  TabBar.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import UIKit

class TabBarViewController: UITabBarController {
 
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // tab bar appearance
        view.backgroundColor = .systemBackground
        self.tabBar.tintColor = UIColor.darkGray
        self.tabBar.backgroundColor = UIColor.systemBackground
        tabBar.unselectedItemTintColor = UIColor.lightGray
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        setupVCs()
        
      
    }
    
   
    
    // MARK: - Methods
    func setupVCs() {
            viewControllers = [
                // two controllers the search one and the favorite
                createNavController(for: BaseCollectionViewController(viewModel: WorldViewModel(apiService: DataFlowService()), compositionalLayout: WorldCompositional()), title: NSLocalizedString("Covid Tracker", comment: ""), image: UIImage(systemName: "homekit")!),
                createNavController(for: BaseCollectionViewController(viewModel: MapViewModel(apiService: DataFlowService()), compositionalLayout: MapCompositional()), title: NSLocalizedString("Map", comment: ""), image: UIImage(systemName: "map")!),
                createNavController(for: BaseCollectionViewController(viewModel: HospitalViewModel(apiService: GoogleService()), compositionalLayout: HospitalCompositional()), title: NSLocalizedString("Hospitals", comment: ""), image: UIImage(systemName: "stethoscope.circle")!),
                
            ]
        }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            navController.navigationItem.largeTitleDisplayMode = .always
        

            navController.navigationBar.largeTitleTextAttributes =
        [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 30)!]

           rootViewController.navigationItem.title = title
           return navController
       }

}



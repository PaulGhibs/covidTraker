//
//  ExampleRouter.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/09/2021.
//

import Foundation
// recipe routing entry



class WorldCellEntry : RoutingEntry {

    
    
    var viewController: Controller? {

        let viewModel = WorldViewModel(apiService: DataFlowService())

        return BaseCollectionViewController(viewModel: viewModel, compositionalLayout: WorldCompositional())
    }

    var completionBlock: (() -> Void)?
    var navigationStyle: NavigationStyle {
        return .push
    }

}



class SearchRountingEntry : RoutingEntry {

    
    var viewController: Controller? {

        let viewModel = ResultViewModel(apiService: DataFlowService())
        return BasicTableViewController(viewModel: viewModel)
    }

    var completionBlock: (() -> Void)?
    var navigationStyle: NavigationStyle {
        return .push
    }

}

//// detail routing entry
//class DetailRoutingEntry : RoutingEntry {
//
//    var recipe : Recipe
//
//
//    init(recipe: Recipe){
//        self.recipe = recipe
//    }
//
//    var viewController: Controller? {
//
//        let viewModel = DetailViewModel(recipe: recipe)
//
//        return DetailViewController(viewModel: viewModel)
//    }
//
//    var completionBlock: (() -> Void)?
//    var navigationStyle: NavigationStyle {
//        return .push
//    }
//
//}

// web routing entry
//class WebRoutingEntry : RoutingEntry {
//    
//    var url : URL?
//    
//    var viewController: Controller? {
//        let viewModel = WebViewModel(url: self.url!)
//        return WebViewController(viewModel: viewModel)
//    }
//    
//    var completionBlock: (() -> Void)?
//    
//    var navigationStyle: NavigationStyle {
//        return .push
//    }
//    
//    init(url : URL?){
//        self.url = url 
//    }
//    
//    
//}
//
//
//

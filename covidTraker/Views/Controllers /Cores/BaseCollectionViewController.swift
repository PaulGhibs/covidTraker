//
//  BaseCollectionViewController.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 20/11/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class BaseCollectionViewController: UICollectionViewController {
   
    
    var viewModel: ViewModel?
    var compositionalLayout: CompositionalLayoutProtocol?


    
    init(viewModel: ViewModel,
         compositionalLayout: CompositionalLayoutProtocol) {
        self.viewModel = viewModel
        self.compositionalLayout = compositionalLayout
        super.init(nibName: "BaseCollectionViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        guard (self.viewModel as? CellViewModel) != nil else {
          
            navigationItem.title = viewModel?.titleTabBar
            return
        }
    
        
    }
    
    
    override func viewDidLoad() {
       
        // Set layout if we have one
        if let layout = self.compositionalLayout {
            collectionView.collectionViewLayout = layout.create()
        }
        
        // Load data and register cells
        self.viewModel?.loadData { error in
            self.registerCells()
            self.collectionView.reloadData()
            
        }
    }
   
    
        
    
    // MARK: - Register
    public func registerCells() {
        guard let sections = self.viewModel?.sections as? [CollectionSection] else { return }
        
        for i in 0..<sections.count {
            var section = sections[i]
            
            // Store section position
            section.position = i
            
            // Register header if needed
            if let headerVM = section.headerVM,
               let nibName = headerVM.nibName {
                self.registerSupplementaryView(kind: UICollectionView.elementKindSectionHeader,
                                               reuseIdentifier: headerVM.reuseIdentifier,
                                               nibName: nibName)
            }
            
            // Register footer if needed
            if let footerVM = section.footerVM,
               let nibName = footerVM.nibName {
                self.registerSupplementaryView(kind: UICollectionView.elementKindSectionFooter,
                                               reuseIdentifier: footerVM.reuseIdentifier,
                                               nibName: nibName)
            }
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
                
                // If we don't have a nibName, we use the default UICollectionViewCell
                guard let nibName = item.nibName else {
                    self.collectionView.register(UICollectionViewCell.self,
                                                 forCellWithReuseIdentifier: reuseIdentifier)
                    continue
                }
                        
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.collectionView.register(nib,
                                             forCellWithReuseIdentifier: item.reuseIdentifier)
            }
                        
        }
    }
    
    func registerSupplementaryView(kind: String,
                                   reuseIdentifier: String,
                                   nibName: String) {
        let nib = UINib(nibName: nibName,
                        bundle: Bundle(for: type(of: self)))
        self.collectionView.register(nib,
                                     forSupplementaryViewOfKind: kind,
                                     withReuseIdentifier: reuseIdentifier)
    }

   
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfItems(in: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
            
        cell.configure(cellViewModel: cellVM,
                       from: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
                                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellVM.reuseIdentifier,
                                                      for: indexPath)
        
        cell.cellPressed(cellViewModel: cellVM,
                         from: self)
        
    }
    
 
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
          
          case UICollectionView.elementKindSectionHeader:
                     
            // Get Header ViewModel
            guard let section = self.viewModel?.sections[indexPath.section] as? CollectionSection,
                  let headerViewModel = section.headerVM else {
                return UICollectionReusableView()
            }
            
            // Dequeue the reusable view
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: headerViewModel.reuseIdentifier,
                                                                             for: indexPath)
        
            headerView.configure(cellViewModel: headerViewModel,
                                 from: self)
            
//            headerView.cellPressed(cellViewModel: headerViewModel, from: self)
            
            

            
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            
            // Get footer ViewModel
            guard let section = self.viewModel?.sections[indexPath.section] as? CollectionSection,
                  let footerVM = section.footerVM else {
                return UICollectionReusableView()
            }
            
            // Dequeue the reusable view
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: footerVM.reuseIdentifier,
                                                                             for: indexPath)
        
            footerView.configure(cellViewModel: footerVM,
                                 from: self)
            
            return footerView
          default:
            assert(false, "Invalid element type")
          }
        
    }
    
}


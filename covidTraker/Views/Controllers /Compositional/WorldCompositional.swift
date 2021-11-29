//
//  WorldCompositional.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation
import UIKit

struct WorldCompositional : CompositionalLayoutProtocol {
 
    func create() -> UICollectionViewLayout  {
       
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 2, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalHeight(0.18))
        
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
        
            
    }
}

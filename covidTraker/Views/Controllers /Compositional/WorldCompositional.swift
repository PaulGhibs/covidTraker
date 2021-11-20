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
       
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalHeight(0.18))
        
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]
        section.orthogonalScrollingBehavior = .continuous
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
        
            
    }
}

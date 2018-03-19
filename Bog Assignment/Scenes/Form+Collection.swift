//
//  Form+Collection.swift
//  Bog Assignment
//
//  Created by nikoloz on 17.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import UIKit

extension FormViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.presenter?.numnberOfcollectionItems(in: section, forRow: collectionView.tag))!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.typeName(for: CollectionItemCell.self), for: indexPath) as! CollectionItemCell
        presenter?.configure(cell: collectionItemCell, with: collectionView.tag, for: indexPath)
        return collectionItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width/4, height: collectionView.frame.size.height)
    }
}

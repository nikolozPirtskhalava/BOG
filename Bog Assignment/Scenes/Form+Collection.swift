//
//  Form+Collection.swift
//  Bog Assignment
//
//  Created by nikoloz on 17.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import UIKit

extension FormViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.typeName(for: CollectionCell.self), for: indexPath) as! CollectionCell
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//
//  CollectionViewCell.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class SectionCollectionCell: UITableViewCell {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var labelSectionTitle: UILabel!
    
    deinit {
        print("deinit")
    }
}



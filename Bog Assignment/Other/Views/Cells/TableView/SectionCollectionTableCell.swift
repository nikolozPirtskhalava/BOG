//
//  CollectionViewCell.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class SectionCollectionTableCell: UITableViewCell, SectionCollectionTableCellView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelSectionTitle: UILabel!
    
    override func awakeFromNib() {
        collectionView.register(UINib.init(nibName: Helpers.typeName(for: CollectionItemCell.self), bundle: nil), forCellWithReuseIdentifier: Helpers.typeName(for: CollectionItemCell.self))
    }
    
    func display(title: String) {
        labelSectionTitle.text = title
    }
}

extension SectionCollectionTableCell {
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forPath indexPath: IndexPath) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = Helpers.tagFromIndexPath(indexPath: indexPath)
        collectionView.reloadData()
    }
}


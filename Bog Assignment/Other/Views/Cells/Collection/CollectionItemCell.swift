//
//  CollectionCell.swift
//  Bog Assignment
//
//  Created by nikoloz on 17.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class CollectionItemCell: UICollectionViewCell, CollectionItemView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    func display(title: String) {
        self.labelTitle.text = title
    }
    
    func display(icon: String) {
        self.iconImageView.image = UIImage(named: icon)
    }

}

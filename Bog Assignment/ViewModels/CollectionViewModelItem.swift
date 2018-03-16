//
//  CategoriesViewModelItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

struct CollectionViewModelItem: CollectionModelItem {
    var type: CollectionType
    var sectionTitle: String
    var rowCount: Int { return 3 }
    var items: [[CollectionItem]]
    
    init(items: [[CollectionItem]]) {
        self.items = items
    }
}

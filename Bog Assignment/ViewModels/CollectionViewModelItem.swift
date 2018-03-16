//
//  CategoriesViewModelItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

struct CollectionViewModelItem: CollectionModelItem {
    var type: CollectionType {
        return .CollectionVIew
    }
    var sectionTitle: String
    var items: [[CollectionItem]]
    var rowHeight: Float {
        return 100
    }
    var rowCount: Int {
        return items.count
    }
    
    init(items: [[CollectionItem]], sectionTitle: String) {
        self.items = items
        self.sectionTitle = sectionTitle
    }
}

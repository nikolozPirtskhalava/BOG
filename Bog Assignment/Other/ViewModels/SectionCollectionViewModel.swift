//
//  CategoriesViewModelItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

struct SectionCollectionViewModel: CollectionModelItem {
    
    var type: CollectionType {
        return .CollectionVIew
    }
    var items: [CollectionViewModel]
    var rowHeight: Float {
        return 150
    }
    var rowCount: Int {
        return 3
    }
    
    init(items: [CollectionViewModel]) {
        self.items = items
    }
}

//
//  ListViewModelItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


struct ListViewModelItem: CollectionModelItem {
    var type: CollectionType {
        return .List
    }
    var sectionTitle: String {
        return "ბოლო ოპერაციები"
    }
    var items: [Operation]
    var rowCount: Int {
        return items.count
    }
    
    init(items: [Operation]) {
        self.items = items
    }
}

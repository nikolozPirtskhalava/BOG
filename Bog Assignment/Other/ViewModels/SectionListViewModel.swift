//
//  ListViewModelItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


struct SectionListViewModel: CollectionModelItem {
    var type: CollectionType {
        return .List
    }
    var sectionTitle: String {
        return "ბოლო ოპერაციები"
    }
    var items: [Operation]
    var rowHeight: Float {
        return 60
    }
    var rowCount: Int {
        return 10
    }
    
    init(items: [Operation]) {
        self.items = items
    }
}

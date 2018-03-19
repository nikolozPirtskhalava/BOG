//
//  ListViewModelItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


struct SectionListViewModel: SectionViewModel {
    var type: SectionType {
        return .List
    }
    var sectionTitle: String {
        return Constants.kLastOperations
    }
    var items: [Operation]
    var rowHeight: Float {
        return Constants.kSectionListCellHeight
    }
    var rowCount: Int {
        return items.count
    }
    
    init(items: [Operation]) {
        self.items = items
    }
}

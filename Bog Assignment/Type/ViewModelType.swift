//
//  ViewModelType.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

enum CollectionType {
    case CollectionVIew
    case List
}

protocol CollectionModelItem {
    var type: CellType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

extension CollectionModelItem {
    var rowCount: Int {
        return 1
    }
}

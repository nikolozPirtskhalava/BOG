//
//  ViewModelType.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

enum SectionType {
    case CollectionView
    case List
}

protocol SectionViewModel{
    var type: SectionType { get }
    var rowCount: Int { get }
    var rowHeight: Float { get }
}

extension SectionViewModel {
    var rowCount: Int {
        return 1
    }
}

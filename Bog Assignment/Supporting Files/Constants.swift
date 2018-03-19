//
//  Constants.swift
//  Bog Assignment
//
//  Created by nikoloz on 18.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let kSectionCollectionCellHeight = Float(170.0)
    static let kSectionListCellHeight = Float(70.0)
    static let kOperationHeaderHeight = CGFloat(50)
    
    static let kLastOperations = "ბოლო ოპერაციები"
    static let kCategories = "კატეგორიები"
    static let kTemplates = "შაბლონები"
    static let kFavorites = "ფავორიტები"
    
    static let kDeleteTitle = "Delete"
    static let kHideTitle = "Hide"
    static let kMoreTitle = "More"
    
    static let kSectionCollectionCellIdentifier = Helpers.typeName(for: SectionCollectionTableCell.self)
    static let kOperationCellIdentifier = Helpers.typeName(for: OperationCell.self)
}

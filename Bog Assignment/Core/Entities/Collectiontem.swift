//
//  CollectionItem.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

enum CollectionItemType: String {
    case Category = "Category"
    case Favorite = "Favorite"
    case Template = "Template"
}

struct CollectionItem: InitializableWithData {
    var icon: String
    var title: String
    var type: CollectionItemType
    
    init(data: [String : Any]) throws {
        guard let icon = data["icon"] as? String,
            let title = data["title"] as? String,
            let typeString = data["type"] as? String,
            let type = CollectionItemType.init(rawValue: typeString) else {
                throw NSError()
        }
        
        self.icon = icon
        self.title = title
        self.type = type
    }
}


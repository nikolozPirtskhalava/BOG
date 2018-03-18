//
//  Helpers.swift
//  Bog Assignment
//
//  Created by nikoloz on 17.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

struct Helpers {
    
    static let multiplier = 1000
    
    public static func typeName(for object: Any) -> String {
        return String.init(describing: object)
    }
    
    public static func rowFromTag(tag: Int) -> Int {
        return tag % multiplier
    }
    
    public static func sectionFromTag(tag: Int) -> Int {
        return tag / multiplier
    }
    
    public static func tagFromIndexPath(indexPath: IndexPath) -> Int {
        return (indexPath.section * multiplier) + indexPath.row
    }
}

//
//  NSErrorExtensions.swift
//  Bog Assignment
//
//  Created by nikoloz on 17.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

extension NSError {
    static func createPraseError() -> NSError {
        return NSError(domain: "",
                       code: 999,
                       userInfo: [NSLocalizedDescriptionKey: "A parsing error occured"])
    }
}

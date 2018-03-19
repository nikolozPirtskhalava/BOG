//
//  OperationHeader.swift
//  Bog Assignment
//
//  Created by nikoloz on 18.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class OperationHeader: UIView {
    
    public static func xibInstance() -> OperationHeader? {
        guard let view = Bundle.main.loadNibNamed(Helpers.typeName(for: OperationHeader.self), owner: self, options: nil)?.first,
              let header = view as? OperationHeader else {
            return nil
        }
        return header
    }
}

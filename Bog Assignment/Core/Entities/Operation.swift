//
//  Transaction.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol InitializableWithData {
    init(data: [String: Any]) throws
}

struct Operation: InitializableWithJson {
    var icon: String
    var amount: String
    var title: String
    var time: String
    var id: String
    
    init(data: [String : Any]) throws {
      guard let icon = data["icon"] as? String,
            let amount = data["amount"] as? String,
            let title = data["title"] as? String,
            let time = data["time"] as? String,
            let id = data["id"] as? String else {
                throw NSError()
        }
        
        self.icon = icon
        self.amount = amount
        self.time = time
        self.title = title
        self.id = id
    }
}

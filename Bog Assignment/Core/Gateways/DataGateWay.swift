//
//  CollectionGateWay.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

typealias FetchDataGatewayCompletionHandler = (_ items: Result<[SectionViewModel]>) -> Void

protocol DataGateWay {
    func fetchCollectionData(completionHandler: FetchDataGatewayCompletionHandler)
}

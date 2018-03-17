//
//  CollectionGateWay.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

typealias FetchCollectionDataGatewayCompletionHandler = (_ items: Result<[CollectionModelItem]>) -> Void

protocol CollectionGateWay {
    func fetchCollectionData(completionHandler: FetchCollectionDataGatewayCompletionHandler)
}

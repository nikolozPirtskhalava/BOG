//
//  LocalPersistantCollectionGateway.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol LocalPersistantCollectionItemsGateWay: CollectionGateWay{
    
}

class PlistCollectionItemsGateWay: LocalPersistantCollectionItemsGateWay {
    
    func fetchCollectionData(completionHandler: @escaping FetchCollectionDataGatewayCompletionHandler) {
        
    }
}

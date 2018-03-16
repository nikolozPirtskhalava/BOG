//
//  DisplayCollectionItemsUseCase.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

typealias DisplayCollectionItemsUseCaseCompletionHandler = (_ items: Result<[CollectionModelItem]>) -> Void

protocol DisplayCollcetionItemsUseCase {
    func displayCollectionItems(completionHandler: @escaping DisplayCollectionItemsUseCaseCompletionHandler)
}

class DisplayCollcetionItemsUseCaseImplementation: DisplayCollcetionItemsUseCase {
    let collectionGateWay: CollectionGateWay
    
    init(collectionGateWay: CollectionGateWay) {
        self.collectionGateWay = collectionGateWay
    }
    
    func displayCollectionItems(completionHandler: @escaping DisplayCollectionItemsUseCaseCompletionHandler) {
        self.collectionGateWay.fetchCollectionData { (result) in
            completionHandler(result)
        }
    }
}

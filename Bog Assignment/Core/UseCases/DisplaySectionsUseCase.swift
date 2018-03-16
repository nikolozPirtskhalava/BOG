//
//  DisplayCollectionItemsUseCase.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

typealias DisplaySectionsUseCaseCompletionHandler = (_ items: Result<[CollectionModelItem]>) -> Void

protocol DisplaySectionsUseCase {
    func displaySections(completionHandler: @escaping DisplaySectionsUseCaseCompletionHandler)
}

class DisplaySectionsUseCaseImplementation: DisplaySectionsUseCase {
    let collectionGateWay: CollectionGateWay
    
    init(collectionGateWay: CollectionGateWay) {
        self.collectionGateWay = collectionGateWay
    }
    
    func displaySections(completionHandler: @escaping (Result<[CollectionModelItem]>) -> Void) {
        self.collectionGateWay.fetchCollectionData { (result) in
            completionHandler(result)
        }
    }
}

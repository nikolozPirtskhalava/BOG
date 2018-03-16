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
    func fetchCollectionData(completionHandler: @escaping (Result<[CollectionModelItem]>) -> Void) {
        var arrayToSend = [CollectionModelItem]()
        
        var dictRoot: NSDictionary?
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            dictRoot = NSDictionary(contentsOfFile: path)
        }
        
        var operationsArray:[Operation]?
        if let _ = dictRoot as? [String: Any] {
            let arrayList:[NSDictionary] = dictRoot?["Operations"] as! Array
            do {
                operationsArray = try arrayList.map { try Operation.init(data: $0 as! [String : Any]) }
            } catch {
                
            }
        }

        let sectionCollectionViewModel = SectionCollectionViewModel.init(items: [])
        let sectionListViewModel = SectionListViewModel.init(items: operationsArray!)
        arrayToSend.append(sectionCollectionViewModel)
        arrayToSend.append(sectionListViewModel)
        
        completionHandler(.success(arrayToSend))
    }
}

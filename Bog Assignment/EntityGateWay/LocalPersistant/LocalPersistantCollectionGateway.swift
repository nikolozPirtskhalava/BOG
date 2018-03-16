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
        
        if let dict = dictRoot {
            var arrayList:[NSDictionary] = dictRoot?["Operations"] as! Array
            // Now a loop through Array to fetch single Item from catList which is Dictionary
            arrayList.forEach({ (dict) in
                do {
                    try Operation.init(json: dict as! [String: Any])
                } catch {
                    
                }
                print(dict)
            })
        }

        let sectionCollectionViewModel = SectionCollectionViewModel.init(items: [])
        let sectionListViewModel = SectionListViewModel.init(items: [])
        arrayToSend.append(sectionCollectionViewModel)
        arrayToSend.append(sectionListViewModel)
        
        completionHandler(.success(arrayToSend))
    }
}

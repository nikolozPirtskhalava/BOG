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
    func fetchCollectionData(completionHandler: (Result<[CollectionModelItem]>) -> Void) {
        var arrayToSend = [CollectionModelItem]()
        
        var dictRoot: NSDictionary?
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            dictRoot = NSDictionary(contentsOfFile: path)
        }
        
        var operationsArray:[Operation]?
        var categoriesArray:[CollectionItem]?
        var favoritesArray:[CollectionItem]?
        var templatesArray:[CollectionItem]?
        
        if let _ = dictRoot as? [String: Any] {
            let arrayListOperations:[NSDictionary] = dictRoot?["Operations"] as! Array
            let arrayListCategories:[NSDictionary] = dictRoot?["Categories"] as! Array
            let arrayListFavorites:[NSDictionary] = dictRoot?["Favorites"] as! Array
            let arrayListTemplates:[NSDictionary] = dictRoot?["Templates"] as! Array
            do {
                operationsArray = try arrayListOperations.map { try Operation.init(data: $0 as! [String : Any]) }
                categoriesArray = try arrayListCategories.map { try CollectionItem.init(data: $0 as! [String : Any])}
                favoritesArray = try arrayListFavorites.map { try CollectionItem.init(data: $0 as! [String : Any])}
                templatesArray = try arrayListTemplates.map { try CollectionItem.init(data: $0 as! [String: Any])}
            } catch {
                completionHandler(.failure(NSError.createPraseError()))
            }
        }

        let categoriesViewModel = CollectionViewModel.init(sectionTitle: "კატეგორიები", items: categoriesArray!)
        let favoritesViewModel = CollectionViewModel.init(sectionTitle: "ფავორიტები", items: favoritesArray!)
        let templatesViewModel = CollectionViewModel.init(sectionTitle: "შაბლონები", items: templatesArray!)
        
        let sectionCollectionViewModel = SectionCollectionViewModel.init(items: [categoriesViewModel,favoritesViewModel,templatesViewModel])
        let sectionListViewModel = SectionListViewModel.init(items: operationsArray!)
        arrayToSend.append(sectionCollectionViewModel)
        arrayToSend.append(sectionListViewModel)
        
        completionHandler(.success(arrayToSend))
    }
}

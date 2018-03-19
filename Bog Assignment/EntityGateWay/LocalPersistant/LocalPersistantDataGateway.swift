//
//  LocalPersistantCollectionGateway.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol LocalPersistantDataGateway: DataGateWay {
    
}

class PlistCollectionItemsGateWay: LocalPersistantDataGateway {
    func fetchCollectionData(completionHandler: (Result<[SectionViewModel]>) -> Void) {
        var collectionModelItems = [SectionViewModel]()
        
        var operationsArray = [Operation]()
        var categoriesArray = [CollectionItem]()
        var favoritesArray = [CollectionItem]()
        var templatesArray = [CollectionItem]()
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            if let dictRoot = NSDictionary(contentsOfFile: path) as? [String:Any] {
                guard let arrayListOperations:[NSDictionary] = dictRoot["Operations"] as? Array,
                    let arrayListCategories:[NSDictionary] = dictRoot["Categories"] as? Array,
                    let arrayListFavorites:[NSDictionary] = dictRoot["Favorites"] as? Array,
                    let arrayListTemplates:[NSDictionary] = dictRoot["Templates"] as? Array else {
                        completionHandler(.failure(NSError.createPraseError()))
                        return
                }
                
                do {
                    operationsArray = try arrayListOperations.map { try Operation.init(data: $0 as! [String : Any]) }
                    categoriesArray = try arrayListCategories.map { try CollectionItem.init(data: $0 as! [String : Any])}
                    favoritesArray = try arrayListFavorites.map { try CollectionItem.init(data: $0 as! [String : Any])}
                    templatesArray = try arrayListTemplates.map { try CollectionItem.init(data: $0 as! [String: Any])}
                } catch {
                    completionHandler(.failure(NSError.createPraseError()))
                    return
                }
                
                let categoriesViewModel = CollectionViewModel.init(sectionTitle: Constants.kCategories, items: categoriesArray)
                let favoritesViewModel = CollectionViewModel.init(sectionTitle: Constants.kFavorites, items: favoritesArray)
                let templatesViewModel = CollectionViewModel.init(sectionTitle: Constants.kTemplates, items: templatesArray)
                
                let sectionCollectionViewModel = SectionCollectionViewModel.init(items: [categoriesViewModel,favoritesViewModel,templatesViewModel])
                let sectionListViewModel = SectionListViewModel.init(items: operationsArray)
                collectionModelItems.append(sectionCollectionViewModel)
                collectionModelItems.append(sectionListViewModel)
                
                completionHandler(.success(collectionModelItems))
            }
        }
    }
}

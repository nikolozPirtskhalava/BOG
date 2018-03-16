//
//  FormConfigurator.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


protocol FormConfigurator {
    func configure(for formViewController: FormViewController)
}

class FormConfiguratorImplementation: FormConfigurator {
    func configure(for formViewController: FormViewController) {
        let localPersistantGateway = PlistCollectionItemsGateWay()
        let displaySectionsUseCase = DisplaySectionsUseCaseImplementation.init(collectionGateWay: localPersistantGateway)
        let presenter = FormPresenterImplementation.init(view: formViewController, displaySectionsUseCase: displaySectionsUseCase)
        formViewController.presenter = presenter
    }
}

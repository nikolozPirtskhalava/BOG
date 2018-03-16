//
//  FormPresenter.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol OperationCellView {
    func display(icon: String)
    func display(title: String)
    func display(time: String)
    func display(id: String)
    func display(amount: String)
}

protocol FormView: class {
    func resfreshTableView()
    func displayDataFetchError(_ error: Error)
}

protocol FormPresenter {
    var  numberOfSections:Int { get }
    func configure(cell: OperationCell, for indexpath: IndexPath)
    func configure(cell: CollectionViewCell, forRow row: Int)
    func numberOfRows(in section: Int) -> Int
    func rowHeight(for section: Int) -> Float
    func typeFor(section: Int) -> CollectionType
    func viewDidLoad()
}

class FormPresenterImplementation: FormPresenter {
    
    fileprivate weak var view: FormView?
    fileprivate let displaySectionsUseCase: DisplaySectionsUseCase?
    var items = [CollectionModelItem]()
    
    init(view: FormView?, displaySectionsUseCase: DisplaySectionsUseCase?) {
        self.view = view
        self.displaySectionsUseCase = displaySectionsUseCase
    }
    
    var numberOfSections: Int {
        return items.count
    }
    
    func viewDidLoad() {
        self.displaySectionsUseCase?.displaySections(completionHandler: { (result) in
            switch result {
            case let .success(items):
                self.handleFetchedItems(items)
            case let .failure(_):
                break
            }
        })
    }
    
    func handleFetchedItems(_ items: [CollectionModelItem]) {
        self.items = items
        self.view?.resfreshTableView()
    }
    
    func configure(cell: OperationCell, for indexpath: IndexPath) {
        let sectionListModelItem = self.items[indexpath.section] as! SectionListViewModel
        let operation = sectionListModelItem.items[indexpath.row]
        
        cell.display(id: operation.id)
        cell.display(icon: operation.icon)
        cell.display(time: operation.time)
        cell.display(title: operation.title)
        cell.display(amount: operation.amount)
    }
    
    func configure(cell: CollectionViewCell, forRow row: Int) {
        
    }
    
    func typeFor(section: Int) -> CollectionType {
        return self.items[section].type
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.items[section].rowCount
    }
    
    func rowHeight(for section: Int) -> Float {
        return self.items[section].rowHeight
    }
    
}

//
//  FormPresenter.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol FormView: class {
    func resfreshTableView()
    func displayDataFetchError(_ error: Error)
}

protocol FormPresenter {
    var  numberOfSections:Int { get }
    func configure(cell: OperationCell, forRow row: Int)
    func configure(cell: CollectionViewCell, forRow row: Int)
    func numberOfRows(in section: Int) -> Int
    func rowHeight(for section: Int) -> Float
    func typeFor(section: Int) -> CollectionType
    func viewDidLoad()
}

class FormPresenterImplementation: FormPresenter {
    
    fileprivate weak var view: FormView?
    var items = [CollectionModelItem]()
    
    init(view: FormView?) {
        self.view = view
    }
    
    var numberOfSections: Int {
        return items.count
    }
    
    func viewDidLoad() {
        
    }
    
    func configure(cell: OperationCell, forRow row: Int) {
        
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

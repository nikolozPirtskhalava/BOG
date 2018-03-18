//
//  Form+List.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

extension FormViewController: UITableViewDataSource {
    
    func configureTableOnLoad() {
        self.tableView.register(UINib.init(nibName: Helpers.typeName(for: Constants.kSectionCollectionCellIdentifier), bundle: nil), forCellReuseIdentifier: Constants.kSectionCollectionCellIdentifier)
        self.tableView.register(UINib.init(nibName: Helpers.typeName(for: Constants.kOperationCellIdentifier), bundle: nil), forCellReuseIdentifier: Helpers.typeName(for: Constants.kOperationCellIdentifier))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.presenter!.typeFor(section: indexPath.section) {
        case .CollectionVIew:
            let collectionViewcell = tableView.dequeueReusableCell(withIdentifier: Constants.kSectionCollectionCellIdentifier) as! SectionCollectionTableCell
            collectionViewcell.setCollectionViewDataSourceDelegate(self, forPath: indexPath)
            self.presenter?.configure(cell: collectionViewcell, for: indexPath)
            return collectionViewcell
        default:
            let operationCell = tableView.dequeueReusableCell(withIdentifier: Constants.kOperationCellIdentifier) as! OperationCell
            self.presenter?.configure(cell: operationCell, for: indexPath)
            return operationCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.presenter?.numberOfSections)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else {
            return 0
        }
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.presenter?.typeFor(section: indexPath.section) == .List ? true : false
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction.init(style: .default, title: "delete") { (action, indexPath) in
        }
        let moreAction = UITableViewRowAction.init(style: .default, title: "More") { (action, indexPath) in
        }
        let hideAction = UITableViewRowAction.init(style: .default, title: "Hide") { (action, indexPath) in
        }
        
        return [hideAction,moreAction,deleteAction]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}

extension FormViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let operationsHeader = self.operationsHeader else {
            return UIView()
        }
        return self.presenter?.typeFor(section: section) == .List ? operationsHeader : UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = self.presenter else {
            return 0
        }
        return CGFloat(presenter.rowHeight(for: indexPath.section))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.presenter?.typeFor(section: section) == .List ? Constants.kOperationHeaderHeight : 0
    }
    
}

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
        tableView.register(UINib.init(nibName: Helpers.typeName(for: Constants.kSectionCollectionCellIdentifier), bundle: nil), forCellReuseIdentifier: Constants.kSectionCollectionCellIdentifier)
        tableView.register(UINib.init(nibName: Helpers.typeName(for: Constants.kOperationCellIdentifier), bundle: nil), forCellReuseIdentifier: Helpers.typeName(for: Constants.kOperationCellIdentifier))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter!.typeFor(section: indexPath.section) {
        case .CollectionView:
            let collectionViewcell = tableView.dequeueReusableCell(withIdentifier: Constants.kSectionCollectionCellIdentifier) as! SectionCollectionTableCell
            collectionViewcell.setCollectionViewDataSourceDelegate(self, forPath: indexPath)
            presenter?.configure(cell: collectionViewcell, for: indexPath)
            return collectionViewcell
        default:
            let operationCell = tableView.dequeueReusableCell(withIdentifier: Constants.kOperationCellIdentifier) as! OperationCell
            presenter?.configure(cell: operationCell, for: indexPath)
            return operationCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSections = presenter?.numberOfSections else {
            return 0
        }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = presenter?.numberOfRows(in: section) else {
            return 0
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.presenter?.typeFor(section: indexPath.section) == .List ? true : false
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction.init(style: .default, title: Constants.kDeleteTitle) { (action, indexPath) in }
        let moreAction = UITableViewRowAction.init(style: .default, title: Constants.kMoreTitle) { (action, indexPath) in }
        let hideAction = UITableViewRowAction.init(style: .default, title: Constants.kHideTitle) { (action, indexPath) in }

        deleteAction.backgroundColor = UIColor.red
        moreAction.backgroundColor = UIColor.gray
        hideAction.backgroundColor = UIColor.brown
        
        return [hideAction,moreAction,deleteAction]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}

extension FormViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return presenter?.typeFor(section: section) == .List ? operationsHeader : UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = presenter?.rowHeight(for: indexPath.section) else {
            return 0
        }
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return presenter?.typeFor(section: section) == .List ? Constants.kOperationHeaderHeight : 0
    }
    
}

//
//  Form+List.swift
//  Bog Assignment
//
//  Created by nikoloz on 16.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableOnLoad() {
        self.tableView.register(UINib.init(nibName: Helpers.typeName(for: CollectionViewCell.self), bundle: nil), forCellReuseIdentifier: Helpers.typeName(for: CollectionViewCell.self))
        self.tableView.register(UINib.init(nibName: Helpers.typeName(for: OperationCell.self), bundle: nil), forCellReuseIdentifier: Helpers.typeName(for: OperationCell.self))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collectionViewcell = tableView.dequeueReusableCell(withIdentifier: Helpers.typeName(for: CollectionViewCell.self)) as! CollectionViewCell
        let operationCell = tableView.dequeueReusableCell(withIdentifier: Helpers.typeName(for: OperationCell.self)) as! OperationCell
        
        switch self.presenter?.typeFor(section: indexPath.section) {
        case .CollectionVIew?:
            self.presenter?.configure(cell: collectionViewcell, forRow: indexPath.row)
            collectionViewcell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            return collectionViewcell
        default:
            self.presenter?.configure(cell: operationCell, for: indexPath)
            return operationCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else {
            return 0
        }
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = self.presenter else {
            return 0
        }
        return CGFloat(presenter.rowHeight(for: indexPath.section))
    }
}

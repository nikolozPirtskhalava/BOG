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
        self.tableView.register(UINib.init(nibName: Helpers.typeName(for: Helpers.typeName(for: SectionCollectionTableCell.self)), bundle: nil), forCellReuseIdentifier: Helpers.typeName(for: SectionCollectionTableCell.self))
        self.tableView.register(UINib.init(nibName: Helpers.typeName(for: OperationCell.self), bundle: nil), forCellReuseIdentifier: Helpers.typeName(for: OperationCell.self))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.presenter!.typeFor(section: indexPath.section) {
        case .CollectionVIew:
            let collectionViewcell = tableView.dequeueReusableCell(withIdentifier: Helpers.typeName(for: SectionCollectionTableCell.self)) as! SectionCollectionTableCell
            collectionViewcell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            self.presenter?.configure(cell: collectionViewcell, for: indexPath)
            return collectionViewcell
        default:
            let operationCell = tableView.dequeueReusableCell(withIdentifier: Helpers.typeName(for: OperationCell.self)) as! OperationCell
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = self.presenter else {
            return 0
        }
        return CGFloat(presenter.rowHeight(for: indexPath.section))
    }
}

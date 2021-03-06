//
//  TransactionCell.swift
//  Bog Assignment
//
//  Created by nikoloz on 15.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class OperationCell: UITableViewCell, OperationCellView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    
    func display(id: String) {
        self.labelId.text = id
    }
    
    func display(icon: String) {
        iconImageView.image = UIImage(named: icon)
    }
    
    func display(title: String) {
        labelTitle.text = title
    }
    
    func display(amount: String) {
        labelAmount.text = amount
    }
    
    func display(time: String) {
        labelTime.text = time
    }
}

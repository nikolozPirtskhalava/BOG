//
//  ViewController.swift
//  Bog Assignment
//
//  Created by nikoloz on 15.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FormPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureTableOnLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


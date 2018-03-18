//
//  ViewController.swift
//  Bog Assignment
//
//  Created by nikoloz on 15.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, FormView {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var operationsHeader: OperationHeader? = {
       return OperationHeader.xibInstance()
    }()
    
    var presenter: FormPresenter?
    let configurator = FormConfiguratorImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureTableOnLoad()
        self.configurator.configure(for: self)
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }

    func resfreshTableView() {
        self.tableView.reloadData()
    }
    
    func displayDataFetchError(_ error: Error) {
        UIAlertController.init(title: error.localizedDescription).show()
    }
}


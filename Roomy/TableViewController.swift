//
//  TableViewController.swift
//  Roomy
//
//  Created by User on 3/10/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var myTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
//MARK:- TableView funcs
extension TableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = myTableview.cellForRow(at: indexPath) {
            self.performSegue(withIdentifier: "gotoListView", sender: cell)
        }
    }
}

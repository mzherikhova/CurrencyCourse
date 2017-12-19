//
//  DetailsTableViewController.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import UIKit

private let reuseIdentifier = "reuseIdentifier"

class DetailsTableViewController: UITableViewController {
    
    var currency: Currency? {
        didSet {
            guard let item = currency else { return }
            tableItems = item.values
            title = item.charCode
        }
    }
    
    var tableItems = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = tableItems[indexPath.item]
        return cell
    }
}

//
//  MyJokesViewController.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class MyJokesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let identifier = "MyJokesCell"
    var presenter: MyJokesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyJokeTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

    @IBAction func addAction(_ sender: UIButton) {
        presenter.showAddNewJokeScreen()
    }
}

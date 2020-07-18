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
        presenter.getJokesFromCoreData()
        tableView.register(UINib(nibName: "MyJokeTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction)), animated: true)
    }

    @objc func addAction() {
        presenter.showAddNewJokeScreen()
    }
}

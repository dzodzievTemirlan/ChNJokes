//
//  ViewController.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let tableCellIdentifier = "MainJokeViewCell"
    @IBOutlet weak var tableView: UITableView!
    var presenter: MainPresenterViewProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOptions()
    }
    // MARK: - TableView Options
    fileprivate func tableViewOptions() {
        let nib = UINib(nibName: tableCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.separatorColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    // MARK: - Shake method
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            presenter.getJokes()
        }
    }
}

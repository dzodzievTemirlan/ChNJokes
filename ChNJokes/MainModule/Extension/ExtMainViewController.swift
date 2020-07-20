//
//  ExtMainViewController+UITableViewDataSource.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
// MARK: - MainViewController + UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = presenter.jokesArray?.count else {return 0}
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath)
            as? MainJokeViewCell
            else {return UITableViewCell()}
        guard let jokes = presenter.jokesArray?[indexPath.row] else {return cell}
        cell.jokeLabel.text = jokes.joke
        cell.shareButtonPressed = self
        return cell
    }
}
// MARK: - MainViewController + UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(CGFloat(200))
    }
}
// MARK: - MainViewController + MainProtocol
extension MainViewController: MainProtocol {
    func success() {
        tableView.reloadData()
    }
    func failure(_ error: Error) {
        let alert = UIAlertController(title: "Data doen't come", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
// MARK: - MainViewController + MyJokeTableViewCellProtocol
extension MainViewController: MyJokeTableViewCellProtocol {
    func shareWith(activity: UIActivityViewController) {
        present(activity, animated: true, completion: nil)
    }
}

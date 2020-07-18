//
//  MyJokesDataSource.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

extension MyJokesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyJokesCell",
                                                       for: indexPath) as? MyJokeTableViewCell else { return  UITableViewCell() }
        cell.item = presenter.items[indexPath.row]
        cell.myJokeTableViewCellDelegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           let contextItem = UIContextualAction(style: .destructive, title: "Delete") {[weak self]  (_, _, _) in
            guard let item = self?.presenter.items[indexPath.row] else {return }
            CoreDataService.shared.deleteSite(item: item)
               DispatchQueue.main.async {
                   tableView.deleteRows(at: [indexPath], with: .fade)
               }
            self?.presenter.getJokesFromCoreData()
            }
            let swipeAction = UISwipeActionsConfiguration(actions: [contextItem])

            return swipeAction
        }
}

extension MyJokesViewController: MyJokeTableViewCellProtocol {
    func shareWith(activity: UIActivityViewController) {
        present(activity, animated: true)
    }
    

}

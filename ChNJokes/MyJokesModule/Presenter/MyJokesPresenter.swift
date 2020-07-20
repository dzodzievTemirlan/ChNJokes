//
//  MyJokesPresenter.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

class MyJokesPresenter: NewJokePresenterProtocol {

    let view: MyJokesViewController
    var items:[Item] = []
    required init(view:MyJokesViewController) {
        self.view = view
//        getJokesFromCoreData()
    }

    func getJokesFromCoreData() {
        CoreDataService.shared.fetchItem {[weak self] (items, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let items = items {
                self?.items = items
                DispatchQueue.main.async {
                    self?.view.tableView.reloadData()
                }
            }
        }
    }

    func delete(item: Item) {
        CoreDataService.shared.deleteSite(item: item)
        getJokesFromCoreData()
    }
    func showAddNewJokeScreen() {
        let newView = NewJokeViewController(nibName: "NewJokeViewController", bundle: nil)
        let newJokePresenter = NewJokePresenter(view: newView)
        newView.presenter = newJokePresenter
        newView.presenter.newJokePresenterDelegate = self
        view.navigationController?.pushViewController(newView, animated: true)
    }

    func shouldUpdateTable() {
        getJokesFromCoreData()
    }
}

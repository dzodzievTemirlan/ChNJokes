//
//  NewJokePresenter.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation
protocol NewJokePresenterProtocol: class {
    func shouldUpdateTable()
}
class NewJokePresenter {

    let view: NewJokeViewController
    weak var newJokePresenterDelegate: NewJokePresenterProtocol?

    required init(view: NewJokeViewController) {
        self.view = view
    }

    func saveJoke(joke: String)  {
        CoreDataService.shared.createNewItem(joke: joke)
        newJokePresenterDelegate?.shouldUpdateTable()
    }
}

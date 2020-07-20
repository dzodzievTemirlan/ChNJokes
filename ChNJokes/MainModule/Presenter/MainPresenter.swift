//
//  MainPresenter.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol MainProtocol: class {
    func success()
    func failure(_ error: Error)
}
protocol MainPresenterViewProtocol: class {
    var jokesArray: [Items]? {get set}
    func getJokes()
    init(view: MainProtocol, networkService: NetworkServiceProtocol)
}

class MainPresenter:MainPresenterViewProtocol {
    weak var view: MainProtocol?
    var networkService: NetworkServiceProtocol?
    var jokesArray: [Items]?
    required init(view: MainProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getJokes()
    }
    func getJokes() {
        networkService?.getData(complition: { [weak self] (result) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let jokes):
                    self.jokesArray = jokes?.value
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error)
                }
            }
        })
    }
}

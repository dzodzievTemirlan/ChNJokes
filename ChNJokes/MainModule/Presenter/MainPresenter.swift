//
//  MainPresenter.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol MainProtocol: class {
    
}
protocol MainPresenterViewProtocol: class {
    init(view: MainProtocol)
}

class MainPresenter:MainPresenterViewProtocol {
    weak var view: MainProtocol?
    required init(view: MainProtocol) {
        self.view = view
    }
}

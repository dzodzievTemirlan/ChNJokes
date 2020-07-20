//
//  SettingPresenter.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 19.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol SettingPresenterProtocol: class {
}

protocol SettingPresenterViewProtocol: class {
    init(view: SettingPresenterProtocol)
}

class SettingPreseter: SettingPresenterViewProtocol {
    weak var view: SettingPresenterProtocol?
    required init(view: SettingPresenterProtocol) {
        self.view = view
    }
}

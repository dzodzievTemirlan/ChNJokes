//
//  Builder.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
    static func createMyJokesScreen() -> UIViewController
    static func createSettingScreen() -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createMyJokesScreen() -> UIViewController {
        let view = MyJokesViewController()
        let presenter = MyJokesPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createSettingScreen() -> UIViewController {
        let view = SettingViewController()
        let presenter = SettingPreseter(view: view)
        view.presenter = presenter
        return view
    }
}

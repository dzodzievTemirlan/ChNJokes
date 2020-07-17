//
//  Router.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class RouterTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        let jokeList = generateNavController(vc: ModuleBuilder.createMainModule(), title: "Joke List")
      
        viewControllers = [jokeList]
        
    }
    
    fileprivate func generateNavController(vc: UIViewController, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = title
        navController.title = title
        return navController
    }
}

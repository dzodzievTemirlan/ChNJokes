//
//  ViewController.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: MainProtocol {
    
}

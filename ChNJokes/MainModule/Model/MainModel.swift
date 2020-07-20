//
//  MainModel.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

struct Value: Codable {
    let value : [Items]
}
struct Items: Codable {
    let id : Int
    let joke: String
}
struct PersonModel: Codable {
    let firstName: String
    let lastName: String
}

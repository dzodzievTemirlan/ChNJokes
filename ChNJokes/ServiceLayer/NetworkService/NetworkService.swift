//
//  NetworkService.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getData(complition: @escaping(Result<Value?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    var firstName: String?
    var lastName: String?
    func getData(complition: @escaping(Result<Value?, Error>) -> Void) {
        CoreDataService.shared.fetchPerson { (person, error) in
            if error == nil {
                if person?.isEmpty == false {
                    self.firstName = person?[0].firstName
                    self.lastName = person?[0].lastName
                }
            }
        }
        let param = PersonModel(firstName: firstName ?? "Chuck", lastName: lastName ?? "Norris")
        AF.request(URL(string: "https://api.icndb.com/jokes/random/15")!, method: .get, parameters: (param)).response { (response) in
            do {
                guard let data = response.data else {return}
                let jokes = try JSONDecoder().decode(Value.self, from: data)
                complition(.success(jokes))
            } catch {
                complition(.failure(error))
            }
        }
    }
}

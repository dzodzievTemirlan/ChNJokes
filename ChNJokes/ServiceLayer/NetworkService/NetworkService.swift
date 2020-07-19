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
    
    func getData(complition: @escaping(Result<Value?, Error>) -> Void) {
        AF.request(URL(string: "https://api.icndb.com/jokes/random/15")!, method: .get).response { (response) in
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

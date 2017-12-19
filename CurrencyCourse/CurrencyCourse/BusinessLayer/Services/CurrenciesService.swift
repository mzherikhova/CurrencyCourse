//
//  CurrenciesService.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class CurrenciesService: ServiceProtocol {
    
    typealias DataModel = [Currency]
    
    func fetch(withCompletion completion: @escaping(Result<[Currency]>) -> Void) {
        Alamofire.request(URLConstants.dailyJson, method: .get, encoding: URLEncoding.default)
            .logRequest()
            .responseJSON { [weak self] response in
                if case let .success(value) = response.result,
                    let valute = (value as? [String : AnyObject])?["Valute"] as? [String : AnyObject] {
                    let currencies = valute.values.flatMap{ $0 }
                    self?.parse(json: currencies, withCompletion: completion)
                } else {
                    self?.parse(response: response, withCompletion: completion)
                }
        }
    }
}

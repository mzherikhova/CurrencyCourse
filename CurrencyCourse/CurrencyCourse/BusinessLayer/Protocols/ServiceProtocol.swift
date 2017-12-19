//
//  ServiceProtocol.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol ServiceProtocol {
    associatedtype DataModel
    
    func fetch(withCompletion completion: @escaping (Result<DataModel>) -> Void)
}

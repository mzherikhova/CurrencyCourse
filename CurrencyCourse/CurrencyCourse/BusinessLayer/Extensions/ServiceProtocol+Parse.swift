//
//  ServiceProtocol+Completion.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

extension ServiceProtocol {
    
    func parse<T: BaseMappable>(response: DataResponse<Any>,
                  forKeyPath path: String? = nil,
                  withCompletion completion: (Result<[T]>) -> Void) {
        switch response.result {
        case let .success(value):
            parse(json: value, forKeyPath: path, withCompletion: completion)
        case let .failure(error):
            completion(.failure(error))
        }
    }
    
    func parse<T: BaseMappable>(response: DataResponse<Any>,
                  forKeyPath path: String? = nil,
                  withCompletion completion: (Result<T>) -> Void) {
        switch response.result {
        case let .success(value):
            parse(json: value, forKeyPath: path, withCompletion: completion)
        case let .failure(error):
            completion(.failure(error))
        }
    }
    
    func parse<T: BaseMappable>(json: Any,
                                forKeyPath path: String? = nil,
                                withCompletion completion: (Result<[T]>) -> Void) {
        let mapper = Mapper<T>(context: nil, shouldIncludeNilValues: false)
        if let keyPath = path,
            !keyPath.isEmpty,
            let parsedObject = mapper.mapArray(JSONObject: (json as AnyObject).value(forKeyPath: keyPath)) {
            completion(.success(parsedObject))
        } else if let parsedObject = mapper.mapArray(JSONObject: json) {
            completion(.success(parsedObject))
        } else {
            completion(.failure(APIErrorType.dataSerializationFailed.error))
        }
    }
    
    func parse<T: BaseMappable>(json: Any,
                                forKeyPath path: String? = nil,
                                withCompletion completion: (Result<T>) -> Void) {
        let mapper = Mapper<T>(context: nil, shouldIncludeNilValues: false)
        if let keyPath = path,
            !keyPath.isEmpty,
            let parsedObject = mapper.map(JSONObject: (json as AnyObject).value(forKeyPath: keyPath)) {
            completion(.success(parsedObject))
        } else if let parsedObject = mapper.map(JSONObject: json) {
            completion(.success(parsedObject))
        } else {
            completion(.failure(APIErrorType.dataSerializationFailed.error))
        }
    }
}

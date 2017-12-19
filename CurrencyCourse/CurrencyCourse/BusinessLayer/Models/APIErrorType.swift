//
//  ErrorType.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation

enum APIErrorType {
    static let domain = "testapp.apierror"
    
    case dataSerializationFailed
    
    var error: NSError {
        switch self {
        case .dataSerializationFailed:
            let message = "ObjectMapper failed to serialize response."
            return NSError(domain: APIErrorType.domain, code: 1, userInfo: [NSLocalizedFailureReasonErrorKey: message])
        }
    }
}

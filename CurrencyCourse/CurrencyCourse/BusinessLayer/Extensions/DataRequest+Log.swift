//
//  DataRequest+Log.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    public func logRequest() -> Self {
        #if DEBUG
            debugPrint(self)
        #endif
        return self
    }
}

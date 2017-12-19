//
//  CurrencyListViewModel.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 17.12.2017.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation

class CurrencyListViewModel {
    private(set) var currencyArray = [Currency]()
    private var currencyService: CurrenciesService?
    
    func updateCurrency(completion:@escaping () -> Void) {
        guard let service = currencyService else {
            completion()
            return
        }
        service.fetch { [weak self] (result) in
            guard let strongSelf = self else { return }
            defer { completion() }
            switch result {
            case let .success(currencies):
                strongSelf.currencyArray = currencies
            case .failure:
                strongSelf.currencyArray.removeAll()
            }
        }
    }
    
    func coutOfCurrencies() -> Int {
        return currencyArray.count
    }
    
    required init(currencyService service: CurrenciesService) {
        currencyService = service
    }
}

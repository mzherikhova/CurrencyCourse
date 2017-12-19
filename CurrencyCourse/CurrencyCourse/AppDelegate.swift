//
//  AppDelegate.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 16.12.2017.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        if let navVC = self.window?.rootViewController as? UINavigationController,
            let startController = navVC.visibleViewController as? CurrencyListViewController {
            startController.viewModel = CurrencyListViewModel(currencyService: CurrenciesService())
        }
        
        return true
    }
    
}


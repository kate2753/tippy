//
//  UserDefaultSettings.swift
//  tippy
//
//  Created by kate_odnous on 7/19/16.
//  Copyright © 2016 Kate Odnous. All rights reserved.
//

import Foundation

class UserDefaultSettings {
    static let DEFAULT_PERCENTAGE_STORAGE_KEY = "tippy_default_percentage_idx"
    static let DEFAULT_PERCENTAGE_INITIAL_INDEX = 1
    
    static func getDefaultTipPercentageIdx() -> Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let storedPercentageDefault = userDefaults.integerForKey(DEFAULT_PERCENTAGE_STORAGE_KEY)
        return storedPercentageDefault ?? DEFAULT_PERCENTAGE_INITIAL_INDEX
    }
    
    static func storeDefaultTipPercentageIdx(defaultPercentage: Int) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(defaultPercentage, forKey: DEFAULT_PERCENTAGE_STORAGE_KEY)
        userDefaults.synchronize()
    }
}
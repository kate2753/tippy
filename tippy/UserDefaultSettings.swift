//
//  UserDefaultSettings.swift
//  tippy
//
//  Created by kate_odnous on 7/19/16.
//  Copyright © 2016 Kate Odnous. All rights reserved.
//

import Foundation

class UserDefaultSettings {
  private static let defaultPercentageStorageKey = "tippy_default_percentage_idx"
  static let defaultPercentageInitialIndex = 1
  
  static func getDefaultTipPercentageIdx() -> Int {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let storedPercentageDefault = userDefaults.integerForKey(defaultPercentageStorageKey)
    return storedPercentageDefault ?? defaultPercentageInitialIndex
  }
  
  static func storeDefaultTipPercentageIdx(defaultPercentage: Int) {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.setInteger(defaultPercentage, forKey: defaultPercentageStorageKey)
    userDefaults.synchronize()
  }
}
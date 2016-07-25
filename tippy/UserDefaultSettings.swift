//
//  UserDefaultSettings.swift
//  tippy
//
//  Created by kate_odnous on 7/19/16.
//  Copyright © 2016 Kate Odnous. All rights reserved.
//

import Foundation

class UserDefaultSettings {
  private static let isDarkThemeKey = "tippy_theme"
  static let theme_dark = "dark"
  static let theme_light = "light"
  private static let billAmountKey = "tippy_bill_amount"
  private static let billAmountTimestampKey = "tippy_bill_amount_ts"
  private static let defaultPercentageStorageKey = "tippy_default_percentage_idx"
  private static let defaultPercentageInitialIndex = 1
  
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
  
  static func storeBillAmount(bill: Double) {
    let currentTimestamp = NSDate()
    let userDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.setDouble(bill, forKey: billAmountKey)
    userDefaults.setObject(currentTimestamp, forKey: billAmountTimestampKey)
    userDefaults.synchronize()
  }
  
  static func getBillAmount() -> Double {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let billAmountTimestamp = userDefaults.objectForKey(billAmountTimestampKey)
    let billAmount = userDefaults.doubleForKey(billAmountKey)

    // timeIntervalSinceNow will be negative seconds, because billAmountTimestamp is earlier than current timestamp
    // so we want to return saved bill amount if billAmountTimestamp is less than 10 mins ago
    if billAmountTimestamp?.timeIntervalSinceNow >= 10 * 60 * -1 {
      return billAmount
    } else {
      return 0
    }
  }
  
  static func storeIsDarkTheme(isDarkTheme: Bool) {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.setBool(isDarkTheme, forKey: isDarkThemeKey)
  }

  
  static func getIsDarkTheme() -> Bool {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    return userDefaults.boolForKey(isDarkThemeKey)
  }
}
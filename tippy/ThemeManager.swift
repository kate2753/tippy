//
//  ThemeManager.swift
//  tippy
//
//  Created by kate_odnous on 7/25/16.
//  Copyright © 2016 Kate Odnous. All rights reserved.
//

import UIKit

class ThemeManager {
  func applyTheme(parentView: UIView) {
    var textColor = UIColor.blackColor()
    var backgroundColor = UIColor.whiteColor()
    var tintColor = UIColor.purpleColor()

    if UserDefaultSettings.getIsDarkTheme() {
      backgroundColor = UIColor.grayColor()
      textColor = UIColor.whiteColor()
      tintColor = UIColor.greenColor()
    }
    
    parentView.backgroundColor = backgroundColor
    for view in parentView.subviews {
      if let label = view as? UILabel {
        label.textColor = textColor
      }
      else if let uiSwitch = view as? UISwitch {
        uiSwitch.tintColor = tintColor
      }
      else if let uiSegmentedControl = view as? UISegmentedControl {
        uiSegmentedControl.tintColor = tintColor
      }
    }
  }

}
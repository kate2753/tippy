//
//  SettingsViewController.swift
//  tippy
//
//  Created by kate_odnous on 7/19/16.
//  Copyright © 2016 Kate Odnous. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
  @IBOutlet weak var themeSwitchControl: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ThemeManager().applyTheme(self.view);
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    defaultTipPercentage.selectedSegmentIndex = UserDefaultSettings.getDefaultTipPercentageIdx()
    themeSwitchControl.on = UserDefaultSettings.getIsDarkTheme()
  }
  
  @IBAction func defaultPercentageChanged(sender: AnyObject) {
    UserDefaultSettings.storeDefaultTipPercentageIdx(defaultTipPercentage.selectedSegmentIndex)
  }
  
  @IBAction func onThemeChanged(sender: AnyObject) {
    UserDefaultSettings.storeIsDarkTheme(themeSwitchControl.on)
    ThemeManager().applyTheme(self.view);
  }
}

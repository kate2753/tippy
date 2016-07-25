//
//  ViewController.swift
//  tippy
//
//  Created by kate_odnous on 7/17/16.
//  Copyright © 2016 Kate Odnous. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
  
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipControl: UISegmentedControl!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tipControl.selectedSegmentIndex = UserDefaultSettings.getDefaultTipPercentageIdx()
    
    billField.text = String(format: "%.2f", UserDefaultSettings.getBillAmount())
    self.calculateTip(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    billField.becomeFirstResponder()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }
  
  @IBAction func calculateTip(sender: AnyObject) {
    let tipPercentages = [0.18, 0.2, 0.25]
    
    let bill = Double(billField.text!) ?? 0
    let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
    let total = bill + tip
    
    tipLabel.text = formatCurrency(tip)
    totalLabel.text = formatCurrency(total)
    
    // Also remember the bill amount if user comes back to the app within 10 mins
    UserDefaultSettings.storeBillAmount(bill);
  }
  
  func formatCurrency(amount: Double) -> String {
    let formatter = NSNumberFormatter()
    formatter.numberStyle = .CurrencyStyle
    formatter.locale = NSLocale.currentLocale()
    return formatter.stringFromNumber(amount)!
  }
}


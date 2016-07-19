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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        defaultTipPercentage.selectedSegmentIndex = UserDefaultSettings.getDefaultTipPercentageIdx()
    }
    
    @IBAction func defaultPercentageChanged(sender: AnyObject) {
        UserDefaultSettings.storeDefaultTipPercentageIdx(defaultTipPercentage.selectedSegmentIndex)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

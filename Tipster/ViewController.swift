//
//  ViewController.swift
//  Tipster
//
//  Created by Aripirala, Sriram Santosh on 3/6/17.
//  Copyright © 2017 Aripirala, Sriram Santosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.25]
        
        let billValue = Double(billField.text!) ?? 0
        let defualtTip = billValue * tipPercentages[tipControl.selectedSegmentIndex]
        tipLabel.text = String(format: "$%.2f", defualtTip)
        totalLabel.text = String(format: "$%.2f", (defualtTip+billValue))
    }
    
    
}


//
//  ViewController.swift
//  Tipster
//
//  Created by Aripirala, Sriram Santosh on 3/6/17.
//  Copyright © 2017 Aripirala, Sriram Santosh. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.register(defaults: [String : Any]())

        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaultCurrency = NSLocale.current.currencySymbol!
        billField.placeholder = defaultCurrency
        tipLabel.text = "\(defaultCurrency) 0.00"
        totalLabel.text  = "\(defaultCurrency) 0.00"
        
        billField.keyboardType =  UIKeyboardType.decimalPad
    

        let userDefaults = UserDefaults.standard
        
        let defaultTipInString = userDefaults.string(forKey: "default_tip_percent")
        
        var defaultTipPercent = 0.15
        
        if defaultTipInString != nil{
            defaultTipPercent = Double(defaultTipInString!) ?? 0.15
        }
        
        if defaultTipPercent != 0.15 {
            defaultTipPercent = defaultTipPercent/100
        }
        
        let tipPercentages = [0.15 , 0.18, 0.20]
        
        var i = 0
        
        for percent in tipPercentages{
            
            if percent == defaultTipPercent{
                tipControl.selectedSegmentIndex = i
            }
            i += 1
        }
        
        print("Selected value: \(tipControl.selectedSegmentIndex)")

    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
    
        let currency  = NSLocale.current.currencySymbol!
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal

        let tipPercentages = [0.15, 0.18, 0.20]
        
        let billValue = Double(billField.text!) ?? 0
        let defualtTip = billValue * tipPercentages[tipControl.selectedSegmentIndex]
        
        let formattedString = formatter.string(for: defualtTip+billValue)
        let defaultTipFormattedString = formatter.string(for: defualtTip)
        
//        totalLabel.text = String(format: "\(currency)%.2f", Double(formattedString!) ?? (defualtTip+billValue) )
        
        //totalLabel.text = String(reflecting: formattedString)
        
        let finalTotalValue = formattedString!
        let finalDefaultTip = defaultTipFormattedString!
        tipLabel.text = "\(currency) \(finalDefaultTip)"
        totalLabel.text = "\(currency) \(finalTotalValue)"
    }
    
    
    
    
}


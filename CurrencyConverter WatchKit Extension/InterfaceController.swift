//
//  InterfaceController.swift
//  CurrencyConverter WatchKit Extension
//
//  Created by Deborah on 2/1/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation

var activeCurrency = 0
var currencies = ["GBP", "EUR", "JPY", "CAD"]
var currencyConversions = [0.7, 0.8, 0.9, 1.5]

class InterfaceController: WKInterfaceController {
    

    @IBOutlet var currencyLabel: WKInterfaceLabel!
    
    @IBAction func currencyChooser(_ value: Float) {
        
        activeCurrency = Int(value * 3)
        currencyLabel.setText(currencies[activeCurrency])
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

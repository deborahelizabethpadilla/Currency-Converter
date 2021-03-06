//
//  detailInterfaceController.swift
//  CurrencyConverter
//
//  Created by Deborah on 2/1/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation

class detailInterfaceController: WKInterfaceController {
    
    @IBOutlet var dollarsLabel: WKInterfaceLabel!
    
    @IBOutlet var conversionAmount: WKInterfaceLabel!
    
    @IBOutlet var currencyLabel: WKInterfaceLabel!
    
    @IBOutlet var amountSlider: WKInterfaceSlider!
    
    @IBAction func adjustAmount(_ value: Float) {
        
        var numberOfDollars = Int(value * 20)
        dollarsLabel.setText("\(numberOfDollars) USD equals...")
        
        conversionAmount.setText("\(Double(numberOfDollars) * currencyConversions[activeCurrency])")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        currencyLabel.setText(currencies[activeCurrency])
        
        dollarsLabel.setText("1 USD equals...")
        
        conversionAmount.setText("\(currencyConversions[activeCurrency])")
        
        amountSlider.setValue(0.5)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

}

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
    
    @IBAction func adjustAmount(_ value: Float) {
        
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

}

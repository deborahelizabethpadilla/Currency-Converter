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


class InterfaceController: WKInterfaceController, XMLParserDelegate {
    
    var element = ""
    var nameAttribute = ""
    var getCurrency = -1
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        element = elementName
        
        if attributeDict["name"] != nil {
            nameAttribute = attributeDict["name"]! as String
            
        } else {
            nameAttribute = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element == "field" && nameAttribute == "name" {
            
            for (index, currency) in currencies.enumerated() {
            
            if string == "USD/" + currency {
                
                getCurrency = index
                
            }
            }
        }
        
        if element == "field" && nameAttribute == "price" && getCurrency != -1 {
            print(string)
            
            currencyConversions[getCurrency] = (string as NSString).doubleValue
            
            getCurrency = -1
            
        }
    }
    

    @IBOutlet var currencyLabel: WKInterfaceLabel!
    
    @IBAction func currencyChooser(_ value: Float) {
        
        activeCurrency = Int(value * 3)
        currencyLabel.setText(currencies[activeCurrency])
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let url = NSURL(string: "http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote")
        
        let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: {
         (data, response, error) -> Void in
        
            if error == nil {
                
                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
                
                var xmlParser = XMLParser()
                xmlParser = XMLParser(data: data!)
                xmlParser.delegate = self
                xmlParser.parse()
                
                print(currencyConversions)
                
            } else {
                
                print(error!)
                
            }
        
    })
    
    task.resume()
}

}

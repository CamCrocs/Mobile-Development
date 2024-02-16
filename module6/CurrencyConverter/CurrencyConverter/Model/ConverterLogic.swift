//
//  ConverterLogic.swift
//  CurrencyConverter
//
//  Created by Cameron Crockett on 2/15/24.
//

import Foundation

struct ConverterLogic {
    
    var currencyOneSwitch = true
    var currencyTwoSwitch = true
    var currencyThreeSwitch = true
    var currencyFourSwitch = true
    
    mutating func setSwitch(_ switchValue: Bool, for currency: Int) {
        switch currency {
        case 1:
            currencyOneSwitch = switchValue
        case 2:
            currencyTwoSwitch = switchValue
        case 3:
            currencyThreeSwitch = switchValue
        case 4:
            currencyFourSwitch = switchValue
        default:
            break
        }
    }
    
    
    /*
     * The dollar amounts are converted the foreign currency value at the making of this program. Thus, the values are static at application creation. 
     */
    mutating func convertAmount(_ amount: Int) -> (chineseAmount: Int, indianAmount: Int, mexicanAmount: Int, russianAmount: Int) {
        var chineseAmount = 0
        var indianAmount = 0
        var mexicanAmount = 0
        var russianAmount = 0
        
        if currencyOneSwitch {
            chineseAmount = amount * 7
        }
        
        if currencyTwoSwitch {
            indianAmount = amount * 83
        }
        
        if currencyThreeSwitch {
            mexicanAmount = amount * 17
        }
        
        if currencyFourSwitch {
            russianAmount = amount * 92
        }
        return (chineseAmount, indianAmount, mexicanAmount, russianAmount)
    }
}

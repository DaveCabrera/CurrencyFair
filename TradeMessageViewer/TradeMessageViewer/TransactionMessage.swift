//
//  TransactionMessage.swift
//  TradeMessageViewer
//
//  Created by David Cabrera on 3/21/15.
//  Copyright (c) 2015 David Cabrera. All rights reserved.
//

import Foundation

class TransactionMessage: Printable {
    
    var userId: String
    var uniqueTransactionId: String
    var currencyFrom: String
    var currencyTo: String
    var amountSell: Double
    var amountBuy: Double
    var rate: Float64
    var timePlaced: String
    var originCountry: String
    
    init () {
        userId = ""
        currencyFrom = ""
        currencyTo = ""
        amountSell = 0.0
        amountBuy = 0.0
        rate = 0.00
        timePlaced = "0:00"
        originCountry = "FR"
        uniqueTransactionId = ""
    }
    
    var description: String {
        return "Unique Transaction Id: \(uniqueTransactionId), UserId: \(userId), currencyFrom: \(currencyFrom), currencyTo: \(currencyTo), amountToSell: \(amountSell), amountBuy: \(amountBuy), rate: \(rate), timePlaced: \(timePlaced), originCountry: \(originCountry)"
    }

}
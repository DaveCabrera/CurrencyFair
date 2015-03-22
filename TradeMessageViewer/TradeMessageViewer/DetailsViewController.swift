//
//  DetailsViewController.swift
//  TradeMessageViewer
//
//  Created by David Cabrera on 3/22/15.
//  Copyright (c) 2015 David Cabrera. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var txnID: UILabel!
    @IBOutlet var userID: UILabel!
    @IBOutlet var timePlaced: UILabel!
    @IBOutlet var currencyFrom: UILabel!
    @IBOutlet var currencyTo: UILabel!
    @IBOutlet var amountSold: UILabel!
    @IBOutlet var amountBought: UILabel!
    @IBOutlet var rate: UILabel!
    @IBOutlet var originCountry: UILabel!
    
    var transactionMessage: TransactionMessage = TransactionMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txnID.text = transactionMessage.uniqueTransactionId
        userID.text = transactionMessage.userId
        timePlaced.text = transactionMessage.timePlaced
        currencyTo.text = transactionMessage.currencyTo
        currencyFrom.text = transactionMessage.currencyFrom
        currencyTo.text = transactionMessage.currencyTo
        amountSold.text = "\(transactionMessage.amountSell)"
        amountBought.text = "\(transactionMessage.amountBuy)"
        rate.text = "\(transactionMessage.rate)"
        originCountry.text = transactionMessage.originCountry
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

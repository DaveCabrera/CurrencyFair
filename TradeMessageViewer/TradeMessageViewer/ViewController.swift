//
//  ViewController.swift
//  TradeMessageViewer
//
//  Created by David Cabrera on 3/21/15.
//  Copyright (c) 2015 David Cabrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var currentSelection: Int = 0
    var listOfTransactionMessages: [TransactionMessage] = [TransactionMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveTransactionMessagesFromServer()
        self.listOfTransactionMessages.reverse()
    }
    
    private func retrieveTransactionMessagesFromServer() {
        // Create your own manager instance that uses your custom configuration
        let credentials = NSURLCredential(user: "foo", password: "bar", persistence: .ForSession)
        Alamofire.request(.GET, URLString: "http://localhost:3000/list/")
            .authenticate(usingCredential: credentials)
            .responseJSON({(request, response, data, error) -> Void in
                var jsonArray = data as Array<AnyObject>
                for (var i = 0; i < jsonArray.count; i++) {
                    var object = JSON(jsonArray[i])
                    var transactionMessage: TransactionMessage = TransactionMessage()
                    transactionMessage.uniqueTransactionId = object["_id"].stringValue
                    transactionMessage.userId = object["userId"].stringValue
                    transactionMessage.amountBuy = object["amountBuy"].doubleValue
                    transactionMessage.amountSell = object["amountSell"].doubleValue
                    transactionMessage.currencyFrom = object["currencyFrom"].stringValue
                    transactionMessage.currencyTo = object["currencyTo"].stringValue
                    transactionMessage.originCountry = object["originatingCountry"].stringValue
                    transactionMessage.rate = object["rate"].doubleValue
                    transactionMessage.timePlaced = object["timePlaced"].stringValue
                    self.listOfTransactionMessages.append(transactionMessage)
                    self.tableView.reloadData()
                }
            })
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        if self.tableView.respondsToSelector(Selector("setSeperatorInset")) {
            self.tableView.separatorInset = UIEdgeInsetsZero;
        }
        if self.tableView.respondsToSelector(Selector("setLayoutMargins")) {
            self.tableView.layoutMargins = UIEdgeInsetsZero;
        }
    }
    
    @IBAction func refreshButtonTapped(sender: UIBarButtonItem) {
        self.listOfTransactionMessages = [TransactionMessage]()
        retrieveTransactionMessagesFromServer()
        //self.listOfTransactionMessages.reverse()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTransactionMessages.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("message", forIndexPath: indexPath) as MessageTableViewCell
        var transaction: TransactionMessage = listOfTransactionMessages[indexPath.row]
            cell.originCountry.image = UIImage(named: transaction.originCountry.lowercaseString)
        cell.transactionId.text = transaction.uniqueTransactionId
        cell.userId.text = transaction.userId
        cell.timePlaced.text = transaction.timePlaced
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false;
        return cell;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 84;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentSelection = indexPath.row
        self.performSegueWithIdentifier("detail", sender: self);
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detail" {
            let viewController: DetailsViewController = segue.destinationViewController as DetailsViewController;
            viewController.navigationItem.title = "Transaction Details"
            let message = self.listOfTransactionMessages[self.currentSelection]
            viewController.transactionMessage = message
        }
        
    }

}


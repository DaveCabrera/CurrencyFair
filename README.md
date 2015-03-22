# CurrencyFair
This is the application for the CurrencyFair test. The backend is written using ExpressJS with MongoDB for data storage. A very basic authentication scheme is setup with the user and password being "foo" and "bar" respectively. You can start the backend by going into the CurrencyFairExpressJS folder and executing the following commands:

To start the database.
```shell
mongod
```
In another terminal window, start the server.
```shell
node app.js
```

In another terminal window, I used to curl to send post requets.
```shell
curl -v -H "Content-type: application/json" -X POST -d '{"userId": "134256currencyFrom": "EUR", "currencyTo": "GBP", "amountSell": 1000, "amountBuy": 747.10, "rate": 0.7471, "timePlaced" : "24-JAN-15 10:27:44", "originatingCountry" : "CH"}'  http://localhost:3000/
```

For the front end, I wrote a basic iOS application written in Swift. The application uses Alamofire and SwiftyJSON to make GET requests to the server. It uses the username and password of "foo" "bar" to retrieve the messages. It then displays the messages to the user. From the main screen, you can see a list of transactions and some basic information. You are able to the see the originating country flag, the unique transactionID (given from the database), the userId, and the time it was created. You can click on the message to bring up a more detailed view. Back on the main screen, you can hit the refresh button to get the updated list of transactions.

![alt text](https://raw.githubusercontent.com/DaveCabrera/CurrencyFair/master/screen.png "Screen")

The iOS app has to be run in the simulator for it to work since I didn't have a server on the web to test on. Everything was done locally.
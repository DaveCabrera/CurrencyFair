var express = require('express')
var app = express()
var bodyParser = require('body-parser')
var mongoose = require('mongoose')

// Basic Authorization
var basicAuth = require('basic-auth');

var auth = function (req, res, next) {
  function unauthorized(res) {
    res.set('WWW-Authenticate', 'Basic realm=Authorization Required');
    return res.send(401);
  };

  var user = basicAuth(req);

  if (!user || !user.name || !user.pass) {
    return unauthorized(res);
  };

  if (user.name === 'foo' && user.pass === 'bar') {
    return next();
  } else {
    return unauthorized(res);
  };
};

// DB Connection
mongoose.connect('mongodb://localhost/tradeMessage', function(err) {
	if (err) {
		console.log('connection error', err)
	} else {
		console.log('connection successful')
	}
}) 

app.use(bodyParser.json())

// DB Schema
var TradeMessage = new mongoose.Schema({
  userId: String,
  currencyFrom: String,
  currencyTo: String,
  amountSell: Number,
  amountBuy: Number,
  rate: Number,
  timePlaced: String,
  originatingCountry: String,
  modified: { type: Date, default: Date.now }
});

var TradeModel = mongoose.model('TradeMessage', TradeMessage)

app.post('/', function(req, res) {
  console.log(req.body)
  console.log(req.body)
  console.log("Post: ")
  console.log(req.body)
  console.log("\n")

  var trade = new TradeModel({
     userId: req.body.userId,
     currencyFrom: req.body.currencyFrom,
     currencyTo: req.body.currencyTo,
     amountSell: req.body.amountSell,
     amountBuy: req.body.amountBuy,
     rate: req.body.rate,
     timePlaced: req.body.timePlaced,
     originatingCountry: req.body.originatingCountry,
  });

  trade.save(function(err) {
    if (!err) {
      console.log("yay")
      return console.log("Created and Posted Data")
    }
    else {
      console.log("nay")
      return console.log(err)
    }
  });
  return res.send("Post")
})

app.get('/', auth, function(req, res) {
 res.send(200, 'Hello World');
});

/* GET users listing. */
app.get('/list', auth, function(req, res) {
    return TradeModel.find(function (err, trades) {
    if (!err) {
      return res.json(trades);
    } else {
      return console.log(err);
    }
  });
});

// app.get('/', auth, function (req, res) {
//   res.send(200, 'Authenticated');
// };

var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)

})

module.exports = app
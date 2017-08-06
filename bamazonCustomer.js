var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,
	user: "root",
	password: "",
	database: "bamazon_db"
});

connection.connect(function(err) {
	if (err) throw err;
	console.log("connected as id " + connection.threadId);
	queryAllProducts();
	//start();
});

function queryAllProducts() {
  	connection.query("SELECT * FROM products", function(err, res) {
    for (var i = 0; i < res.length; i++) {
      console.log(res[i].item_id + " | " + res[i].product_name + " | " + res[i].price);
    }
    console.log("-----------------------------------");
  	});
  	start();
}

function start() {

 inquirer
    .prompt([
      {
        name: "id",
        type: "input",
        message: "What is the ID of the product you would like to buy?"
      },
      {
        name: "units", 
        type: "input",
        message: "How many units would you like to buy?",
        validate: function(value) {
          if (isNaN(value)) {
          	console.log("false")
            return false;
          }
          return true;
        }
      }
    ])
    .then(function(answer) {
      connection.query("SELECT PRICE, STOCK_QUANTITY FROM PRODUCTS WHERE ITEM_ID = ?", [answer.id], function(err, res) {
      	
      	console.log(res[0]);
      	var quantity = res[0].STOCK_QUANTITY;
      	var price = res[0].PRICE;

      	if(quantity >= parseInt(answer.units)){
      		var remaining = quantity - answer.units;
      		connection.query(
	            "UPDATE products SET stock_quantity = ? WHERE item_id = ?",
	            [
	              remaining, answer.id
	            ],
	            function(error) {
	              if (error){
	              	throw err;
	              } 

      			  console.log("Order placed. Total cost: " + price*answer.units)
	              start();
	            }
          	);
      	} else {
      		console.log("Order error. We only have " + quantity + " left.");
      		start();
      	}

	    });
  });
}
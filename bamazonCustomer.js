var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,

    // Your username
    user: "root",

    // Your password
    password: "mysql3",
    database: "bamazon_db"
});

connection.connect(function (err) {
    if (err) throw err;
    createTable();
});

var createTable = function() {
    connection.query("SELECT * FROM products", function (err, res) {
        if (err) throw err;
        console.log("----------------------------------------------------");
        for (var i = 0; i < res.length; i++) {
            console.log(res[i].item_id + " | " + res[i].product_name + " | " + res[i].price + " | " + res[i].stock_quantity);
        }
        console.log("----------------------------------------------------");
        chooseItem(res);
    });
};

var chooseItem = function(res) {

    inquirer.prompt([
        {
            name: "itemID",
            type: "input",
            message: "Please enter the name of the item you'd like to purchase.",
        }]).then(function(val) {
            var correct = false;
            for (var i = 0; i < res.length; i++) {
                if (res[i].product_name === val.itemID) {
                    correct = true;
                    var selected = val.itemID;
                    var id = i;

                    inquirer.prompt([
                        {
                            name: "quantity",
                            type: "input",
                            message: "How many units would you like to purchase?"
                        }]).then(function(val) {
                            if ((res[id].stock_quantity - val.quantity) > 0) {
                                connection.query(
                                    "UPDATE products SET stock_quantity='" + (res[id].stock_quantity - val.quantity) + "' WHERE product_name='" + selected + "'",
                                    function (err, res2) {
                                        if (err) {
                                            throw err;
                                        }
                                        console.log("PURCHASE COMPLETE!");
                                        createTable();
                                    });
                            }

                            else {
                                console.log("SELECTION INVALID");
                                chooseItem(res);
                            }
                        });
                }

            };
        });
};
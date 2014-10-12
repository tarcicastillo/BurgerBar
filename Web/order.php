<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="" name="description">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Order Dem Burgers Homie</title>

    <!-- JavaScript Files -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="js/order.js"></script>

    <!-- CSS Files -->
    <link href="css/navbar.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/order.css" rel="stylesheet" type="text/css">
</head>
    <body>
    <?php include "components/navbar.html" ?>

    <div id="burgerCreate" class="section">
        <form id="burgerForm">
            <section class="column">
                Quantity:<select name="Quantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                </select><br>
                <h2>Meat</h2>
                <div id="meatList" class="itemList">
                </div>
                <h2>Bun</h2>
                <div id="bunList" class="itemList">
                </div>
            </section>
            <section class="column">
                <h2>Cheese</h2>
                <div id="cheeseList" class="itemList">
                    <input id="NoCheese" type="radio" name="cheeses" value="No Cheese" checked data-price="0.00"><label for="NoCheese"> No Cheese</label><br>
                </div>
                <h2>Toppings</h2>
                <div id="toppingsList" class="itemList">
                    <input id="NoToppings" type="checkbox" name="toppings" value="No Toppings" checked data-price="0.00"><label for="NoToppings"> No Toppings</label><br>
                </div>
            </section>
            <section class="column">
                <h2>Sauces</h2>
                <div id="saucesList" class="itemList">
                    <input id="NoSauce" type="checkbox" name="sauces" value="No Sauce" checked data-price="0.00"><label for="NoSauce"> No Sauce</label><br>
                </div>
                <h2>Sides</h2>
                <div id="sidesList" class="itemList">
                    <input id="NoSide" type="radio" name="sides" value="No Sides" checked data-price="0.00"><label for="NoSides"> No Sides</label><br>
                <!-- </div><input type="button" id="Clear" value="Clear Vegetables"> -->
            </section>
        </form>
    </div>

    <div id="orderView" class="section"><h2>Order Details</h2>
        <section id="orderDetails"></section>
        <form id="orderForm">
            <div>Total: $<span id="totalSpan"></span></div>
            <input type="button" id="orderSubmit" class="pay" value="Checkout">
            <input type="button" id="lastOrder" value="Reorder Last Order">
        </form>
    </div>

    </body>
</html>
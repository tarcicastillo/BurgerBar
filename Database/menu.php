<?php

//-------------------- file reading & arrays --------------------
$temp = json_decode(file_get_contents("menu.json"), true);
$menu = populateMenu($temp);

function populateMenu($text) {
// copy menu items each into a separate corresponding array
    $fillMenu = $text['menu'];
    $meats = $fillMenu['meats'];
    $buns = $fillMenu['buns'];
    $cheeses = $fillMenu['cheeses'];
    $toppings = $fillMenu['toppings'];
    $sauces = $fillMenu['sauces'];
    $sides = $fillMenu['sides'];

// write overall menu with new arrays
    $sections = [$meats, $buns, $cheeses, $toppings, $sauces, $sides];
    $sectionNames = ['meats', 'buns', 'cheeses', 'toppings', 'sauces', 'sides'];
    $i = 0;
// pass each separate part of menu to populate arrays with info (name, price)
    foreach ($sections as $part) {
        $part = setSections($part, $sectionNames[$i]);
        $i++;
    }
    // return $sections;
}

// set name and price of each unique entry for all separate pieces
function setSections($array, $tableName) {
    foreach ($array as $map) {
        $name = $map['name'];
        $price = $map['price'];

        // call to insert into mySQL database
        insertSQL($tableName, $name, $price);
    }
    return $array;
}

//-------------------- inserting into SQL --------------------
// inserting into specific table with each piece associated with that array
function insertSQL($table, $name, $price) {
    $con = mysql_connect("localhost", "username", "password");
    mysql_select_db("BurgerBar", $con); // select db named "BurgerBar"

    if (!$con) { // return error if could not connect"
        die('Could not connect: ' . mysql_error());
    }

    // SQL query
    $query = "INSERT INTO $table" .
            "(name, price)" .
            "VALUES ('$name', '$price')";

    // insert into db, while storing a value
    $retval = mysql_query($query, $con);

    if (!$retval) { // if no value, then did not insert
        die('Could not enter data: ' . mysql_error());
    }
    // return successful
    echo "Entered data successfully\n";
    mysql_close($con); // close db connection
}

?>
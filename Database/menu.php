<?php

$jsonString = file_get_contents("menu.json");

$con = mysql_connect("localhost", "username", "password");
mysql_connect_db('databse name', $con);

$result = json_decode($jsonString);

//-------------------- file reading & arrays --------------------
$file = fopen("menu.json", "r");
$filetext = fread($file, filesize("menu.json"));
fclose($file);
$text = json_decode($filetext, true);

// copy menu items each into a separate corresponding array
$menu = $text['menu'];
$meats = $menu['meats'];
$buns = $menu['buns'];
$cheeses = $menu['cheeses'];
$toppings = $menu['toppings'];
$sauces = $menu['sauces'];
$sides = $menu['sides'];

// set name and price of each unique entry for all separate pieces
foreach ($meats as $meatmap) {
    $meatName = $meatmap['name'];
    $meatPrice = $meatmap['price'];
}

foreach ($buns as $bunmap) {
    $bunName = $bunmap['name'];
    $bunPrice = $bunmap['price'];
}

foreach ($cheeses as $cheesemap) {
    $cheeseName = $cheesemap['name'];
    $cheesePrice = $cheesemap['price'];
}

foreach ($toppings as $toppingmap) {
    $toppingName = $toppingmap['name'];
    $toppingPrice = $toppingmap['price'];
}

foreach ($sauces as $saucemap) {
    $sauceName = $saucemap['name'];
    $saucePrice = $saucemap['price'];
}

foreach ($sides as $sidemap) {
    $sideName = $sidemap['name'];
    $sidePrice = $sidemap['price'];
}
?>
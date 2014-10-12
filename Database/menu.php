<?php

	$jsonString = file_get_contents("menu.json");
	
	con = mysql_connect("localhost","username","password");
	mysql_connect_db('databse name', $con);
	
	$result = json_decode ($jsonString);
	
 ?>
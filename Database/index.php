<?php
	# Require for Slim
	require 'vendor/autoload.php';


	$app = new \Slim\Slim();	# This creates a new Slim Framework object


	# This section defines all of the possible requests that the web will use to get information from the database. 
	# the first argument is the URL you want the web devs to call to get this information, and the second argument
	# is your defined function in this PHP file. I'll put in a few as example

	$app->post('/login', 'login');	# Login function
	$app->post('/updatepassword', 'updatePassword');	# Updates password






	function login()
	{
		$app = \Slim\Slim::getInstance();
		$request = $app->request();
		$loginInfo = json_decode($request->getBody());
		$sql = "SELECT user_id, first_name, last_name, email, tokens, phone, is_custom, custom_image_path FROM USER WHERE email = :email AND password = :password";
		try 
		{
			if(isset($loginInfo))
			{
				$db = getConnection();
				$stmt = $db->prepare($sql);
				$stmt->bindParam("email", $loginInfo->email);
				$stmt->bindParam("password", md5($loginInfo->password));
				$stmt->execute();
				$userinfo = $stmt->fetch(PDO::FETCH_ASSOC);
				$db = null;
				$response = array('userID' => (int)$userinfo['user_id'], 'firstName' => $userinfo['first_name'], 'lastName' => $userinfo['last_name'], 'email' => $userinfo['email'], 'tokens' => (int)$userinfo['tokens'], 'phone' => $userinfo['phone'], 'is_custom' => (int)$userinfo['is_custom'], 'custom_image_path' => $userinfo['custom_image_path']);
				echo json_encode($response);
			}
			else
				echo '{"error":{"text": "Login Info was not set" }}'; 		
		} 
		catch(PDOException $e) 
		{
			echo '{"error":{"text":' . "\"" . $e->getMessage() . "\"" . '}}'; 
		}
	}




	function updatePassword()
	{
		$sql = "UPDATE USER SET password = :password WHERE user_id = :user_id AND password = :old_password";
		$request = \Slim\Slim::getInstance()->request();
		$userInfo = json_decode($request->getBody());

		try
		{
			$db = getConnection();
			$stmt = $db->prepare($sql);
			$stmt->bindParam("password", md5($userInfo->password));
			$stmt->bindParam("user_id", $userInfo->userID);
			$stmt->bindParam("old_password", md5($userInfo->old_password));
			$stmt->execute();
			$db = null;
			echo '{"success": true}';
		}
		catch(PDOException $e)
		{
			echo '{"error":{"text":' . "\"" . $e->getMessage() . "\"" . '}}';
		}
	}





	function getConnection() 
	{
		$dbhost="127.0.0.1";
		$dbuser="root";
		$dbpass="";
		$dbname="yourDBname";
		$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
		$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $dbh;
	}
mysql_close($con);
?>
<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$nameSur = $_GET['nameSur'];
		$phone = $_GET['phone'];
		$email = $_GET['email'];
		$brand = $_GET['brand'];
		$numberModel = $_GET['numberModel'];
		$model = $_GET['model'];
		$color = $_GET['color'];
		$nicName = $_GET['nicName'];
		$idQuestion = $_GET['idQuestion'];
		$answer = $_GET['answer'];
		$password = $_GET['password'];
		
		
							
		$sql = "INSERT INTO `userUngBattery`(`id`, `nameSur`, `phone`, `email`, `brand`, `numberModel`, `model`, `color`, `nicName`, `idQuestion`, `answer`, `password`) VALUES (Null,'$nameSur','$phone','$email','$brand','$numberModel','$model','$color','$nicName','$idQuestion','$answer','$password')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master UNG";
   
}
	mysqli_close($link);
?>
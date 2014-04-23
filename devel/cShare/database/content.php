<?php

	/*function publish($username,$title,$body,$links) {
		global $conn;
		$conn->beginTransaction();
		$stmt = $conn->prepare("INSERT INTO Noticia VALUES(DEFAULT,?,?,?,?)");
		$stmt->execute(array($body,$title,date('Y-m-d'),$username));

		foreach($links as $key->$link) {
			$stmt = $conn->prepare("INSERT INTO Link VALUES(?,?)");
			$stmt->execute(array());
		}

		$stmt = $conn->prepare("INSERT INTO Noticia VALUES(DEFAULT,?,?,?,?)");
		$stmt->execute(array($body,$title,date('Y-m-d'),$username));	
	}*/

?>
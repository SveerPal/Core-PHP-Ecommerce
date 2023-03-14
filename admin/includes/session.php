<?php
	include 'conn.php';
	session_start();

	if(!isset($_SESSION['admin']) || trim($_SESSION['admin']) == ''){
		header('location:../admin/login.php');
		exit();
	}

	$conn = $pdo->open();

	$stmt = $conn->prepare("SELECT * FROM admins WHERE id=:id");
	$stmt->execute(['id'=>$_SESSION['admin']]);
	$admin = $stmt->fetch();

	$pdo->close();

?>
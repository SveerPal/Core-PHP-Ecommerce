<?php 
	include '../session.php';

	if(isset($_POST['id']) && isset($_POST['attribute_value'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();
		$stmt = $conn->prepare("SELECT id,name FROM products_attributes_values WHERE products_attribute_id=:id");
		$stmt->execute(['id'=>$id]);
		$row = $stmt->fetchAll();	
		$pdo->close();
		echo json_encode($row);
	}
	if(isset($_POST['id']) && isset($_POST['products'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();
		$stmt = $conn->prepare("SELECT * FROM products WHERE id=:id");
		$stmt->execute(['id'=>$id]);
		$row = $stmt->fetch();	
		$pdo->close();
		echo json_encode($row);
	}
?>
<?php 
	include '../session.php';

	if(isset($_POST['id'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();
		$stmt = $conn->prepare("SELECT * FROM blogs_tags WHERE id=:id");
		$stmt->execute(['id'=>$id]);
		$row = $stmt->fetch();
		$pdo->close();
		echo json_encode($row);
	}
?>
<?php 
	include '../session.php';

	if(isset($_POST['id'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();
		$stmt = $conn->prepare("SELECT * FROM products_categories WHERE id=:id");
		$stmt->execute(['id'=>$id]);
		$row = $stmt->fetch();
		
		$stmtt = $conn->prepare("SELECT id,name FROM products_categories WHERE id!=:id");
		$stmtt->execute(['id'=>$id]);
		$option='<option value="0">Select Parent</option>';
		foreach($stmtt as $roww){
			$option .='<option value="'.$roww['id'].'">'.$roww['name'].'</option>';
		}	
		$row['parent_category_list']=$option;
		$pdo->close();
		echo json_encode($row);
	}
?>
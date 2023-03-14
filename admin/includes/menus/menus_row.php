<?php 
	include '../session.php';

	if(isset($_POST['id'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();
		$stmt = $conn->prepare("SELECT * FROM menus WHERE id=:id");
		$stmt->execute(['id'=>$id]);
		$row = $stmt->fetch();
		
		// $stmtt = $conn->prepare("SELECT * FROM menus WHERE id!=:id");
		// $stmtt->execute(['id'=>$id]);
		// $option='<option value="">Select Parent</option>';
		// foreach($stmtt as $roww){
		// 	$option .='<option value="'.$roww['id'].'">'.$roww['name'].'</option>';
		// }	
		// $row['parent_category_list']=$option;
		$pdo->close();
		echo json_encode($row);
	}
	if(isset($_POST['menu'])){
		$menu_name = $_POST['menu_name'];
		$stmtt = $conn->prepare("SELECT * FROM menus WHERE menu_name=:menu_name");
		$stmtt->execute(['menu_name'=>$menu_name]);
		$option='<option value="">Select Parent</option>';
		foreach($stmtt as $roww){
			$option .='<option value="'.$roww['id'].'">'.$roww['name'].'</option>';
		}	
		$row['parent_id']=$option;
		$pdo->close();
		echo json_encode($row);
	}
?>
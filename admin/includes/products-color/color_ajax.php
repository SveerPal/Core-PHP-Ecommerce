<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	
	if(isset($_POST['add'])){
		$name = $_POST['name'];		
		$createDate=date('Y-m-d h:i:s');
		
		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_color WHERE name=:name");
		$stmt->execute(['name'=>$name]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Color already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{		
			try{
				$stmt = $conn->prepare("INSERT INTO products_color (name,createDate) 
				VALUES (:name, :createDate)");
				$stmt->execute(['name'=>$name,'createDate'=>$createDate]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Color added successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));
			}
			catch(PDOException $e){
				$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));				
			}
		}
		$pdo->close();
	}elseif(isset($_POST['delete'])){
		$id = $_POST['id'];		
		$conn = $pdo->open();
		try{
			$stmt = $conn->prepare("DELETE FROM products_color WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Color deleted successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));
		}
		catch(PDOException $e){
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));	
		}
		$pdo->close();
	}
	elseif(isset($_POST['edit'])){
		$id = $_POST['id'];
		$name = $_POST['name'];				
		$status = $_POST['status'];					
		$conn = $pdo->open();
		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_color 
		WHERE id!=:id AND ( name=:name )");
		$stmt->execute(['id'=>$id,'name'=>$name]);
		$row = $stmt->fetch();
		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Fabric already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{			
			
			try{
				$stmt = $conn->prepare("UPDATE products_color SET name=:name,status=:status WHERE id=:id");
				$stmt->execute(['name'=>$name,'status'=>$status,'id'=>$id]);
				$msg="<div class='alert alert-success alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-check'></i> Success!</h4>Color updated successfully</div>";
					echo json_encode(array('sts'=>1,'msg'=>$msg));
			}
			catch(PDOException $e){
				$msg="<div class='alert alert-danger alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
					echo json_encode(array('sts'=>0,'msg'=>$msg));
			}
		}
		$pdo->close();
	}
	else{
		echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
			<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<h4><i class='icon fa fa-warning'></i> Error! </h4>Oops something went wrong. please try again.</div>"));
			die;
	}
	die;
	
?>
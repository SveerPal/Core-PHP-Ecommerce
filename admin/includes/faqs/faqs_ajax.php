<?php
	include '../../includes/session.php';
	
	if(isset($_POST['add'])){
		$title = $_POST['title'];
		$description = addslashes($_POST['description']);
		$conn = $pdo->open();	
		
			try{
				$stmt = $conn->prepare("INSERT INTO faqs (title, description) 
				VALUES (:title, :description)");
				$stmt->execute(['title'=>$title, 'description'=>$description]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Faq added successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));

			}
			catch(PDOException $e){
				$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));				
			}
		$pdo->close();
	}elseif(isset($_POST['delete'])){
		$id = $_POST['id'];		
		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("DELETE FROM faqs WHERE id=:id");
			$stmt->execute(['id'=>$id]);

			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Faq deleted successfully</div>";
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
		$title = $_POST['title'];
		 $description = addslashes($_POST['description']);
		//die('xxxx');
		$status = $_POST['status'];

		$conn = $pdo->open();
		
		try{
			$stmt = $conn->prepare("UPDATE faqs SET title=:title,status=:status, description=:description WHERE id=:id");
			$stmt->execute(['title'=>$title,'status'=>$status, 'description'=>$description,'id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Faq updated successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));

		}
		catch(PDOException $e){
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}
		$pdo->close();
	}else{
		$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Oops something went wrong.</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
	}
	die;
	
?>
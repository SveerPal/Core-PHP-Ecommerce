<?php
	include '../../includes/session.php';
	
	if(isset($_POST['add'])){
		$name = $_POST['name'];
		$designation = $_POST['designation'];
		$company = $_POST['company'];
		$message = $_POST['message'];
		
		$conn = $pdo->open();	
		
		    $newFileName="";
			if (isset($_FILES['photo']) && !empty($_FILES['photo']['name']))
			{
				
				// get details of the uploaded file
				$fileTmpPath = $_FILES['photo']['tmp_name'];
				$fileName = $_FILES['photo']['name'];
				$fileSize = $_FILES['photo']['size'];
				$fileType = $_FILES['photo']['type'];
				$fileNameCmps = explode(".", $fileName);
				$fileExtension = strtolower(end($fileNameCmps));
			
				// sanitize file-name
				$newFileName = md5(time() . $fileName) . '.' . $fileExtension;
			
				// check if file has one of the following extensions
				$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
			
				if (in_array($fileExtension, $allowedfileExtensions)){
					$uploadFileDir = '../../uploaded_files/testimonials/';
					$dest_path = $uploadFileDir . $newFileName;
				
					if(move_uploaded_file($fileTmpPath, $dest_path)) {
						
					}else{
						$message = 'There was some error moving the file to upload directory. Please make sure the upload directory is writable by web server.';
						echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
						<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
						<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
					}
				}else{
					$message = 'Upload failed. Allowed file types: ' . implode(',', $allowedfileExtensions);
					echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
				die;
				}
			}
			try{
				$stmt = $conn->prepare("INSERT INTO testimonials (name, designation, company, message, photo) 
				VALUES (:name, :designation, :company, :message, :photo)");
				$stmt->execute(['name'=>$name, 'designation'=>$designation, 'company'=>$company, 
				'message'=>$message,'photo'=>$newFileName]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Testimonials added successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));

			}
			catch(PDOException $e){
				$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Success!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));				
			}
		$pdo->close();
	}elseif(isset($_POST['delete'])){
		$id = $_POST['id'];
		
		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("DELETE FROM testimonials WHERE id=:id");
			$stmt->execute(['id'=>$id]);

			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Testimonials deleted successfully</div>";
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
		$designation = $_POST['designation'];
		$company = $_POST['company'];
		$message = $_POST['message'];
		$status = $_POST['status'];

		$conn = $pdo->open();
		
		$filename="";
		if (isset($_FILES['photo']) && !empty($_FILES['photo']['name']))
		{
			// get details of the uploaded file
			$fileTmpPath = $_FILES['photo']['tmp_name'];
			$fileName = $_FILES['photo']['name'];
			$fileSize = $_FILES['photo']['size'];
			$fileType = $_FILES['photo']['type'];
			$fileNameCmps = explode(".", $fileName);
			$fileExtension = strtolower(end($fileNameCmps));
		
			// sanitize file-name
			$newFileName = md5(time() . $fileName) . '.' . $fileExtension;
		
			// check if file has one of the following extensions
			$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
		
			if (in_array($fileExtension, $allowedfileExtensions)){
				$uploadFileDir = '../../uploaded_files/testimonials/';
				$dest_path = $uploadFileDir . $newFileName;
			
				if(move_uploaded_file($fileTmpPath, $dest_path)) {
					
				}else{
					$message = 'There was some error moving the file to upload directory. Please make sure the upload directory is writable by web server.';
					echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
				}
			}else{
				$message = 'Upload failed. Allowed file types: ' . implode(',', $allowedfileExtensions);
				echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
			<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
			die;
			}
		}else{
			$newFileName=$_POST['photo_old'];
		}

		try{
			$stmt = $conn->prepare("UPDATE testimonials SET name=:name,status=:status,photo=:photo, designation=:designation, company=:company, message=:message WHERE id=:id");
			$stmt->execute(['name'=>$name,'status'=>$status, 'photo'=>$newFileName,'designation'=>$designation, 'company'=>$company, 'message'=>$message,'id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>User updated successfully</div>";
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
	elseif(isset($_POST['upload'])){
		$id = $_POST['id'];
		$filename = $_FILES['photo']['name'];
		if(!empty($filename)){
			move_uploaded_file($_FILES['photo']['tmp_name'], '../images/'.$filename);	
		}
		
		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("UPDATE testimonials SET photo=:photo WHERE id=:id");
			$stmt->execute(['photo'=>$filename, 'id'=>$id]);
			$_SESSION['success'] = 'Testimonials photo updated successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();
		}

		$pdo->close();

	}else{

	}
	die;
	
?>
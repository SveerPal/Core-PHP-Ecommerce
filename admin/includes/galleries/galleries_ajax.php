<?php
	include '../../includes/session.php';
	
	if(isset($_POST['add'])){
		$title = $_POST['title'];
		$description = $_POST['description'];
		$alt = $_POST['alt'];
		
		$conn = $pdo->open();	
		
		    $newFileName="";
			if (isset($_FILES['photo']) && !empty($_FILES['photo']))
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
					$uploadFileDir = '../../uploaded_files/galleries/';
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
				$stmt = $conn->prepare("INSERT INTO galleries (title, description, alt,photo) 
				VALUES (:title, :description,:alt, :photo)");
				$stmt->execute(['title'=>$title, 'description'=>$description,'alt'=>$alt,'photo'=>$newFileName]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Gallery added successfully</div>";
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
			$stmt = $conn->prepare("DELETE FROM galleries WHERE id=:id");
			$stmt->execute(['id'=>$id]);

			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Gallery deleted successfully</div>";
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
		$description = $_POST['description'];
		$status = $_POST['status'];
		$alt = $_POST['alt'];

		
		$conn = $pdo->open();
		
		$newFileName="";
		if (isset($_FILES['photo']) && !empty($_FILES['photo'])  && $_FILES['photo']['name']!="")
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
				$uploadFileDir = '../../uploaded_files/galleries/';
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
			$stmt = $conn->prepare("UPDATE galleries SET title=:title,status=:status,alt=:alt,description=:description,photo=:photo WHERE id=:id");
			$stmt->execute(['title'=>$title,'status'=>$status,'alt'=>$alt,'description'=>$description,'photo'=>$newFileName,'id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Gallery updated successfully</div>";
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
	else{
		echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
			<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<h4><i class='icon fa fa-warning'></i> Error! </h4>Oops something went wrong. please try again.</div>"));
			die;
	}
	die;
	
?>
<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	
	if(isset($_POST['add'])){
		$name = $_POST['name'];	
		$products_attribute_id = $_POST['products_attribute_id'];	
		$code = strtolower(preg_replace('/[^a-zA-Z0-9_-]/s',' ',$_POST['name']));
		
		$createDate=date('Y-m-d h:i:s');
		
		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_attributes_values WHERE name=:name or code=:code");
		$stmt->execute(['name'=>$name,'code'=>$code]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Attribute Value Name already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{	
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
					$uploadFileDir = '../../uploaded_files/products_attributes/';
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
				$stmt = $conn->prepare("INSERT INTO products_attributes_values (name,code,products_attribute_id,photo,createDate) 
				VALUES (:name,:code,:products_attribute_id,:photo, :createDate)");
				$stmt->execute(['name'=>$name,'code'=>$code,'products_attribute_id'=>$products_attribute_id,'photo'=>$newFileName,'createDate'=>$createDate]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Attribute Value added successfully</div>";
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
			$stmt = $conn->prepare("DELETE FROM products_attributes_values WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Attribute Value deleted successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));
		}
		catch(PDOException $e){
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));	
		}
		$pdo->close();
	}elseif(isset($_POST['edit'])){
		$id = $_POST['id'];
		$name = $_POST['name'];		
		$products_attribute_id = $_POST['products_attribute_id'];
		$code = strtolower(preg_replace('/[^a-zA-Z0-9_-]/s',' ',$_POST['code']));	
		$status = $_POST['status'];					
		$conn = $pdo->open();
		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_attributes_values 
		WHERE id!=:id AND ( name=:name or code=:code)");
		$stmt->execute(['id'=>$id,'name'=>$name,'code'=>$code]);
		$row = $stmt->fetch();
		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Attribute Value Name or Code already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{			
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
					$uploadFileDir = '../../uploaded_files/products_attributes/';
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
				$stmt = $conn->prepare("UPDATE products_attributes_values SET code=:code,name=:name,status=:status,products_attribute_id=:products_attribute_id,photo=:photo WHERE id=:id");
				$stmt->execute(['code'=>$code,'name'=>$name,'status'=>$status,'products_attribute_id'=>$products_attribute_id,'photo'=>$newFileName,'id'=>$id]);
				$msg="<div class='alert alert-success alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-check'></i> Success!</h4>Attribute Value updated successfully</div>";
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
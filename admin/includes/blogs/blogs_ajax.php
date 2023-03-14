<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	

	if(isset($_POST['add'])){
		$tag_id=$category_id="";
		$name = $_POST['name'];
		if(isset($_POST['slug']) && $_POST['slug'] !=""){
			$slug = $SettingsData->makeSlug($_POST['slug']);			
		}else{
			$slug = $SettingsData->makeSlug($name);
		}

		
		if(isset($_POST['category_id']) && $_POST['category_id'] !=""){
			$category_id = implode(',',$_POST['category_id']);			
		}
		if(isset($_POST['tag_id']) && $_POST['tag_id'] !=""){
			$tag_id = implode(',',$_POST['tag_id']);			
		}
		$breadcrumb = $_POST['breadcrumb'];
		$description = addslashes($_POST['description']);
		$additional_description = addslashes($_POST['additional_description']);
		$alt = $_POST['alt'];
		
		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];
		$createDate=date('Y-m-d h:i:s');	
		
		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM blogs WHERE slug=:slug");
		$stmt->execute(['slug'=>$slug]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Blog already exist</div>";
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
					$uploadFileDir = '../../uploaded_files/blogs/';
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
				$stmt = $conn->prepare("INSERT INTO blogs 
				(category_id,tag_id,name,slug,breadcrumb,description,additional_description,alt,
				meta_title,meta_description, meta_keyword,photo,createDate) 
				VALUES (:category_id,:tag_id,:name,:slug,:breadcrumb,:description,:additional_description,:alt,:meta_title,
				:meta_description,:meta_keyword, :photo,:createDate)");
				$stmt->execute(['category_id'=>$category_id,'tag_id'=>$tag_id,'name'=>$name,'slug'=>$slug,
				'breadcrumb'=>$breadcrumb,'description'=>$description,
				'additional_description'=>$additional_description,'alt'=>$alt,
				'meta_title'=>$meta_title,'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword,
				'photo'=>$newFileName,'createDate'=>$createDate]);
				//$product_id = $conn->lastInsertId();				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Blog added successfully</div>";
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
	}elseif(isset($_POST['edit'])){
		$id = $_POST['blog_id'];
		$tag_id=$category_id="";
		$name = $_POST['name'];
		if(isset($_POST['slug']) && $_POST['slug'] !=""){
			$slug = $SettingsData->makeSlug($_POST['slug']);			
		}else{
			$slug = $SettingsData->makeSlug($name);
		}

		
		if(isset($_POST['category_id']) && $_POST['category_id'] !=""){
			$category_id = implode(',',$_POST['category_id']);			
		}
		if(isset($_POST['tag_id']) && $_POST['tag_id'] !=""){
			$tag_id = implode(',',$_POST['tag_id']);			
		}
		$breadcrumb = $_POST['breadcrumb'];
		$description = addslashes($_POST['description']);
		$additional_description = addslashes($_POST['additional_description']);
		$alt = $_POST['alt'];
		
		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];
		$status = $_POST['status'];	
		$conn = $pdo->open();	

		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM blogs 
		WHERE id!=:id AND (slug=:slug )");
		$stmt->execute(['id'=>$id,'slug'=>$slug]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Blog already exist</div>";
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
					$uploadFileDir = '../../uploaded_files/blogs/';
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
				$stmt = $conn->prepare("UPDATE blogs SET category_id=:category_id,tag_id=:tag_id,
				name=:name,slug=:slug,breadcrumb=:breadcrumb,description=:description,
				additional_description=:additional_description,alt=:alt,meta_title=:meta_title,
				meta_description=:meta_description,meta_keyword=:meta_keyword,
				photo=:photo,status=:status WHERE id=:id");
				$stmt->execute(['category_id'=>$category_id,'tag_id'=>$tag_id,'name'=>$name,'slug'=>$slug,
				'breadcrumb'=>$breadcrumb,'description'=>$description,
				'additional_description'=>$additional_description,'alt'=>$alt,'meta_title'=>$meta_title,
				'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword,'photo'=>$newFileName,
				'status'=>$status,'id'=>$id]);
								
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Blog updated successfully</div>";
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
		die;
	}elseif(isset($_POST['delete'])){
		$id = $_POST['id'];		
		$conn = $pdo->open();
		try{
			$stmt = $conn->prepare("DELETE FROM blogs WHERE id=:id");
			$stmt->execute(['id'=>$id]);			
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Blog deleted successfully</div>";
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
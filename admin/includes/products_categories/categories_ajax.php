<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	
	if(isset($_POST['add'])){
		$parent_category = $_POST['parent_category'];
		$name = $_POST['name'];
		$description = addslashes($_POST['description']);
		if(isset($_POST['cat_slug']) && $_POST['cat_slug'] !=""){
			$cat_slug = $SettingsData->makeSlug($_POST['cat_slug']);
		}else{
			$cat_slug = $SettingsData->makeSlug($name);
		}
		
		$alt = $_POST['alt'];

		$banner_heading = $_POST['banner_heading'];
		$banner_description = $_POST['banner_description'];
		$banner_label = $_POST['banner_label'];	
		$banner_url = $_POST['banner_url'];

		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];	

		
		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_categories WHERE name=:name or cat_slug=:cat_slug");
		$stmt->execute(['name'=>$name,'cat_slug'=>$cat_slug]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Category Name or Slug already exist</div>";
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
					$uploadFileDir = '../../uploaded_files/products_categories/';
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
				$stmt = $conn->prepare("INSERT INTO products_categories (name,description,cat_slug,alt,meta_title,meta_description, meta_keyword,photo,banner_heading,banner_description,banner_label,banner_url) 
				VALUES (:name,:description,:cat_slug,:alt,:meta_title,:meta_description,:meta_keyword, :photo,:banner_heading,:banner_description,:banner_label,:banner_url)");
				$stmt->execute(['name'=>$name,'description'=>$description,'cat_slug'=>$cat_slug,'alt'=>$alt,'meta_title'=>$meta_title,'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword,'photo'=>$newFileName,'banner_heading'=>$banner_heading,'banner_description'=>$banner_description,'banner_label'=>$banner_label,'banner_url'=>$banner_url]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Category added successfully</div>";
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
			$stmt = $conn->prepare("DELETE FROM products_categories WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Category deleted successfully</div>";
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
		$parent_category = $_POST['parent_category'];
		$name = $_POST['name'];
		$description = addslashes($_POST['description']);
		
		//print_r($_POST);
		//die('kkk');
		if(isset($_POST['cat_slug']) && $_POST['cat_slug'] !=""){
			$cat_slug = $SettingsData->makeSlug($_POST['cat_slug']);
		}else{
			$cat_slug = $SettingsData->makeSlug($name);
		}
		
		$alt = $_POST['alt'];
		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];	
		$status = $_POST['status'];

		$banner_heading = $_POST['banner_heading'];
		$banner_description = $_POST['banner_description'];
		$banner_label = $_POST['banner_label'];	
		$banner_url = $_POST['banner_url'];					
		$conn = $pdo->open();
		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_categories 
		WHERE id!=:id AND ( name=:name or cat_slug=:cat_slug )");
		$stmt->execute(['id'=>$id,'name'=>$name,'cat_slug'=>$cat_slug]);
		$row = $stmt->fetch();
		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Category Name or Slug already exist</div>";
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
					$uploadFileDir = '../../uploaded_files/products_categories/';
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
				$stmt = $conn->prepare("UPDATE products_categories SET parent_category=:parent_category,
				name=:name,description=:description,cat_slug=:cat_slug,alt=:alt,status=:status,meta_title=:meta_title,
				meta_description=:meta_description,meta_keyword=:meta_keyword,photo=:photo,banner_heading=:banner_heading,banner_description=:banner_description,banner_label=:banner_label,banner_url=:banner_url WHERE id=:id");
				$stmt->execute(['parent_category'=>$parent_category,'name'=>$name,'description'=>$description,
				'cat_slug'=>$cat_slug,'alt'=>$alt,'status'=>$status,'meta_title'=>$meta_title,
				'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword,'photo'=>$newFileName,'banner_heading'=>$banner_heading,'banner_description'=>$banner_description,'banner_label'=>$banner_label,'banner_url'=>$banner_url,'id'=>$id]);
				$msg="<div class='alert alert-success alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-check'></i> Success!</h4>Category updated successfully</div>";
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
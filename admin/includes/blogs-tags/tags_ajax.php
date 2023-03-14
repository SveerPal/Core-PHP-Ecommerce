<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	
	if(isset($_POST['add'])){
		
		$name = $_POST['name'];
		$description = $_POST['description'];
		if(isset($_POST['slug']) && $_POST['slug'] !=""){
			$slug = $SettingsData->makeSlug($_POST['slug']);
		}else{
			$slug = $SettingsData->makeSlug($name);
		}
		
		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];	
		
		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM blogs_tags WHERE name=:name or slug=:slug");
		$stmt->execute(['name'=>$name,'slug'=>$slug]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Tag Name or Slug already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{	
			try{
				$stmt = $conn->prepare("INSERT INTO blogs_tags (name,description,slug,meta_title,meta_description, meta_keyword) 
				VALUES (:name,:description,:slug,:meta_title,:meta_description,:meta_keyword)");
				$stmt->execute(['name'=>$name,'description'=>$description,'slug'=>$slug,'meta_title'=>$meta_title,
				'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword]);
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Tag added successfully</div>";
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
			$stmt = $conn->prepare("DELETE FROM blogs_tags WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Tag deleted successfully</div>";
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
		$description = $_POST['description'];
		if(isset($_POST['slug']) && $_POST['slug'] !=""){
			$slug = $SettingsData->makeSlug($_POST['slug']);
		}else{
			$slug = $SettingsData->makeSlug($name);
		}
		
		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];	
		$status = $_POST['status'];					
		$conn = $pdo->open();
		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM blogs_tags 
		WHERE id!=:id AND ( name=:name or slug=:slug )");
		$stmt->execute(['id'=>$id,'name'=>$name,'slug'=>$slug]);
		$row = $stmt->fetch();
		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Tag Name or Slug already exist</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));
		}else{			
			
			try{
				$stmt = $conn->prepare("UPDATE blogs_tags SET 
				name=:name,description=:description,slug=:slug,status=:status,meta_title=:meta_title,
				meta_description=:meta_description,meta_keyword=:meta_keyword WHERE id=:id");
				$stmt->execute(['name'=>$name,'description'=>$description,
				'slug'=>$slug,'status'=>$status,'meta_title'=>$meta_title,
				'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword,'id'=>$id]);
				$msg="<div class='alert alert-success alert-dismissible'>
					<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
					<h4><i class='icon fa fa-check'></i> Success!</h4>Tag updated successfully</div>";
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
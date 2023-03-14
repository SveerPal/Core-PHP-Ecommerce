<?php
	include '../includes/function.php';
	$data=Array();
	if (isset($_POST)) {
		$data=$_POST;
		
		if(!empty( $_FILES["logo"]["name"] )){
			
			$message = ''; 			
			if (isset($_FILES['logo']) && $_FILES['logo']['error'] === UPLOAD_ERR_OK)
			{
				
				// get details of the uploaded file
				$fileTmpPath = $_FILES['logo']['tmp_name'];
				$fileName = $_FILES['logo']['name'];
				$fileSize = $_FILES['logo']['size'];
				$fileType = $_FILES['logo']['type'];
				$fileNameCmps = explode(".", $fileName);
				$fileExtension = strtolower(end($fileNameCmps));
			
				// sanitize file-name
				$newFileName = md5(time() . $fileName) . '.' . $fileExtension;
			
				// check if file has one of the following extensions
				$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
			
				if (in_array($fileExtension, $allowedfileExtensions))
				{
					// directory in which the uploaded file will be moved
					$uploadFileDir = '../uploaded_files/';
					$dest_path = $uploadFileDir . $newFileName;
				
					if(move_uploaded_file($fileTmpPath, $dest_path)) 
					{
						$data['logo']=$newFileName;
					}
					else
					{
						$message = 'There was some error moving the file to upload directory. Please make sure the upload directory is writable by web server.';
						echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
				die;
					}
				}else{
					$message = 'Upload failed. Allowed file types: ' . implode(',', $allowedfileExtensions);
					echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
				die;
				}
			}else{
				$message = 'There is some error in the file upload. Please check the following error.<br>';
				$message .= 'Error:' . $_FILES['logo']['error'];
				echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error! </h4>".$message."</div>"));
				die;
			}
			
		}else{
			$data['logo']=$_POST['logo_old'];
		}
		
		try{
			$getSettingsData=$SettingsData->updateSettingsData($data);	
			echo json_encode(array('status'=>1,'msg'=>"<div class='alert alert-success alert-dismissible'>
			<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
			<h4><i class='icon fa fa-check'></i> Success! </h4>Settings updated successfully</div>"));			
		}
		catch(PDOException $e){
			echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>"));
		}		
	}else{
		echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error! </h4>Oops! Somthing Went Wrong Please Try Again</div>"));
	}
die;
	
		
?>
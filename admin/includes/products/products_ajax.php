<?php
	include '../../includes/session.php';
	include '../../includes/function.php';
	

	if(isset($_POST['add'])){
		$brand_id=$category_id=$fabric_id= $style_id=$products_attributes_id=$color_id=$custom_size=NULL;
		
		if(isset($_POST['category_id']) && $_POST['category_id'] !=""){
			$category_id = implode(',',$_POST['category_id']);
		}
		if(isset($_POST['brand_id']) && $_POST['brand_id'] !=""){
			$brand_id = implode(',',$_POST['brand_id']);
		}
		$name = $_POST['name'];
		if(isset($_POST['slug']) && $_POST['slug'] !=""){
			$slug = $SettingsData->makeSlug($_POST['slug']);			
		}else{
			$slug = $SettingsData->makeSlug($name);
		}
		$regular_price = $_POST['regular_price'];
		$sale_price = $_POST['sale_price'];
		$sku = $_POST['sku'];
		$product_code = $_POST['product_code'];
		if(isset($_POST['style_id']) && $_POST['style_id'] !=""){
			$style_id = implode(',',$_POST['style_id']);
		}

		if(isset($_POST['color_id']) && $_POST['color_id'] !=""){
			$color_id = implode(',',$_POST['color_id']);
		}

		$stock = $_POST['stock'];
		$custom_size = $_POST['custom_size'];
		$short_description = addslashes($_POST['short_description']);
		$additional_info = addslashes($_POST['additional_info']);
		$description = addslashes($_POST['description']);
		$alt = $_POST['alt'];
        $hsn_code = trim($_POST['hsn_code']);
		$banner_heading = $_POST['banner_heading'];
		$banner_description = $_POST['banner_description'];
		$banner_label 	= $_POST['banner_label'];
		$banner_url 	= $_POST['banner_url'];	

		if(isset($_POST['fabric_id']) && $_POST['fabric_id'] !=""){
			$fabric_id = implode(',',$_POST['fabric_id']);
		}

		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];	
		$product_type = $_POST['product_type'];
		if(isset($_POST['variation_type']) && $_POST['variation_type'] !=""){
			$products_attributes_id = implode(',',$_POST['variation_type']);
		}
		$createDate=date('Y-m-d h:i:s');	
		
		$conn = $pdo->open();	
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products WHERE slug=:slug");
		$stmt->execute(['slug'=>$slug]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Product already exist</div>";
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
					$uploadFileDir = '../../uploaded_files/products/';
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
				$stmt = $conn->prepare("INSERT INTO products 
				(category_id,brand_id,name,slug,regular_price,sale_price,sku,product_code,style_id,stock,hsn_code,
				short_description,additional_info,description,alt,fabric_id,product_type,products_attributes_id,
				meta_title,meta_description, meta_keyword,photo,createDate,banner_heading,banner_description,banner_label,banner_url,color,custom_size) 
				VALUES (:category_id,:brand_id,:name,:slug,:regular_price,:sale_price,:sku,:product_code,:style_id,
				:stock,:hsn_code,:short_description,:additional_info,:description,:alt,:fabric_id,:product_type,
				:products_attributes_id,:meta_title,:meta_description,:meta_keyword, :photo,:createDate,:banner_heading,:banner_description,:banner_label,:banner_url,:color,:custom_size)");
				$stmt->execute(['category_id'=>$category_id,'brand_id'=>$brand_id,'name'=>$name,'slug'=>$slug,
				'regular_price'=>$regular_price,'sale_price'=>$sale_price,'sku'=>$sku,'product_code'=>$product_code,
				'style_id'=>$style_id,'stock'=>$stock,'hsn_code'=>$hsn_code,'short_description'=>$short_description,
				'additional_info'=>$additional_info,'description'=>$description,'alt'=>$alt,'fabric_id'=>$fabric_id,
				'product_type'=>$product_type,'products_attributes_id'=>$products_attributes_id,'meta_title'=>$meta_title,'meta_description'=>$meta_description,
				'meta_keyword'=>$meta_keyword,'photo'=>$newFileName,'createDate'=>$createDate,'banner_heading'=>$banner_heading,'banner_description'=>$banner_description,'banner_label'=>$banner_label,'banner_url'=>$banner_url,'color'=>$color_id,'custom_size'=>$custom_size]);
				$product_id = $conn->lastInsertId();

				//Gallery
					
				if (isset($_FILES['gallery']) && !empty($_FILES['gallery']['name']))
				{
					$gal_photo="";
					
					for($g=0;$g<count($_FILES['gallery']['name']);$g++){
						
						// get details of the uploaded file
						$fileTmpPath = $_FILES['gallery']['tmp_name'][$g];
					  	$fileName = $_FILES['gallery']['name'][$g];
						$fileSize = $_FILES['gallery']['size'][$g];
						$fileType = $_FILES['gallery']['type'][$g];
						$fileNameCmps = explode(".", $fileName);
						$fileExtension = strtolower(end($fileNameCmps));
						// sanitize file-name
						$gal_photo = md5(time() . $fileName) . '.' . $fileExtension;
						// check if file has one of the following extensions
						$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
						if (in_array($fileExtension, $allowedfileExtensions)){
							$uploadFileDir = '../../uploaded_files/products/';
							$dest_path = $uploadFileDir . $gal_photo;				
							if(move_uploaded_file($fileTmpPath, $dest_path)){
								$stmt = $conn->prepare("INSERT INTO products_gallery 
									(product_id,gal_photo,createDate) 
									VALUES (:product_id,:gal_photo,:createDate)");
								$stmt->execute(['product_id'=>$product_id,
									'gal_photo'=>$gal_photo,
									'createDate'=>$createDate]);
							}

						}
					}
				}
				
				//$variation_type
				if($product_type=='Variation' && $product_id!=""){
					for($v=0;$v<count($_POST['variation_regular_price']);$v++){
						$attrr=$attribute_value_id=$variation_regular_price=
						$variation_sale_price=$variation_stock=$variation_photo=$variation_fabric=
						$products_attributes_values="";
						$attr_attrvalue=[];

						$variation_regular_price = $_POST['variation_regular_price'][$v];
						$variation_sale_price = $_POST['variation_sale_price'][$v];
						$variation_stock = $_POST['variation_stock'][$v];
						$variation_sku = $_POST['variation_sku'][$v];
						$variation_product_code = $_POST['variation_product_code'][$v];

						$variation_custom_size = $_POST['variation_custom_size'][$v];

						$variation_description = $_POST['variation_description'][$v];
						$variation_fabric = $_POST['variation_fabric_value'][$v];
						for($vat=0;$vat<count($_POST['variation_type']);$vat++){
							$attrr=$_POST['variation_type'][$vat];
							//$products_attributes_values[] = $_POST['attribute_'.$attrr][$v];
							$products_attributes_values .= $_POST['attribute_'.$attrr][$v].',';
							$attribute_value_id = $_POST['attribute_'.$attrr][$v];
							$attr_attrvalue[]=array('AttributeId'=>$attrr,'AttributeValId'=>$attribute_value_id);
						}
						//$products_attributes_values=impload(',',$products_attributes_values);
						$products_attributes_values=rtrim($products_attributes_values,',');
						$attr_attrvalue= json_encode($attr_attrvalue);
						$newVarimg="";
						if (isset($_FILES['variation_photo']) && !empty($_FILES['variation_photo']['name'][$v]))
						{
							$fileTmpPath = $_FILES['variation_photo']['tmp_name'][$v];
							$fileName = $_FILES['variation_photo']['name'][$v];
							$fileSize = $_FILES['variation_photo']['size'][$v];
							$fileType = $_FILES['variation_photo']['type'][$v];
							$fileNameCmps = explode(".", $fileName);
							$fileExtension = strtolower(end($fileNameCmps));
							// sanitize file-name
							$newVarimg = md5(time() . $fileName) . '.' . $fileExtension;
							// check if file has one of the following extensions
							$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
							if (in_array($fileExtension, $allowedfileExtensions)){
								$uploadFileDir = '../../uploaded_files/products/';
								$dest_path = $uploadFileDir . $newVarimg;				
								move_uploaded_file($fileTmpPath, $dest_path);									
							}
						}
						//$variation_photo = $_POST['variation_photo'][$v];$product_id
						$stmt = $conn->prepare("INSERT INTO products_variations 
									(product_id,variation_type,variation_value,attr_attrvalue,variation_regular_price,
									variation_sale_price,variation_stock,variation_sku,variation_product_code,
									variation_description,variation_fabric,variation_photo,variation_custom_size,createDate) 
									VALUES (:product_id,:variation_type,:variation_value,:attr_attrvalue,:variation_regular_price,
									:variation_sale_price,:variation_stock,:variation_sku,
									:variation_product_code,:variation_description,:variation_fabric,:variation_photo,:variation_custom_size,:createDate)");
									$stmt->execute(['product_id'=>$product_id,
									'variation_type'=>$products_attributes_id,
									'variation_value'=>$products_attributes_values,
									'attr_attrvalue'=>$attr_attrvalue,
									'variation_regular_price'=>$variation_regular_price,
									'variation_sale_price'=>$variation_sale_price,
									'variation_stock'=>$variation_stock,
									'variation_sku'=>$variation_sku,
									'variation_product_code'=>$variation_product_code,
									'variation_description'=>$variation_description,
									'variation_fabric'=>$variation_fabric,
									'variation_custom_size'=>$variation_custom_size,
									'variation_photo'=>$newVarimg,
									'createDate'=>$createDate]);
					}
				}
				
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Products added successfully</div>";
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
		$id = $_POST['product_id'];
		$brand_id=$category_id=$fabric_id= $style_id=$products_attributes_id=NULL;
		$color_id =NULL;
		if(isset($_POST['category_id']) && $_POST['category_id'] !=""){
			$category_id = implode(',',$_POST['category_id']);
		}
		if(isset($_POST['brand_id']) && $_POST['brand_id'] !=""){
			$brand_id = implode(',',$_POST['brand_id']);
		}
		$name = $_POST['name'];
		if(isset($_POST['slug']) && $_POST['slug'] !=""){
			$slug = $SettingsData->makeSlug($_POST['slug']);			
		}else{
			$slug = $SettingsData->makeSlug($name);
		}
		$regular_price = $_POST['regular_price'];
		$sale_price = $_POST['sale_price'];
		$sku = $_POST['sku'];
		$product_code = $_POST['product_code'];
		if(isset($_POST['style_id']) && $_POST['style_id'] !=""){
			$style_id = implode(',',$_POST['style_id']);
		}

		$stock = $_POST['stock'];
		$hsn_code = trim($_POST['hsn_code']);
		$custom_size = addslashes($_POST['custom_size']);

		$short_description = addslashes($_POST['short_description']);
		$additional_info = addslashes($_POST['additional_info']);
		
		$description = addslashes($_POST['description']);
		$alt = $_POST['alt'];
		if(isset($_POST['fabric_id']) && $_POST['fabric_id'] !=""){
			$fabric_id = implode(',',$_POST['fabric_id']);
		}
		if(isset($_POST['color_id']) && $_POST['color_id'] !=""){
			$color_id = implode(',',$_POST['color_id']);
		}
		$meta_title = $_POST['meta_title'];
		$meta_description = $_POST['meta_description'];
		$meta_keyword = $_POST['meta_keyword'];	
		$product_type = $_POST['product_type'];
		if(isset($_POST['variation_type']) && $_POST['variation_type'] !=""){
			$products_attributes_id = implode(',',$_POST['variation_type']);
		}
		$status = $_POST['status'];

		$banner_heading = $_POST['banner_heading'];
		$banner_description = $_POST['banner_description'];
		$banner_label 	= $_POST['banner_label'];
		$banner_url 	= $_POST['banner_url'];	

		$conn = $pdo->open();	

		
		$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products 
		WHERE id!=:id AND (slug=:slug )");
		$stmt->execute(['id'=>$id,'slug'=>$slug]);
		$row = $stmt->fetch();

		if($row['numrows'] > 0){			
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>Product already exist</div>";
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
					$uploadFileDir = '../../uploaded_files/products/';
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
				$stmt = $conn->prepare("UPDATE products SET category_id=:category_id,brand_id=:brand_id,name=:name,
				slug=:slug,regular_price=:regular_price,sale_price=:sale_price,sku=:sku,product_code=:product_code,
				style_id=:style_id,stock=:stock,hsn_code=:hsn_code,short_description=:short_description,additional_info=:additional_info,
				description=:description,alt=:alt,fabric_id=:fabric_id,product_type=:product_type,
				products_attributes_id=:products_attributes_id,meta_title=:meta_title,meta_description=:meta_description, 
				meta_keyword=:meta_keyword,photo=:photo,status=:status,banner_heading=:banner_heading ,banner_description=:banner_description,banner_label=:banner_label,banner_url=:banner_url,color=:color,custom_size=:custom_size WHERE id=:id");
				$stmt->execute(['category_id'=>$category_id,'brand_id'=>$brand_id,'name'=>$name,'slug'=>$slug,
				'regular_price'=>$regular_price,'sale_price'=>$sale_price,'sku'=>$sku,'product_code'=>$product_code,
				'style_id'=>$style_id,'stock'=>$stock,'hsn_code'=>$hsn_code,'short_description'=>$short_description,
				'additional_info'=>$additional_info,'description'=>$description,'alt'=>$alt,'fabric_id'=>$fabric_id,
				'product_type'=>$product_type,'products_attributes_id'=>$products_attributes_id,'meta_title'=>$meta_title,
				'meta_description'=>$meta_description,'meta_keyword'=>$meta_keyword,'photo'=>$newFileName,
				'status'=>$status,'banner_heading'=>$banner_heading,'banner_description'=>$banner_description,'banner_label'=>$banner_label,'banner_url'=>$banner_url,'color'=>$color_id,'custom_size'=>$custom_size,'id'=>$id]);
				

				//Gallery
				$createDate=date('Y-m-d h:i:s');	
				if (isset($_FILES['gallery']) && !empty($_FILES['gallery']['name']))
				{
					$gal_photo="";
					
					for($g=0;$g<count($_FILES['gallery']['name']);$g++){
						
						// get details of the uploaded file
						$fileTmpPath = $_FILES['gallery']['tmp_name'][$g];
					  	$fileName = $_FILES['gallery']['name'][$g];
						$fileSize = $_FILES['gallery']['size'][$g];
						$fileType = $_FILES['gallery']['type'][$g];
						$fileNameCmps = explode(".", $fileName);
						$fileExtension = strtolower(end($fileNameCmps));
						// sanitize file-name
						$gal_photo = md5(time() . $fileName) . '.' . $fileExtension;
						// check if file has one of the following extensions
						$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
						if (in_array($fileExtension, $allowedfileExtensions)){
							$uploadFileDir = '../../uploaded_files/products/';
							$dest_path = $uploadFileDir . $gal_photo;				
							if(move_uploaded_file($fileTmpPath, $dest_path)){								
								$stmt = $conn->prepare("INSERT INTO products_gallery 
									(product_id,gal_photo,createDate) VALUES (:product_id,:gal_photo,:createDate)");
								$stmt->execute(['product_id'=>$id,'gal_photo'=>$gal_photo,'createDate'=>$createDate]);
							}

						}
					}
				}
				
				//$variation_type
				if($product_type=='Variation' && $id!=""){
					for($v=0;$v<count($_POST['variation_regular_price']);$v++){
						$attrr=$attribute_value_id=$variation_regular_price=$variation_fabric=
						$variation_sale_price=$variation_stock=$variation_photo=$custom_size=$products_attributes_values="";
						$attr_attrvalue=[];

						$variation_regular_price = $_POST['variation_regular_price'][$v];
						$variation_sale_price = $_POST['variation_sale_price'][$v];
						$variation_stock = $_POST['variation_stock'][$v];
						$variation_sku = $_POST['variation_sku'][$v];
						$variation_product_code = $_POST['variation_product_code'][$v];
						$variation_description = $_POST['variation_description'][$v];
						$variation_fabric = $_POST['variation_fabric_value'][$v];

						$variation_custom_size = $_POST['variation_custom_size'][$v];
						
						if(isset($_POST['pro_var_id'][$v]) && $_POST['pro_var_id'][$v]!=''){
							 $variation_id = $_POST['pro_var_id'][$v];
						}else{
							$variation_id ='';
						}
						
						for($vat=0;$vat<count($_POST['variation_type']);$vat++){
							$attrr=$_POST['variation_type'][$vat];
							$products_attributes_values .= $_POST['attribute_'.$attrr][$v].',';
							$attribute_value_id = $_POST['attribute_'.$attrr][$v];
							$attr_attrvalue[]=array('AttributeId'=>$attrr,'AttributeValId'=>$attribute_value_id);
						}
						
						$products_attributes_values=rtrim($products_attributes_values,',');
						
						$attr_attrvalue= json_encode($attr_attrvalue);
						$newVarimg="";
						if (isset($_FILES['variation_photo']) && !empty($_FILES['variation_photo']['name'][$v]))
						{
							$fileTmpPath = $_FILES['variation_photo']['tmp_name'][$v];
							$fileName = $_FILES['variation_photo']['name'][$v];
							$fileSize = $_FILES['variation_photo']['size'][$v];
							$fileType = $_FILES['variation_photo']['type'][$v];
							$fileNameCmps = explode(".", $fileName);
							$fileExtension = strtolower(end($fileNameCmps));
							// sanitize file-name
							$newVarimg = md5(time() . $fileName) . '.' . $fileExtension;
							// check if file has one of the following extensions
							$allowedfileExtensions = array('jpg', 'jpeg', 'png', 'webp');
							if (in_array($fileExtension, $allowedfileExtensions)){
								$uploadFileDir = '../../uploaded_files/products/';
								$dest_path = $uploadFileDir . $newVarimg;				
								move_uploaded_file($fileTmpPath, $dest_path);									
							}
						}elseif(isset($_FILES['variation_photo_old'])){
							$newVarimg = $_POST['variation_photo_old'][$v];							
						}
						
						
						$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM products_variations 
						WHERE id=:id");
						$stmt->execute(['id'=>$variation_id]);
						$row = $stmt->fetch();

						if($row['numrows'] > 0){
							
							$stmt = $conn->prepare("UPDATE  products_variations SET 
										product_id=:product_id,variation_type=:variation_type,variation_value=:variation_value,
										attr_attrvalue=:attr_attrvalue,variation_regular_price=:variation_regular_price,
										variation_sale_price=:variation_sale_price,variation_stock=:variation_stock,
										variation_sku=:variation_sku,variation_product_code=:variation_product_code,
										variation_description=:variation_description,variation_fabric=:variation_fabric
										,variation_photo=:variation_photo,variation_custom_size=:variation_custom_size WHERE id=:id");
										$stmt->execute(['product_id'=>$id,'variation_type'=>$products_attributes_id,
										'variation_value'=>$products_attributes_values,
										'attr_attrvalue'=>$attr_attrvalue,'variation_regular_price'=>$variation_regular_price,
										'variation_sale_price'=>$variation_sale_price,'variation_stock'=>$variation_stock,
										'variation_sku'=>$variation_sku,'variation_product_code'=>$variation_product_code,
										'variation_description'=>$variation_description,'variation_fabric'=>$variation_fabric,
										'variation_photo'=>$newVarimg,'variation_custom_size'=>$variation_custom_size,'id'=>$variation_id]);
										
						}else{
							$stmt = $conn->prepare("INSERT INTO products_variations 
									(product_id,variation_type,variation_value,attr_attrvalue,variation_regular_price,
									variation_sale_price,variation_stock,variation_sku,variation_product_code,
									variation_description,variation_fabric,variation_photo,variation_custom_size,createDate) 
									VALUES (:product_id,:variation_type,:variation_value,:attr_attrvalue,:variation_regular_price,
									:variation_sale_price,:variation_stock,:variation_sku,:variation_product_code,
									:variation_description,:variation_fabric,:variation_photo,:variation_custom_size,:createDate)");
									$stmt->execute(['product_id'=>$id,
									'variation_type'=>$products_attributes_id,
									'variation_value'=>$products_attributes_values,
									'attr_attrvalue'=>$attr_attrvalue,
									'variation_regular_price'=>$variation_regular_price,
									'variation_sale_price'=>$variation_sale_price,
									'variation_stock'=>$variation_stock,
									'variation_sku'=>$variation_sku,
									'variation_product_code'=>$variation_product_code,
									'variation_description'=>$variation_description,
									'variation_fabric'=>$variation_fabric,
									'variation_custom_size'=>$variation_custom_size,
									'variation_photo'=>$newVarimg,
									'createDate'=>$createDate]);
						}
						
					}
				}
				$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Products updated successfully</div>";
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
			
			$stmt = $conn->prepare("DELETE FROM products WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$stmt = $conn->prepare("DELETE FROM products_variations WHERE product_id=:id");
			$stmt->execute(['id'=>$id]);
			$stmt = $conn->prepare("DELETE FROM products_gallery WHERE product_id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Products deleted successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));
		}
		catch(PDOException $e){
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));	
		}
		$pdo->close();
	}elseif(isset($_POST['deletevariation'])){
		$id = $_POST['id'];
		$conn = $pdo->open();
		try{
			$stmt = $conn->prepare("DELETE FROM products_variations WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Variation Product deleted successfully</div>";
				echo json_encode(array('sts'=>1,'msg'=>$msg));
		}
		catch(PDOException $e){
			$msg="<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>";
				echo json_encode(array('sts'=>0,'msg'=>$msg));	
		}
		$pdo->close();
	}elseif(isset($_POST['deletegallery'])){
		$id = $_POST['id'];
		$conn = $pdo->open();
		try{
			$stmt = $conn->prepare("DELETE FROM products_gallery WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$msg="<div class='alert alert-success alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-check'></i> Success!</h4>Image deleted successfully</div>";
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
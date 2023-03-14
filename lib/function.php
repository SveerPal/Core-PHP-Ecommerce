<?php
define('ROOT_DIRECTORY_ADMIN',$_SERVER['DOCUMENT_ROOT']);

if (session_status() == PHP_SESSION_NONE) {
	session_start();
}

	class FontEndData {
		public $conn;
		public $pdo;
   		public function __construct() {
			include_once ROOT_DIRECTORY_ADMIN.'/admin/includes/conn.php';
			$pdo = new Database();
      		$this->conn = $pdo->open();
   		}
		function getSettingsData($field){
			$stmt = $this->conn->prepare("SELECT $field FROM settings WHERE id=:id");
			$stmt->execute(['id'=>1]);
			$row= $stmt->fetch();
			return $row[$field];	
		}

		function menu($menu_name){
			$getStmt = $this->conn->prepare("SELECT * FROM menus WHERE menu_name =:menu_name ORDER BY id ASC ");
			$getStmt->execute(['menu_name'=>$menu_name]);
			return $cats = $getStmt->fetchAll();
		}
		function getSliderList(){
			$getStmt = $this->conn->prepare("SELECT * FROM sliders WHERE status =:status ORDER BY id ASC ");
			$getStmt->execute(['status'=>1]);
			return $cats = $getStmt->fetchAll();
		}

		function getSlug($id,$menutype){
			if($menutype!=""){
				if($menutype=='Page' ){
					$getStmt = $this->conn->prepare("SELECT slug FROM pages  where id=:id");
				}elseif($menutype=='Category'){
					$getStmt = $this->conn->prepare("SELECT cat_slug as slug FROM products_categories where id=:id");
				}
				$getStmt->execute(['id'=>$id]);
				$slug = $getStmt->fetch();
				return	$slug['slug'];
			}
		}

		
		
		function getBestSellerProductList(){
			$limit=10;
			$getStmt = $this->conn->prepare("SELECT p.product_type,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
			 min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
			 max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
			 left join products_variations as v on p.id=v.product_id where status='1' 
			 GROUP BY p.name ORDER BY counter DESC limit $limit");
			$getStmt->execute();
			return $productLists=$getStmt->fetchAll();
		}
		function getTestimonialList($limit){
			$limit=5;
			$getStmt = $this->conn->prepare("SELECT * FROM testimonials  where status='1' ORDER BY name ASC limit $limit");
			$getStmt->execute();
			return $getStmt->fetchAll();
		}
		function getBlogList($limit){
			$limit=4;
			$getStmt = $this->conn->prepare("SELECT * FROM blogs  where status='1' ORDER BY name ASC limit $limit");
			$getStmt->execute();
			return $getStmt->fetchAll();
		}
		function getFaqList(){
			
			$getStmt = $this->conn->prepare("SELECT * FROM faqs  where status='1' ORDER BY id desc");
			$getStmt->execute();
			return $getStmt->fetchAll();
		}

		function getPageDetails($slug){			
			$getStmt = $this->conn->prepare("SELECT * FROM pages  where status='1' and slug='$slug'");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}
		function getProductCategory($slug){						
			$getStmt = $this->conn->prepare("SELECT * FROM products_categories  where status='1' and (cat_slug='$slug' || id='$slug')");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}

		//Product Listing --Shop,Category,Related and Home Page
		function getProductList($limit){	
			
			$getStmt = $this->conn->prepare("SELECT p.product_type ,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
			min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
			max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
			left join products_variations as v on p.id=v.product_id where status='1' 
			GROUP BY p.name ORDER BY id DESC limit $limit");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return  $getStmt->fetchAll();
			}
		}
		//Product Listing --Shop,Category,Related and Home Page
		function getWishList(){	
			$product_ids = array();
			if(isset($_SESSION["wish_list"]) && count($_SESSION["wish_list"]) > 0){
				foreach($_SESSION["wish_list"] as $key =>$value){
					$product_ids[] = $value['code'];
				}
			}
			
			if(count($product_ids) > 0){
				$prod = implode(",",$product_ids);
			}else{
				$prod = '-1';
			}
			$limit = 50;
			$getStmt = $this->conn->prepare("SELECT p.product_type ,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
			min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
			max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
			left join products_variations as v on p.id=v.product_id where p.id in (".$prod.") AND status='1' 
			GROUP BY p.name ORDER BY id DESC limit $limit");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return  $getStmt->fetchAll();
			}
		}
		function getProductListCategory($category_id,$limit){
			
			$getStmt = $this->conn->prepare("SELECT p.product_type,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
			min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
			max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
			left join products_variations as v on p.id=v.product_id where status='1' and FIND_IN_SET($category_id,p.category_id)
			GROUP BY p.name ORDER BY id DESC limit $limit");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return  $getStmt->fetchAll();
			}
		}
		// Filter
		function getProductFilterPriceRange(){
			$getStmt = $this->conn->prepare("SELECT 						
				IF(min(v.variation_regular_price)<min(p.regular_price), 
					min(v.variation_regular_price), min(p.regular_price)
				) as minPrice, 
				IF(max(v.variation_regular_price)>max(p.regular_price), 
					max(v.variation_regular_price), max(p.regular_price)
				) as maxPrice
				FROM products as p 
					left join products_variations as v on p.id=v.product_id 
				where p.status='1'");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}

		function getProductFilterColorSize($table,$attribute_id){
			$getStmt = $this->conn->prepare("SELECT id,name FROM $table where status='1' and products_attribute_id='$attribute_id'");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		
		function getProductFilter($table,$column){
		//	$getStmt = $this->conn->prepare("SELECT id,name FROM $table where status='1'");
		    $getStmt = $this->conn->prepare("SELECT t1.id, t1.name  FROM $table as t1 
		                                        left join products as t2 on FIND_IN_SET(t1.id, t2.$column) 
		                                        where t1.status='1' GROUP BY t1.name"
		                                  );
		
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}

		// Product Detail Page
		function getProductDetail($slug){		
		   // echo "SELECT * FROM products  where status='1' and (slug='$slug' or id='$slug')";
			$getStmt = $this->conn->prepare("SELECT * FROM products  where status='1' and (slug='$slug' or id like '%$slug%')");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}
		function getProductDetailGallery($product_id){			
			$getStmt = $this->conn->prepare("SELECT * FROM products_gallery  where  product_id='$product_id'");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getProductDetailVariation($product_id){			
			$getStmt = $this->conn->prepare("SELECT * FROM products_variations  where product_id='$product_id'");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getProductDetailStyleFabric($id,$table){			
			$getStmt = $this->conn->prepare("SELECT name FROM $table  where status='1' and id in('$id')");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			$data="";
			if($count>0){
				$property=$getStmt->fetchAll();
				foreach($property as $prpty){
					$data .=$prpty['name'].',';
				}
				$data = rtrim($data,',');
			}
			return $data;
		}

		function getProductDetailStyleColor($id,$table){			
			$getStmt = $this->conn->prepare("SELECT name FROM $table  where status='1' and id in($id)");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			$data="";
			if($count>0){
				$property=$getStmt->fetchAll();
				foreach($property as $prpty){
					$data .=$prpty['name'].',';
				}
				$data = rtrim($data,',');
			}
			return $data;
		}
		function getProductDetailAttribute($id){			
			$getStmt = $this->conn->prepare("SELECT id,name,code FROM products_attributes  where status='1' and id in($id)");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			$data="";
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getProductDetailAttributeValue($attid,$id){			
			$getStmt = $this->conn->prepare("SELECT id,name,photo,code FROM products_attributes_values  
					where status='1' and products_attribute_id in($attid) and id in($id)");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			$data="";
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getProductDetailVariationAttribute($product_id){
			
			$getStmt = $this->conn->prepare("SELECT * FROM products_variations  where product_id='$product_id'");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getProductReviews($product_id){
			$getStmt = $this->conn->prepare("SELECT SUM(fld_rating+0) as total_rating, COUNT(fld_id) as total_user FROM product_review where fld_status='1' AND fld_product_id = '$product_id' group by fld_product_id");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}
		function getProductReviewslist($product_id){
			$getStmt = $this->conn->prepare("SELECT * FROM product_review where fld_status='1' AND fld_product_id = '$product_id' order by fld_id desc");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getProductDetailPrice($product_id){
			$getStmt = $this->conn->prepare("SELECT p.regular_price,p.sale_price,
			min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
			max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice 
			FROM products as p left join products_variations as v on p.id=v.product_id where status='1' 
			and p.id='$product_id' GROUP BY p.name ");
			$getStmt->execute();
			$count = $getStmt->rowCount();
			if($count>0){
				return  $getStmt->fetch();
			}
		}
		
		//Payment Page
		function getProductVariationAttributeValue($productId,$productVariationId){
			     $productByCode =$this->conn->prepare("select t1.photo,t1.slug,t1.name, t1.id as productid, t1.sale_price, 
			     t1.product_type, t2.* from products as t1 join 
			     products_variations as t2 on t1.id=t2.product_id  
			     where t1.id=$productId and t2.id=$productVariationId group by id");
				
			    $productByCode->execute();
			    $productByCodes=$productByCode->fetch();    
			        //Get Variation Name And Value 
			    $variation_type=str_replace(",","','",$productByCodes["variation_type"]);
			    $variation_value=str_replace(",","','",$productByCodes["variation_value"]);

				
			    $attributename =$this->conn->prepare("select t1.name as attr, t2.name as attrval from 
				products_attributes as t1 join 
			    products_attributes_values as t2 on t1.id=t2.products_attribute_id  
			    where t1.id in ('$variation_type') and t2.id in('$variation_value')");
				
			    $attributename->execute();
			    $attributename=$attributename->fetchAll();
			    $varcombination="";
			    foreach($attributename as $attribute){
			        $varcombination .=$attribute['attr'].': '.$attribute['attrval']. " | ";				
			    }
				
			    return rtrim($varcombination," | ");
		}
		function getCustomerCheck($email){
			$getStmt =$this->conn->prepare("select * from users where email='$email'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return  $getStmt->fetch();
			}
   		}
		function getCustomerInsert($data){	
				             
			$firstname=$data['firstname'];
			$lastname=$data['lastname'];
			$username=$data['username'];
			$email=$data['email'];
			$phone=$data['phone'];
			$address=$data['address'];
			$address2=$data['address2'];
			$city=$data['city'];
			$zip=$data['zip'];
			$country=$data['country'];
			$company=$data['company'];
			$is_shipping_same=$data['is_shipping_same'];
			$is_save_info=$data['is_save_info'];
			$shipping_firstname=$data['shipping_firstname'];
			$shipping_lastname=$data['shipping_lastname'];
			$shipping_email=$data['shipping_email'];
			$shipping_phone=$data['shipping_phone'];
			$shipping_address=$data['shipping_address'];
			$shipping_address2=$data['shipping_address2'];
			$shipping_city=$data['shipping_city'];
			$shipping_zip=$data['shipping_zip'];
			$shipping_country=$data['shipping_country'];
			$shipping_company=$data['shipping_company'];
			$password=md5($data['firstname']);
			$date = date('d-m-Y H:i:s');
			//print_r($data);
			//die('ddddd');

			$getStmt =$this->conn->prepare("INSERT INTO users (firstname,lastname,username,email,
										phone_no,password,status,created_on)
									VALUES('$firstname','$lastname','$username','$email','$phone','$password',
											'1','$date')"
									);
   			$getStmt->execute();
			$userid=(int)$this->conn->lastInsertId();

			

			$getStmt2 =$this->conn->prepare("INSERT INTO users_address (
				fld_user_id,fld_first_name,fld_last_name,fld_company_name,fld_address,fld_address2,fld_city
			   ,fld_zip_code,fld_country,fld_default_address,fld_phone_no,fld_email_id,fld_status,
			   fld_type,fld_created_date)
					VALUES('$userid','$firstname','$lastname','$company','$address','$address2',
					'$city','$zip','$country','$is_save_info','$phone','$email','active','billing','$date')"
					);
			$getStmt2->execute();
			$getStmt3 =$this->conn->prepare("INSERT INTO users_address (
				fld_user_id,fld_first_name,fld_last_name,fld_company_name,fld_address,fld_address2,fld_city
			   	,fld_zip_code,fld_country,fld_default_address,fld_phone_no,fld_email_id,fld_status,
			   	fld_type,fld_created_date)
					VALUES('$userid','$shipping_firstname','$shipping_lastname','$shipping_company',
					'$shipping_address','$shipping_address2','$shipping_city','$shipping_zip',
					'$shipping_country','$is_save_info','$shipping_phone','$shipping_email',
					'active','shipping','$date')"
					);
			$getStmt3->execute();
			
			if($userid){
				$uID = $userid;
    	        $_SESSION['user_name']=$email;
    			$_SESSION['userid']=$userid;
    			$_SESSION['name']=$firstname.' '.$lastname;
    			$_SESSION['email_address']=$email;
				$_SESSION['useremail']=$email;
    			$_SESSION['display_name']=$firstname.' '.$lastname;
				$email_cc='';
    			$email_subject = 'Login Details of AL-PASBAN';
    			$email_message = '<p>Hi User,</p>
                                  <p>Welcome to AL-PASBAN!</p>
                                  <p>You have been successfully registered with us.</p>
    							  <p>Your temporary password is <strong> "'.$password.'" </strong></p>
    							  <p>Please change your password after login.  </p>
                                  <p>Thanks & Regards,</p>
                                  <p>AL-PASBAN Team</p>';
    			
    			$headers  = 'MIME-Version: 1.0' . "\r\n";
    			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    			$headers .= 'To: AL-PASBAN Login details <'.$email.'>' . "\r\n";
    			$headers .= 'From: "AL-PASBAN" <support@alpasban.com>' . "\r\n";
    			$headers .= 'Cc: '.$email_cc. "\r\n";
				$success = $this->send_mail($email, 'support@alpasban.com', $email_subject, $email_message,$headers);
			}
			return true;
			
   		}

		function getCustomerAddressInsert($data){	
				            
			$firstname=$data['firstname'];
			$lastname=$data['lastname'];
			$username=$data['username'];
			$email=$data['email'];
			$phone=$data['phone'];
			$address=$data['address'];
			$address2=$data['address2'];
			$city=$data['city'];
			$zip=$data['zip'];
			$country=$data['country'];
			$company=$data['company'];
			$is_shipping_same=$data['is_shipping_same'];
			$is_save_info=$data['is_save_info'];
			$shipping_firstname=$data['shipping_firstname'];
			$shipping_lastname=$data['shipping_lastname'];
			$shipping_email=$data['shipping_email'];
			$shipping_phone=$data['shipping_phone'];
			$shipping_address=$data['shipping_address'];
			$shipping_address2=$data['shipping_address2'];
			$shipping_city=$data['shipping_city'];
			$shipping_zip=$data['shipping_zip'];
			$shipping_country=$data['shipping_country'];
			$shipping_company=$data['shipping_company'];
			$password=md5($data['firstname']);
			$userid=$data['userid'];
			$date = date('Y-m-d');
			

			$getStmt =$this->conn->prepare("select * from users_address where fld_user_id='$userid'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				$users_address = $getStmt->fetchAll();
				foreach($users_address as $usrs){
					if($usrs['fld_type']=='shipping'){
						$stmt = $this->conn->prepare("UPDATE users_address SET 
							fld_user_id=:fld_user_id,fld_first_name=:fld_first_name,fld_last_name=:fld_last_name,
							fld_company_name=:fld_company_name,fld_address=:fld_address,fld_address2=:fld_address2,
							fld_city=:fld_city,fld_zip_code=:fld_zip_code,fld_country=:fld_country,
							fld_default_address=:fld_default_address,fld_phone_no=:fld_phone_no,
							fld_email_id=:fld_email_id,fld_status=:fld_status,fld_type=:fld_type,
							fld_created_date=:fld_created_date WHERE fld_id=:fld_id");
						$stmt->execute(['fld_user_id'=>$userid,'fld_first_name'=>$shipping_firstname,
							'fld_last_name'=>$shipping_lastname,'fld_company_name'=>$shipping_company,
							'fld_address'=>$shipping_address,'fld_address2'=>$shipping_address2,
							'fld_city'=>$shipping_city,'fld_zip_code'=>$shipping_zip,
							'fld_country'=>$shipping_country,'fld_default_address'=>$is_save_info,
							'fld_phone_no'=>$shipping_phone,'fld_email_id'=>$shipping_email,
							'fld_status'=>'active','fld_type'=>'shipping','fld_created_date'=>$date,
							'fld_id'=>$usrs['fld_id']]);
					}
					if($usrs['fld_type']=='billing'){
						$stmt = $this->conn->prepare("UPDATE users_address SET 
							fld_user_id=:fld_user_id,fld_first_name=:fld_first_name,fld_last_name=:fld_last_name,
							fld_company_name=:fld_company_name,fld_address=:fld_address,fld_address2=:fld_address2,
							fld_city=:fld_city,fld_zip_code=:fld_zip_code,fld_country=:fld_country,
							fld_default_address=:fld_default_address,fld_phone_no=:fld_phone_no,
							fld_email_id=:fld_email_id,fld_status=:fld_status,fld_type=:fld_type,
							fld_created_date=:fld_created_date WHERE fld_id=:fld_id");
						$stmt->execute(['fld_user_id'=>$userid,'fld_first_name'=>$firstname,'fld_last_name'=>$lastname,
							'fld_company_name'=>$company,'fld_address'=>$address,'fld_address2'=>$address2,
							'fld_city'=>$city,'fld_zip_code'=>$zip,'fld_country'=>$country,
							'fld_default_address'=>$is_save_info,'fld_phone_no'=>$phone,'fld_email_id'=>$email,
							'fld_status'=>'active','fld_type'=>'billing','fld_created_date'=>$date,
							'fld_id'=>$usrs['fld_id']]);
					}

				}
				
			}else{
				
				$getStmt2 =$this->conn->prepare("INSERT INTO users_address (
					fld_user_id,fld_first_name,fld_last_name,fld_company_name,fld_address,fld_address2,fld_city
				   ,fld_zip_code,fld_country,fld_default_address,fld_phone_no,fld_email_id,fld_status,
				   fld_type,fld_created_date)
						VALUES('$userid','$firstname','$lastname','$company','$address','$address2',
						'$city','$zip','$country','$is_save_info','$phone','$email','active','billing','$date')"
						);
				$getStmt2->execute();
				$getStmt3 =$this->conn->prepare("INSERT INTO users_address (
					fld_user_id,fld_first_name,fld_last_name,fld_company_name,fld_address,fld_address2,fld_city
					   ,fld_zip_code,fld_country,fld_default_address,fld_phone_no,fld_email_id,fld_status,
					   fld_type,fld_created_date)
						VALUES('$userid','$shipping_firstname','$shipping_lastname','$shipping_company',
						'$shipping_address','$shipping_address2','$shipping_city','$shipping_zip',
						'$shipping_country','$is_save_info','$shipping_phone','$shipping_email',
						'active','shipping','$date')"
						);
				$getStmt3->execute();
			}
			
			
			
			return true;
			
   		}

		// Create Order
		function createOrder($data){
			//print_R($data);
			$fld_order_id=$data['fld_order_id'];
			$fld_user_id=$data['fld_user_id'];
			$fld_payment_type=$data['fld_payment_type'];
			$fld_currency=$data['fld_currency'];
			$fld_amount=$data['fld_amount'];
			$fld_first_name=$data['fld_first_name'];
			$fld_last_name=$data['fld_last_name'];
			$fld_email_id=$data['fld_email_id'];
			$fld_phone_no=$data['fld_phone_no'];
			$fld_address=$data['fld_address'];
			$fld_address2=$data['fld_address2'];
			$fld_city=$data['fld_city'];
			$fld_state=$data['fld_state'];
			$fld_zip_code=$data['fld_zip_code'];
			$fld_country=$data['fld_country'];
			$fld_shipping_first_name=$data['fld_shipping_first_name'];
			$fld_shipping_last_name=$data['fld_shipping_last_name'];
			$fld_shipping_email_id=$data['fld_shipping_email_id'];
			$fld_shipping_phone_no=$data['fld_shipping_phone_no'];
			$fld_shipping_address=$data['fld_shipping_address'];
			$fld_shipping_address2=$data['fld_shipping_address2'];
			$fld_shipping_city=$data['fld_shipping_city'];
			$fld_shipping_state=$data['fld_shipping_state'];
			$fld_shipping_zip_code=$data['fld_shipping_zip_code'];
			$fld_shipping_country=$data['fld_shipping_country'];
			$fld_status=$data['fld_status'];
			//$fld_comments=$data['fld_comments'];
			$fld_payment_status=$data['fld_payment_status'];
			$fld_payment_date=$data['fld_payment_date'];
			$discount_code=$data['discount_code'];
			$discount_amount=$data['discount_amount'];
			$fld_upload_date=$data['fld_upload_date'];
			$fld_modified_date=$data['fld_modified_date'];


			$getStmt3 =$this->conn->prepare("INSERT INTO order_detials (
									fld_order_id,fld_user_id,fld_payment_type,fld_currency,fld_amount,
									fld_first_name,fld_last_name,fld_email_id,fld_phone_no,fld_address,
									fld_address2,fld_city,fld_state,fld_zip_code,fld_country,
									fld_shipping_first_name,fld_shipping_last_name,fld_shipping_email_id,
									fld_shipping_phone_no,fld_shipping_address,fld_shipping_address2,
									fld_shipping_city,fld_shipping_state,fld_shipping_zip_code,fld_shipping_country,
									fld_status,fld_payment_status,fld_payment_date,discount_code,discount_amount,
									fld_upload_date,fld_modified_date)
						VALUES('$fld_order_id','$fld_user_id','$fld_payment_type','$fld_currency','$fld_amount',
							'$fld_first_name','$fld_last_name','$fld_email_id','$fld_phone_no','$fld_address',
							'$fld_address2','$fld_city','$fld_state','$fld_zip_code','$fld_country',
							'$fld_shipping_first_name','$fld_shipping_last_name','$fld_shipping_email_id',
							'$fld_shipping_phone_no','$fld_shipping_address','$fld_shipping_address2','$fld_shipping_city',
							'$fld_shipping_state','$fld_shipping_zip_code','$fld_shipping_country','$fld_status'
							,'$fld_payment_status','$fld_payment_date','$discount_code','$discount_amount'
							,'$fld_upload_date','$fld_modified_date')"
						);
					return	$getStmt3->execute();
		}
		function createOrderHistory($orderDetail){
			$fld_order_id=$orderDetail['fld_order_id'];
			$fld_product_id=$orderDetail['fld_product_id'];
			$fld_product_name=$orderDetail['fld_product_name'];
			$fld_quantity=$orderDetail['fld_quantity'];
			$fld_product_variation_id=$orderDetail['fld_product_variation_id'];
			$fld_amount=$orderDetail['fld_amount'];
			$fld_sale_price=$orderDetail['fld_sale_price'];
			$fld_sub_title=$orderDetail['fld_sub_title'];
			$fld_product_type=$orderDetail['fld_product_type'];
			$fld_img_path=$orderDetail['fld_img_path'];
			$fld_upload_date=$orderDetail['fld_upload_date'];
			$getStmt3 =$this->conn->prepare("INSERT INTO order_history (
						fld_order_id,fld_product_id,fld_product_name,fld_quantity,fld_product_variation_id,
						fld_amount,fld_sale_price,fld_sub_title,fld_product_type,fld_img_path,fld_upload_date)
			VALUES('$fld_order_id','$fld_product_id','$fld_product_name','$fld_quantity','$fld_product_variation_id',
				'$fld_amount','$fld_sale_price','$fld_sub_title','$fld_product_type','$fld_img_path','$fld_upload_date')"
			);
			return	$getStmt3->execute();
		}
		function UpdateOrder($fld_order_id,$userid,$razorpay_payment_id,$razorpay_order_id,$fld_payment_status,$fld_payment_type){
		        
				$stmt = $this->conn->prepare("UPDATE order_detials SET 
								fld_payment_type=:fld_payment_type,razorpay_order_id=:razorpay_order_id,fld_transaction_id=:fld_transaction_id,
								fld_payment_status=:fld_payment_status WHERE fld_user_id=:fld_user_id 
								AND fld_order_id=:fld_order_id");
			return	$stmt->execute(['fld_payment_type'=>$fld_payment_type,'razorpay_order_id'=>$razorpay_order_id,
								'fld_transaction_id'=>$razorpay_payment_id,'fld_payment_status'=>$fld_payment_status,
								'fld_user_id'=>$userid,'fld_order_id'=>$fld_order_id]);
		}
		function getOrderDetailHistory($orderid){
			$getStmt =$this->conn->prepare("select * from order_history where fld_order_id='$orderid'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function getOrderDetail($orderid){
			$getStmt =$this->conn->prepare("select * from order_detials where fld_order_id='$orderid'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}
		function getOrderListByUser($userid){
			$getStmt =$this->conn->prepare("select * from order_detials where fld_user_id='$userid'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		//Email 
		function send_mail($to, $from, $subject='',$message='',$headers=''){
		   
		//	$ok = mail($to,$subject,$message,$headers);
			
			$mail = new PHPMailer(true);
            try {
                $mail->isSMTP();
                $mail->setFrom('no-reply@alpasban.com', 'Al-Pasban');
                $mail->Username = 'no-reply@alpasban.com';
                $mail->Password = 'jAEl?O.L^8t_';
                $mail->Host = 'mail.alpasban.com';
                $mail->Port = 587;
                $mail->SMTPAuth = true;
                $mail->SMTPSecure = 'tls';
                $mail->addAddress($to);
                $mail->isHTML(true);
                $mail->Subject = $subject;
                $mail->Body = $message;
                $mail->Send();
                return true;
            } catch (phpmailerException $e) {
                return false;
            } catch (Exception $e) {
                return false;
            }
			return true;
		}

		//My Account
		function getAddress($userid,$type){
			$getStmt =$this->conn->prepare("select * from users_address where fld_user_id='$userid' AND fld_type='$type'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
		}
		function updateBillingShippingAddress($data){
            $count="";
            if($data['addressType']=='shipping'){
                
				$stmt = $this->conn->prepare("UPDATE users_address SET 
					fld_address=:fld_address,fld_address2=:fld_address2,
					fld_city=:fld_city,fld_zip_code=:fld_zip_code WHERE fld_user_id=:fld_user_id and fld_type=:fld_type");
				$stmt->execute([
					'fld_address'=>$data['fld_address'],
					'fld_address2'=>$data['fld_address2'],
					'fld_city'=>$data['fld_city'],
					'fld_zip_code'=>$data['fld_zip_code'],
					'fld_user_id'=>$data['userid'],
					'fld_type'=>'shipping'
					]);
			 	$count = $stmt->rowCount();	
			}
			if($data['addressType']=='billing'){
			    
				$stmt = $this->conn->prepare("UPDATE users_address SET 
					fld_address=:fld_address,fld_address2=:fld_address2,
					fld_city=:fld_city,fld_zip_code=:fld_zip_code WHERE fld_user_id=:fld_user_id and fld_type=:fld_type");
				$stmt->execute([
					'fld_address'=>$data['fld_address'],
					'fld_address2'=>$data['fld_address2'],
					'fld_city'=>$data['fld_city'],
					'fld_zip_code'=>$data['fld_zip_code'],
					'fld_user_id'=>$data['userid'],
					'fld_type'=>'billing'
					]);
				$count = $stmt->rowCount();	
			}
			return $count;
		}
		
		function orderDetailProduct($orderid){
			//echo "select * from order_history where fld_order_id='$orderid'";
			$getStmt =$this->conn->prepare("select * from order_history where fld_order_id='$orderid'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		
		
		function getProductVaritaionCodeSku($productId,$productVariationId){
			$productByCode =$this->conn->prepare("select variation_sku as sku , variation_product_code as product_code
									from products_variations where product_id=$productId and id=$productVariationId");
		   
		   $productByCode->execute();
		   return $productByCodes=$productByCode->fetch(); 		  
   		}
		function getProductCodeSku($productId){
			$productByCode =$this->conn->prepare("select sku,product_code from products where id=$productId");		   
		   $productByCode->execute();
		   return $productByCodes=$productByCode->fetch(); 		  
   		}
        
        function getMetaData($table,$slug){
            if($table=='products_categories'){
                $sql="select name,meta_title,meta_description from $table where cat_slug='$slug'";
            }else{
                $sql="select name,meta_title,meta_description from $table where slug='$slug'";
            }
		    $productByCode =$this->conn->prepare($sql);		   
		    $productByCode->execute();
		    return $productByCodes=$productByCode->fetch(); 		  
   		}
        
        
		function updateSettingsData($data){
			//print_r($data);
			//die;
			$email = isset($data['email']) ? $data['email'] : '';
			$phone = isset($data['phone']) ? $data['phone'] : '';
			$address = isset($data['address']) ? $data['address'] : '';
			$copyright = isset($data['copyright']) ? $data['copyright'] : '';
			$map = isset($data['map']) ? $data['map'] : '';
			$facebook = isset($data['facebook']) ? $data['facebook'] : '';
			$instagram = isset($data['instagram']) ? $data['instagram'] : '';
			$twitter = isset($data['twitter']) ? $data['twitter'] : '';
			$pintrest = isset($data['pintrest']) ? $data['pintrest'] : '';
			$youtube = isset($data['youtube']) ? $data['youtube'] : '';
			$headScript = isset($data['headScript']) ? $data['headScript'] : '';
			$bodyScript = isset($data['bodyScript']) ? $data['bodyScript'] : '';
			$footerScript = isset($data['footerScript']) ? $data['footerScript'] : '';
			$footerText = isset($data['footerText']) ? $data['footerText'] : '';
			$logo = isset($data['logo']) ? $data['logo'] : '';
			
			$stmt = $this->conn->prepare("UPDATE settings SET 
							email=:email,phone=:phone,address=:address,copyright=:copyright,map=:map,facebook=:facebook,
							instagram=:instagram,twitter=:twitter,pintrest=:pintrest,youtube=:youtube,headScript=:headScript,
							bodyScript=:bodyScript,footerScript=:footerScript,footerText=:footerText,logo=:logo WHERE id=:id");
			$stmt->execute(['email'=>$email,'phone'=>$phone,'address'=>$address,'copyright'=>$copyright,'map'=>$map,
							'facebook'=>$facebook,'instagram'=>$instagram,'twitter'=>$twitter,'pintrest'=>$pintrest,
							'youtube'=>$youtube,'headScript'=>$headScript,'bodyScript'=>$bodyScript,
							'footerScript'=>$footerScript,'footerText'=>$footerText,'logo'=>$logo,
							'id'=>1]);
			//$row= $stmt->fetch();
			return "wwww";
			//return $row[$field];	
		}

		

		function categoryTreeEdit($parent_id = 0, $sub_mark = '',$selectedCatId){
			$getStmt = $this->conn->prepare("SELECT * FROM products_categories WHERE parent_category =:parent_category ORDER BY name ASC ");
			$getStmt->execute(['parent_category'=>$parent_id]);
			$cats = $getStmt->fetchAll();
			foreach($cats as $row){
				$selected="";
				$slctdCatId=explode(',',$selectedCatId);
				if(in_array($row['id'],$slctdCatId)){
					$selected="selected";
				}
				echo "<option value='".$row['id']."' $selected>".$sub_mark.$row['name'].'</option>';
				$this->categoryTree($row['id'], $sub_mark.'|--',$selectedCatId);
			}
		}

		function selctDataOption($table){
			$getStmt = $this->conn->prepare("SELECT * FROM $table ORDER BY name ASC ");
			$getStmt->execute();
			return $cats = $getStmt->fetchAll();			
		}

		function getProductGallery($product_id){
			$getStmt = $this->conn->prepare("SELECT id,gal_photo FROM products_gallery where product_id='$product_id'");
			$getStmt->execute();
			return $cats = $getStmt->fetchAll();			
		}

		function getProductVariation($product_id){
			$getStmt = $this->conn->prepare("SELECT * FROM products_variations where product_id='$product_id'");
			$getStmt->execute();
			return $cats = $getStmt->fetchAll();			
		}

		function getAttribute($table){
			$getStmt = $this->conn->prepare("SELECT id,name,code FROM $table ORDER BY name ASC ");
			$getStmt->execute();
			return $cats = $getStmt->fetchAll();
			
		}
		function getAttributeDetail($id){
			$getStmt = $this->conn->prepare("SELECT id,name,code FROM products_attributes where id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $cats = $getStmt->fetch();
			
		}
		function getAttributeValue($attribute_id){
			//die($attribute_id);
			$getStmt = $this->conn->prepare("SELECT id,name FROM products_attributes_values where products_attribute_id='$attribute_id' ORDER BY name ASC ");
			$getStmt->execute();
			return $cats = $getStmt->fetchAll();
			
		}
		function getProductDetails($id){
			$getStmt = $this->conn->prepare("SELECT * FROM products 
											-- join products_variations on products.id=products_variations.product_id
											-- join products_gallery on products.id=products_gallery.product_id
											where products.id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $productDetail = $getStmt->fetchAll();
			
		}
		function getPageDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM pages where id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		function getBlogDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs where slug='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		function nextBlog($id){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs where id>$id and status='1' order by id ASC");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		function previousBlog($id){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs where id<$id and status='1' order by id DESC");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		function getBlogTags($id){
			$getStmt = $this->conn->prepare("SELECT tag_id FROM blogs where id=$id");
			$getStmt->execute();
			$tag_id= $getStmt->fetch();
			$tag=$tag_id['tag_id'];
			if($tag_id['tag_id']){
			   // echo "SELECT name FROM blogs_tags where id in($tag)";
			    $getStmt = $this->conn->prepare("SELECT name,slug FROM blogs_tags where id in($tag)");
    			$getStmt->execute();
    		    return $getStmt->fetchAll();
			}
			return false;
		}
		function getBlogCategory($id){
			$getStmt = $this->conn->prepare("SELECT category_id FROM blogs where id=$id");
			$getStmt->execute();
			$tag_id= $getStmt->fetch();
			$tag=$tag_id['category_id'];
			if($tag_id['category_id']){
			    //echo "SELECT name FROM blogs_categories where id in($tag)";
			    $getStmt = $this->conn->prepare("SELECT name,slug FROM blogs_categories where id in($tag)");
    			$getStmt->execute();
    		    return $getStmt->fetchAll();
			}
			return false;
		}
		function getRecentBlog($id){
		    $getStmt = $this->conn->prepare("SELECT * FROM blogs where id <> $id and status='1' limit 5");
			$getStmt->execute();
		    return $getStmt->fetchAll();
		}
		function getAllBlogCategory(){
		    $getStmt = $this->conn->prepare("SELECT * FROM blogs_categories");
			$getStmt->execute();
		    return $getStmt->fetchAll();
		}
		function getAllBlogList(){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs  where status='1' ORDER BY id desc");
			$getStmt->execute();
			return $getStmt->fetchAll();
		}
		function getBlogCategoryDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs_categories where slug='$id' ");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		function getBlogTagDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs_tags where slug='$id'");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		function getProductCategoryForGoogleTag($id){			
			$getStmt = $this->conn->prepare("SELECT category_id FROM products where products.id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			$productDetail = $getStmt->fetch();
			$category_id=explode(',',$productDetail['category_id']);			
			if(count($category_id)>0){
				$catid="";			
				for($i=0;$i<count($category_id);$i++){
					$catid .='"'.	$category_id[$i].'",';
				}
				$catid=rtrim($catid,',');
				$sql="SELECT name FROM products_categories  where status='1' and id in($catid)";
				$getStmt = $this->conn->prepare($sql);
				$getStmt->execute();
				$count = $getStmt->rowCount();
				if($count>0){
					return $getStmt->fetchAll();
				}
			}
			return false;			
		}
		
                        
	}
	$FontEndData=new FontEndData();
	//print_r($SettingsData);
	//$getSettingsData=$SettingsData->getSettingsData('email');
	//print_r($getSettingsData);
	//die;
	//$pdo->close();

?>
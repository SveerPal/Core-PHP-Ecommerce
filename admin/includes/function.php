<?php
	class SettingsData {
		public $conn;
		public $pdo;
   		public function __construct() {
			include_once 'session.php';
			$pdo = new Database();
      		$this->conn = $pdo->open();
      		error_reporting(0);
   		}
		function getSettingsData($field){
			$stmt = $this->conn->prepare("SELECT $field FROM settings WHERE id=:id");
			$stmt->execute(['id'=>1]);
			$row= $stmt->fetch();
			return $row[$field];	
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
			$header_shipping = isset($data['header_shipping']) ? $data['header_shipping'] : '';
			
			$stmt = $this->conn->prepare("UPDATE settings SET 
							email=:email,phone=:phone,address=:address,copyright=:copyright,map=:map,facebook=:facebook,
							instagram=:instagram,twitter=:twitter,pintrest=:pintrest,youtube=:youtube,headScript=:headScript,
							bodyScript=:bodyScript,footerScript=:footerScript,footerText=:footerText,logo=:logo,header_shipping=:header_shipping WHERE id=:id");
			$stmt->execute(['email'=>$email,'phone'=>$phone,'address'=>$address,'copyright'=>$copyright,'map'=>$map,
							'facebook'=>$facebook,'instagram'=>$instagram,'twitter'=>$twitter,'pintrest'=>$pintrest,
							'youtube'=>$youtube,'headScript'=>$headScript,'bodyScript'=>$bodyScript,
							'footerScript'=>$footerScript,'footerText'=>$footerText,'logo'=>$logo,'header_shipping'=>$header_shipping,
							'id'=>1]);
			//$row= $stmt->fetch();
			//return "wwww";
			return $row[$field];	
		}

		function makeSlug($string){
			$slug = trim($string); // trim the string
			$slug= preg_replace('/[^a-zA-Z0-9 -]/','',$slug ); // only take alphanumerical characters, but keep the spaces and dashes too...
			$slug= str_replace(' ','-', $slug); // replace spaces by dashes
			$slug= strtolower($slug);  // make it lowercase
			return $slug;
		}
		function pageTree($parent = 0, $sub_mark = ''){
			$getStmt = $this->conn->prepare("SELECT * FROM pages WHERE parent =:parent ORDER BY name ASC ");
			$getStmt->execute(['parent'=>$parent]);
			$cats = $getStmt->fetchAll();
			foreach($cats as $row){
				echo "<option value='".$row['id']."'>".$sub_mark.$row['name'].'</option>';
				$this->pageTree($row['id'], $sub_mark.'|--');
			}
		}

		function pageTreeEdit($parent = 0, $sub_mark = '',$selectedCatId,$pageid){
			$getStmt = $this->conn->prepare("SELECT * FROM pages WHERE parent =:parent and id!=:id ORDER BY name ASC ");
			$getStmt->execute(['parent'=>$parent,'id'=>$pageid]);
			$cats = $getStmt->fetchAll();
			foreach($cats as $row){
				$selected="";
				$slctdCatId=explode(',',$selectedCatId);
				if(in_array($row['id'],$slctdCatId)){
					$selected="selected";
				}
				echo "<option value='".$row['id']."' $selected>".$sub_mark.$row['name'].'</option>';
				$this->pageTreeEdit($row['id'], $sub_mark.'|--',$selectedCatId,$pageid);
			}
		}

		function categoryTree($parent_id = 0, $sub_mark = ''){
			$getStmt = $this->conn->prepare("SELECT * FROM products_categories WHERE parent_category =:parent_category ORDER BY name ASC ");
			$getStmt->execute(['parent_category'=>$parent_id]);
			$cats = $getStmt->fetchAll();
			foreach($cats as $row){
				echo "<option value='".$row['id']."'>".$sub_mark.$row['name'].'</option>';
				$this->categoryTree($row['id'], $sub_mark.'|--');
			}
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
		function getProductDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM products 
											-- join products_variations on products.id=products_variations.product_id
											-- join products_gallery on products.id=products_gallery.product_id
											where products.id=$id ORDER BY name ASC ");
			$getStmt->execute();
			return $productDetail = $getStmt->fetchAll();
			
		}
		function getPageDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM pages where id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		/**/
		function getOrderList(){
			$getStmt =$this->conn->prepare("SELECT * from order_detials ORDER BY fld_modified_date DESC ");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetchAll();
			}
		}
		function orderDetail($orderid){
		//	echo "select * from order_detials where fld_order_id='$orderid'";
			$getStmt =$this->conn->prepare("select * from order_detials where fld_order_id='$orderid'");
		   	$getStmt->execute();
		   	$count = $getStmt->rowCount();
			if($count>0){
				return $getStmt->fetch();
			}
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
			        if($attribute['attr']!='Color'){
			            $varcombination .=$attribute['attr'].': '.$attribute['attrval']. " | ";	
			        }
			    }
				
			    return rtrim($varcombination," | ");
		}

		function getProductDetails($id){
			$getStmt = $this->conn->prepare("SELECT * FROM products 
											-- join products_variations on products.id=products_variations.product_id
											-- join products_gallery on products.id=products_gallery.product_id
											where products.id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $productDetail = $getStmt->fetchAll();
			
		}
		/**/
		function getBlogDetail($id){
			$getStmt = $this->conn->prepare("SELECT * FROM blogs where id='$id' ORDER BY name ASC ");
			$getStmt->execute();
			return $getStmt->fetch();
		}
		
		function updateOrder($orderid){
		    
		    
		   // die('ttt');
		    $stmt = $this->conn->prepare("UPDATE order_detials SET fld_payment_status='cancel' WHERE fld_order_id='$orderid'");
		    $excute=$stmt->execute();
		    $getStmt = $this->conn->prepare("SELECT * FROM order_detials where fld_order_id='$orderid'");
			$getStmt->execute();
			$row = $getStmt->fetch();
			$name=$row['fld_first_name'].' '.$row['fld_last_name'];
			$email=$row['fld_email_id'];
		   
		   
		        $email_subject = 'Order Canceled of AL-PASBAN';
    			$email_message = "<p>Hi $name,</p>
                                  <p>Your Order No. <a href='".SITE_URL."my-account.html'>#$orderid</a> has been canceled.we are regreting to not fulfill your order</p>
    							 
                                  <p>Thanks & Regards,</p>
                                  <p>AL-PASBAN Team</p>";
    			
    			$headers  = 'MIME-Version: 1.0' . "\r\n";
    			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    			$headers .= 'To: AL-PASBAN Login details <'.$email.'>' . "\r\n";
    			$headers .= 'From: "AL-PASBAN" <support@alpasban.com>' . "\r\n";
    		//	$headers .= 'Cc: '.$email_cc. "\r\n";
    		if($row['fld_payment_status']=='cancel'){
				$success = $this->send_mail($email, 'support@alpasban.com', $email_subject, $email_message,$headers);
    		}
		    return $excute;
		}
		function send_mail($to, $from, $subject='',$message='',$headers=''){
		   
		//	$ok = mail($to,$subject,$message,$headers);
			require('../../phpmailer/class.phpmailer.php');
			$mail = new PHPMailer(true);
			//print_r($mail);
			//die("ffff");
            try {
                $mail->isSMTP();
                //$mail->SMTPDebug = 2;
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
                
                //print_r($e);die("ffff");
                return false;
            } 
           // die("ffff");
			return true;
		}
                        
	}
	$SettingsData=new SettingsData();
	//print_r($SettingsData);
	//$getSettingsData=$SettingsData->getSettingsData('email');
	//print_r($getSettingsData);
	//die;
	//$pdo->close();

?>
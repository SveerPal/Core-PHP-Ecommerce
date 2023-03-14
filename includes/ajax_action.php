<?php
include_once '../admin/includes/conn.php';
include_once('../lib/function.php');

if(!empty($_POST["action"]))
{ 
$itemArray = array();

switch($_POST["action"]) {

	
	case "buy_detail":
		if(!empty($_POST["quantity"]))
		{
			$qnt = trim($_POST["quantity"]);
			$productByCodes =$FontEndData->getProductDetail($_POST["code"]);
			$buyprice=$productByCodes["regular_price"];
			$saleprice=$productByCodes["sale_price"];
			$product_type=$productByCodes["product_type"];
			$fld_slug = $productByCodes["slug"];
			if(isset($productByCodes["photo"]) && $productByCodes["photo"]!=''){
				$mg = $productByCodes["photo"];
			}else{
				$mg = 'not-found.jpg';
			}
			$itemArray[$productByCodes["id"]] = array('fld_title'=>$productByCodes["name"], 'code'=>$productByCodes["id"], 'productvariationId'=>'0','quantity'=>$qnt,'fld_price'=>$buyprice,'fld_sale_price'=>$saleprice,'fld_product_type'=>$product_type,'fld_slug'=>$fld_slug,'fld_img_path'=>$mg);
			
			if(!empty($_SESSION["cart_item"])) {
			    if(array_search($productByCodes["id"], array_column($_SESSION["cart_item"], 'code')) !== false) {
				    foreach($_SESSION["cart_item"] as $k => $v) {
							if($productByCodes["id"] == $v['code'])
							 $_SESSION["cart_item"][$k]["quantity"] += $qnt;
					}
				} else {
				   $_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
				}
			} else {
			    $_SESSION["cart_item"] = $itemArray;
			}
		}
	break;
	case "add_detail":
		if(!empty($_POST["quantity"]))
		{
			$qnt = trim($_POST["quantity"]);
			$productByCodes =$FontEndData->getProductDetail($_POST["code"]);
			$buyprice=$productByCodes["regular_price"];
			$saleprice=$productByCodes["sale_price"];
			$product_type=$productByCodes["product_type"];
			$fld_slug = $productByCodes["slug"];
			if(isset($productByCodes["photo"]) && $productByCodes["photo"]!=''){
				$mg = $productByCodes["photo"];
			}else{
				$mg = 'not-found.jpg';
			}
			$itemArray[$productByCodes["id"]] = array('fld_title'=>$productByCodes["name"], 'code'=>$productByCodes["id"], 'productvariationId'=>'0','quantity'=>$qnt,'fld_price'=>$buyprice,'fld_sale_price'=>$saleprice,'fld_product_type'=>$product_type,'fld_slug'=>$fld_slug,'fld_img_path'=>$mg);
			
			if(!empty($_SESSION["cart_item"])) {
			    if(array_search($productByCodes["id"], array_column($_SESSION["cart_item"], 'code')) !== false) {
				    foreach($_SESSION["cart_item"] as $k => $v) {
							if($productByCodes["id"] == $v['code'])
							 $_SESSION["cart_item"][$k]["quantity"] += $qnt;
					}
				} else {
				   $_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
				}
			} else {
			    $_SESSION["cart_item"] = $itemArray;
			}
		}
	break;
	case "var_buy_detail":
	    
		if(!empty($_POST["quantity"]) && !empty($_POST["productVariationId"]))
		{
		    $productId=$_POST['code'];
		    $productVariationId=$_POST['productVariationId'];
		    $quantity=$_POST['quantity'];
            $conn = $pdo->open();	
		    $productByCode =$conn->prepare("select t1.photo,t1.slug,t1.name, t1.id as productid, t1.sale_price, 
			t1.product_type, t1.stock, t2.* from products as t1 join 
			products_variations as t2 on t1.id=t2.product_id  
			where t1.id=$productId and t2.id=$productVariationId group by id");
			
			$productByCode->execute();
			$productByCodes=$productByCode->fetch();


			//Get Variation Name And Value 
			$variation_type=str_replace(",","','",$productByCodes["variation_type"]);
			$variation_value=str_replace(",","','",$productByCodes["variation_value"]);

			// $variation_type=explode(",",$productByCodes["variation_type"]);
			// $variation_value=explode(",",$productByCodes["variation_value"]);
			
			//print_r($variation_type);
			//print_r($variation_value);
			// echo "select t1.name, t2.name from products_attributes as t1 join 
			// products_attributes_values as t2 on t1.id=t2.products_attribute_id  
			// where t1.id in ('$variation_type') and t2.id in('$variation_value') group by id";
			$attributename =$conn->prepare("select t1.name as attr, t2.name as attrval from products_attributes as t1 join 
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
			
			$varcombination=rtrim($varcombination," | ");

			if($productByCodes["variation_photo"]){
				$proimage=$productByCodes["variation_photo"];
			}else{
				$proimage=$productByCodes["photo"];
			}
			
			if(isset($proimage) && $proimage!=''){
				$mg = $proimage;
			}else{
				$mg = 'not-found.jpg';
			}
			//print_r($productByCodes);die;
			$var_product_stock = !empty($productByCodes['variation_stock'])?$productByCodes['variation_stock']:0;
			$buyprice=$productByCodes["variation_regular_price"];
			$saleprice=$productByCodes["variation_sale_price"];
			$product_type=$productByCodes["product_type"];
			$fld_slug = $productByCodes["slug"];
			$fld_sub_title = '';
			$itemArray[$productByCodes["productid"]] = array(
								'fld_title'=>$productByCodes["name"],
								 'code'=>$productByCodes["productid"],
								 'productvariationId'=>$productByCodes["id"],
								 'productvariationName'=>$varcombination,
								  'quantity'=>$quantity,
								  'fld_price'=>$buyprice,
								  'fld_sale_price'=>$saleprice,
								  'fld_product_type'=>$product_type,
								  'fld_sub_title'=>$fld_sub_title,
								  'fld_slug'=>$fld_slug,
								  'fld_img_path'=>$mg);
			//print_r($itemArray);die;
			if(!empty($_SESSION["cart_item"])) {
			    if(array_search($productByCodes["productid"], array_column($_SESSION["cart_item"], 'code')) !== false && array_search($productByCodes["id"], array_column($_SESSION["cart_item"], 'productvariationId')) !== false) {
				    foreach($_SESSION["cart_item"] as $k => $v) {
							if($var_product_stock >= $_SESSION["cart_item"][$k]["quantity"]+$_POST["quantity"]){
							if(($productByCodes["productid"] == $v['code']) && ($productVariationId == $v['productvariationId']))
							 $_SESSION["cart_item"][$k]["quantity"] += $_POST["quantity"];
							}
					}
				} else {
					if($var_product_stock >= $quantity){
						$_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
					}
				}
			} else {
				if($var_product_stock >= $quantity){
					$_SESSION["cart_item"] = $itemArray;
				}
			}
		}else if(empty($_POST["productVariationId"])){
		    echo 'Please Select Variation';
		}
	break;
	case "var_add_detail":
	    
		if(!empty($_POST["quantity"]) && !empty($_POST["productVariationId"]))
		{
		    $productId=$_POST['code'];
		    $productVariationId=$_POST['productVariationId'];
		    $quantity=$_POST['quantity'];
            $conn = $pdo->open();
           
		    $productByCode =$conn->prepare("select t1.photo,t1.slug,t1.name, t1.id as productid, t1.sale_price, 
			t1.product_type,t1.stock, t2.* from products as t1 join 
			products_variations as t2 on t1.id=t2.product_id  
			where t1.id=$productId and t2.id=$productVariationId group by id");			
			$productByCode->execute();
			$productByCodes=$productByCode->fetch();

			//Get Variation Name And Value 
			$variation_type=str_replace(",","','",$productByCodes["variation_type"]);
			$variation_value=str_replace(",","','",$productByCodes["variation_value"]);

			// $variation_type=explode(",",$productByCodes["variation_type"]);
			// $variation_value=explode(",",$productByCodes["variation_value"]);
			
			//print_r($variation_type);
			//print_r($variation_value);
			// echo "select t1.name, t2.name from products_attributes as t1 join 
			// products_attributes_values as t2 on t1.id=t2.products_attribute_id  
			// where t1.id in ('$variation_type') and t2.id in('$variation_value') group by id";
			$attributename =$conn->prepare("select t1.name as attr, t2.name as attrval from products_attributes as t1 join 
			products_attributes_values as t2 on t1.id=t2.products_attribute_id  
			where t1.id in ('$variation_type') and t2.id in('$variation_value')");
			
			$attributename->execute();
			$attributename=$attributename->fetchAll();
			$varcombination="";
			foreach($attributename as $attribute){
			    //echo $attribute['attr'];
			    if($attribute['attr']!='Color'){
			        $varcombination .=$attribute['attr'].': '.$attribute['attrval']. " | ";	
			    }
							
			}
			
			$varcombination=rtrim($varcombination," | ");
			$var_product_stock = !empty($productByCodes['variation_stock'])?$productByCodes['variation_stock']:0; //$productByCodes["stock"]
			if($productByCodes["variation_photo"]){
				$proimage=$productByCodes["variation_photo"];
			}else{
				$proimage=$productByCodes["photo"];
			}
			if(isset($proimage) && $proimage!=''){
				$mg = $proimage;
			}else{
				$mg = 'not-found.jpg';
			}
			
			$buyprice=$productByCodes["variation_regular_price"];
			$saleprice=$productByCodes["variation_sale_price"];
			$product_type=$productByCodes["product_type"];
			$fld_slug = $productByCodes["slug"];
			$fld_sub_title = '';
			
			$itemArray[$productByCodes["productid"]] = array(
								'fld_title'=>$productByCodes["name"],
								 'code'=>$productByCodes["productid"],
								 'productvariationId'=>$productByCodes["id"],
								 'productvariationName'=>$varcombination,
								  'quantity'=>$quantity,
								  'fld_price'=>$buyprice,
								  'fld_sale_price'=>$saleprice,
								  'fld_product_type'=>$product_type,
								  'fld_sub_title'=>$fld_sub_title,
								  'fld_slug'=>$fld_slug,
								  'fld_img_path'=>$mg);
			
			if(!empty($_SESSION["cart_item"])) {
			    if(array_search($productByCodes["productid"], array_column($_SESSION["cart_item"], 'code')) !== false && array_search($productByCodes["id"], array_column($_SESSION["cart_item"], 'productvariationId')) !== false) {
				    foreach($_SESSION["cart_item"] as $k => $v) {
							if(($productByCodes["productid"] == $v['code']) && ($productVariationId == $v['productvariationId'])){
							if($var_product_stock >= $_SESSION["cart_item"][$k]["quantity"]+$_POST["quantity"]){
								$_SESSION["cart_item"][$k]["quantity"] += $_POST["quantity"];
							}else{
								echo 'nostock';
							}
							}
					}
				} else {
				   if($var_product_stock >= $quantity){
						$_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
				   }else{
					echo 'nostock';
					}
				}
			} else {
				if($var_product_stock >= $quantity){
					$_SESSION["cart_item"] = $itemArray;
				}else{
					echo 'nostock';
				}
			}
		}else if(empty($_POST["productVariationId"])){
		    echo 'Please Select Variation';
		}
	break;

	case "add":
		if(!empty($_POST["quantity"]))
		{
			$qnt = trim($_POST["quantity"]);
			$productByCodes =$FontEndData->getProductDetail($_POST["code"]);
			$buyprice=$productByCodes["regular_price"];
			$saleprice=$productByCodes["sale_price"];
			$product_type=$productByCodes["product_type"];
			$fld_slug = $productByCodes["slug"];
			if(isset($productByCodes["photo"]) && $productByCodes["photo"]!=''){
				$mg = $productByCodes["photo"];
			}else{
				$mg = 'not-found.jpg';
			}
			if($itemArray[$productByCodes["id"]]['quantity'] < $productByCodes['stock']){ 
			$itemArray[$productByCodes["id"]] = array('fld_title'=>$productByCodes["name"], 'code'=>$productByCodes["id"], 'productvariationId'=>'0','quantity'=>$qnt,'fld_price'=>$buyprice,'fld_sale_price'=>$saleprice,'fld_product_type'=>$product_type,'fld_slug'=>$fld_slug,'fld_img_path'=>$mg);
			
			if(!empty($_SESSION["cart_item"])) {
			    if(array_search($productByCodes["id"], array_column($_SESSION["cart_item"], 'code')) !== false) {
				    foreach($_SESSION["cart_item"] as $k => $v) {
							if($productByCodes["id"] == $v['code'])
							 $_SESSION["cart_item"][$k]["quantity"] += $qnt;
					}
				} else {
				   $_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
				}
			} else {
			    $_SESSION["cart_item"] = $itemArray;
			}
			}
		}
	break;
	case "remove":
	 	$item_id = $_POST['code'];
	 	$variationId = $_POST['variationId'];
	
			if (!empty($_SESSION["cart_item"])) {
				foreach ($_SESSION["cart_item"] as $select => $val) {
					if($val["code"] == $item_id && $val["productvariationId"] == $variationId)
					{   
						unset($_SESSION["cart_item"][$select]);
					}
				}
			}
			if(empty($_SESSION["cart_item"])){
						unset($_SESSION["cart_item"]);
						unset($_SESSION['coupon']);
			}
			//die("Dddd");
	break;
	case "comments":
		$_SESSION["comments"] = addslashes(trim($_POST['code'])) ;
	break;
	case "update":
		$item_id = $_POST['code'];
		$variationId = $_POST['productVariationId'];
		$item_array = array();
		if (!empty($_SESSION["cart_item"])) {
			$k = array();
			foreach ($_SESSION["cart_item"] as $select => $val) {
				if($val["code"] == $item_id && $val["productvariationId"] == $variationId)
				{
					$k[] = $select;
					$_SESSION["cart_item"][$select]['quantity'] = $_POST["quantity"];
				}
			}
		}
		if(count($k) > 1){
			$up_k = array_pop($k);
			foreach($k as $kval ){
				unset($_SESSION["cart_item"][$kval]);
			}
		}	
	break;
	case "empty":
		unset($_SESSION["cart_item"]);
	break;		
}
}
die();
?>
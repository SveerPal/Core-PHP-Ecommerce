<?php
include_once '../admin/includes/conn.php';
include_once('../lib/function.php');
if(!empty($_POST["productData"]))
{ 
	$alldata = $_POST['productData'];
	
	if(!empty($_SESSION["cart_item"])) {
		foreach($alldata as $key=>$value){
		    
		   
		    $newkey = $value['prod_id'];
		    $newvarkey = $value['var_id'];
		    
			if((array_search($newkey, array_column($_SESSION["cart_item"], 'code')) !== false) AND (array_search($newvarkey, array_column($_SESSION["cart_item"], 'productvariationId')) !== false)) {
				foreach($_SESSION["cart_item"] as $k => $v) {
						if($newkey == $v['code'] AND $newvarkey == $v['productvariationId']){
							print_r($newkey);
							$productId=$v['code'];
							$productVariationId=$v['productvariationId'];
							$conn = $pdo->open();
							$productByCode =$conn->prepare("select t1.photo,t1.slug,t1.name, t1.id as productid, t1.sale_price, 
							t1.product_type,t1.stock, t2.* from products as t1 join 
							products_variations as t2 on t1.id=t2.product_id  
							where t1.id=$productId and t2.id=$productVariationId group by id");			
							$productByCode->execute();
							$productByCodes=$productByCode->fetch();
							//print_r($productByCodes);
							$var_product_stock = !empty($productByCodes['variation_stock'])?$productByCodes['variation_stock']:0; //$productByCodes["stock"]
							if($var_product_stock >= $value['qnt']){
								$_SESSION["cart_item"][$k]["quantity"] = $value['qnt'];
							}else{
								echo 'nostock';
							}
						}
				}
			}
		}
	}
}
die();
?>
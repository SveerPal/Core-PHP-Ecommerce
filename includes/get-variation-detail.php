<?php 
include_once('../lib/function.php');
//print_r($_POST['variation_value']);
$var_size_id=implode(",",$_POST['variation_value']);
//echo $var_size_id;

$products=$FontEndData->getProductDetailVariationAttribute($_POST['product_id']);
//print_r($products);
if($products){
    foreach($products as $product){
        $varproductvalue=explode(",",$product['variation_value']);
        //print_r($varproductvalue);
        if (in_array($var_size_id, $varproductvalue))
          {
			$qty = 0;
			$stock = 0;
			$variation_id = $product['id'];
			$product_id = $product['product_id'];
			$variation_stock = isset($product['variation_stock'])?$product['variation_stock']:0;
			if(isset($_SESSION["cart_item"])){
			foreach($_SESSION["cart_item"] as $k => $v) {
				if($product_id == $v['code'] && $variation_id == $v['productvariationId']){
					$qty = $v["quantity"];
				}
			}
			
			if($variation_stock <= $qty){
				$stock = $variation_stock;
			}
			}
			echo json_encode(array('sts'=>1,'data'=>$product,'stock'=>$stock));
            exit;
          }

        /*if( $varproductvalue, $_POST['variation_value'] ){
            echo json_encode(array('sts'=>1,'data'=>$product));
            exit;
        }*/
           // echo json_encode(array('sts'=>1,'data'=>$product,'variation'=>$varproductvalue));
           // exit;
        
    }
    //print_r($varproductvalue);
    //die('Test');
    echo json_encode(array('sts'=>0));
}else{
    echo json_encode(array('sts'=>0));
}
//print_r($product);
die;    

?>
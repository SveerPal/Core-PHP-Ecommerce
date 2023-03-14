<?php 
	include '../session.php';
	include '../function.php';

	if(isset($_POST['id'])){
		$orderid = $_POST['id'];
		$discount_amount = $_POST['discount_amount'];
		$conn = $pdo->open();
		 ?>
<div class="order-detail orderno<?php echo $orderid;?>">
        <?php 
        $sub_total=0;
        $items_name=0;
        $orderproductdetails=$SettingsData->orderDetailProduct($orderid);
        if($orderproductdetails){
            foreach($orderproductdetails as $orderproductdetail){
                $productvar_name='';
                if($orderproductdetail['fld_product_variation_id'] > 0){
                    $productvar_name=$SettingsData->getProductVariationAttributeValue($orderproductdetail['fld_product_id'],$orderproductdetail['fld_product_variation_id']);
                
                }
               $sub_total += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
               // $sub_total += (int)$orderproductdetail['fld_amount'];
                $items_name .= $orderproductdetail['fld_product_name'].' '.$productvar_name.' (QNT-'.$orderproductdetail["fld_quantity"].')';
                $productDetails=$SettingsData->getProductDetail($orderproductdetail['fld_product_id']);
               //print_r($productDetails);
        	?>
                <div class="first-row">
                    <div class="cart__thumbnail">
                        <a href="<?php echo SITE_URL?>product/<?php echo $productDetails[0]['slug'] ?>.html">
                            <img class="border-radius-5" style="width:50px; height:60px" src="<?php echo UPLOADS ?>products/<?php echo $productDetails[0]['photo'] ?>" alt="<?php echo $orderproductdetail['fld_product_name']; ?>">
                        </a>
                    </div>
                    <div class="cart-content">
                        <h4 class="cart__content--title">  
                            <a href="<?php echo SITE_URL?>product/<?php echo $productDetails[0]['slug'] ?>.html"><?php echo $orderproductdetail['fld_product_name']; ?></a>
                        </h4>
                        <span class="cart__content--variant"><?php echo $productvar_name; ?></span>
                        <span class="in__stock text__secondary">Qty: <?php echo $orderproductdetail['fld_quantity']; ?></span>
                    </div>
                    <div class="sub-total text-center">
                        <span class="cart__price"><?php echo CURRENCY.number_format((float)$orderproductdetail['fld_amount'], 2, '.', ''); ?></span>
                    </div>
                </div>
	        <?php } }
	        /* $getorderlist['discount_code'];*/
	         $discount_amount= $discount_amount;
	         $vat=0;
	          //  echo $discount_amount = ($sub_total*$['discount_amount'])/100;
	            $total_amount =  (($sub_total+$vat)-$discount_amount);
	            $amount = (int) $total_amount;
	        ?>
	        <div class="second-row">
              <span class="in__stock text__secondary">Sub Total: <?php echo CURRENCY.number_format((float)$sub_total, 2, '.', ''); ?></span>
                  <?php if($discount_amount){ ?>
              <span class="cart__price">Coupon: Applied: <?php echo CURRENCY.' - '.number_format((float)$discount_amount, 2, '.', ''); ?></span>
               <?php } ?>
               <span class="in__stock text__secondary text-center">Total: <?php echo CURRENCY.number_format((float)$amount, 2, '.', ''); ?></span>
            </div>	
    </div>		
	
<?php } ?>

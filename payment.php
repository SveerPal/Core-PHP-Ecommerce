
<?php 
require('razorpay-php/Razorpay.php');
use Razorpay\Api\Api;
?>
<main class="main__content_wrapper">
        

    <?php 
    if(isset($_SESSION["cart_item"])){ 
    ?>
    <section id="payment-page">
        <div class="container">
            <div class="track-orderss">
                <div class="cart-section">
                    <a href="<?php echo SITE_URL; ?>cart.html"><i class="far fa-shopping-cart"></i> <span>Cart</span></a>
                </div>
                <div class="ship-section">
                    <a href="<?php echo SITE_URL; ?>checkout.html"><i class="far fa-shipping-fast"></i> <span>Shipping</span></a>
                </div>
                <div class="payment-section">
                    <a href="javascript:void(0)"><i class="far fa-money-bill-wave"></i> <span>Payment</span></a>
                </div>
                <div class="confirm-section">
                    <a href="javascript:void(0)"><i class="far fa-box-check"></i> </a>
                    <span>Confirmation</span>
                </div>
            </div>
        </div>
    </section>
    <div class="checkout__page--area">
        <div class="container">
            
            <div class="checkout__page--inner d-flex">
                <div class="main checkout__mian">
                    <main class="main__content_wrapper" id="checkout-form">
                    <?php 
                     
                        $order_no = rand(100000,999999);
                        $sub_total = $discount_amount = 0;
                        $items_name = $promo_code = '';
                        foreach ($_SESSION["cart_item"] as $key => $item) { 
                            $productvariationId = isset($item['productvariationId'])?$item['productvariationId']:0;
                            $productvar_name='';
                            if($productvariationId > 0){
                                $productvar_name=$FontEndData->getProductVariationAttributeValue($item['code'],$productvariationId);
                            
                            }
                            if($item['fld_sale_price'] > 0){
                			//	$sellPrice = '<span class="current__price">'.CURRENCY.$item["fld_sale_price"].'</span>';
                				$sub_total += ($item['quantity']*$item['fld_sale_price']);
                			}else{
                			    //$sellPrice='<span class="current__price">'.CURRENCY.number_format((float) $item['fld_price'], 2, '.', '' ).'</span>';
                			    $sub_total += ($item['quantity']*$item['fld_price']);
                			}
                            //$sub_total += ($item['quantity']*$item['fld_price']);
                            $items_name .= $item['fld_title'].$productvar_name.' (QNT-'.$item["quantity"].')';
                        }
                        if(isset($_SESSION['coupon']) && $_SESSION['coupon']['discount_amount'] !=''){
                            if(isset($_SESSION['coupon']['discount_type']) && $_SESSION['coupon']['discount_type'] == 'flat'){
                                $discount_amount = $_SESSION['coupon']['discount_amount'];
                            }else{
                                $discount_amount = ($sub_total*$_SESSION['coupon']['discount_amount'])/100;
                            }
                            $promo_code = $_SESSION['coupon']['code'];
                        }
                        $vat=0;
                        $vat = ceil(($sub_total*GST)/100);
                        $total_amount =  (($sub_total)-$discount_amount);
                        $amount = (int) $total_amount;

                        
                        
                        //User Insert and Check
                        $firstname = isset($_POST['firstname'])?$_POST['firstname']:'';
                        $lastname = isset($_POST['lastname'])?$_POST['lastname']:'';
                        $username = isset($_POST['username'])?$_POST['username']:'';
                        $email = isset($_POST['email'])?$_POST['email']:'';
                        $phone = isset($_POST['phone'])?$_POST['phone']:'';
                        $address = isset($_POST['address'])?$_POST['address']:'';
                        $address2 = isset($_POST['address2'])?$_POST['address2']:'';
                        $city = isset($_POST['city'])?$_POST['city']:'';
                        $state = isset($_POST['state'])?$_POST['state']:'';
                        $zip = isset($_POST['zip'])?$_POST['zip']:'';
                        $country = isset($_POST['country'])?$_POST['country']:'';
                        $company = isset($_POST['company'])?$_POST['company']:'';
                        $is_shipping_same = isset($_POST['is_shipping_same'])?$_POST['is_shipping_same']:'';
                        $is_save_info = isset($_POST['is_save_info'])?$_POST['is_save_info']:'';
                        if($is_shipping_same==1){
                            $shipping_firstname = $firstname;
                            $shipping_lastname = $lastname;
                            $shipping_email = $email;
                            $shipping_phone = $phone;
                            $shipping_address = $address;
                            $shipping_address2 = $address2;
                            $shipping_city = $city;
                            $shipping_state = $state;
                            $shipping_zip = $zip;
                            $shipping_country = $country;
                            $shipping_company = $company;
                        }else{
                            $shipping_firstname = isset($_POST['shipping_firstname'])?$_POST['shipping_firstname']:'';
                            $shipping_lastname = isset($_POST['shipping_lastname'])?$_POST['shipping_lastname']:'';
                            $shipping_email = isset($_POST['shipping_email'])?$_POST['shipping_email']:'';
                            $shipping_phone = isset($_POST['shipping_phone'])?$_POST['shipping_phone']:'';
                            $shipping_address = isset($_POST['shipping_address'])?$_POST['shipping_address']:'';
                            $shipping_address2 = isset($_POST['shipping_address2'])?$_POST['shipping_address2']:'';
                            $shipping_city = isset($_POST['shipping_city'])?$_POST['shipping_city']:'';
                            $shipping_state = isset($_POST['shipping_state'])?$_POST['shipping_state']:'';
                            $shipping_zip = isset($_POST['shipping_zip'])?$_POST['shipping_zip']:'';
                            $shipping_country = isset($_POST['shipping_country'])?$_POST['shipping_country']:'';
                            $shipping_company = isset($_POST['shipping_company'])?$_POST['shipping_company']:'';
                        }

                        $userDetail=$FontEndData->getCustomerCheck($email);

                        $data['company']=$_POST['company'];               
                        $data['firstname']=$_POST['firstname'];
                        $data['lastname']=$_POST['lastname'];
                        $data['username']=$_POST['email'];
                        $data['email']=$_POST['email'];
                        $data['phone']=$_POST['phone'];
                        $data['address']=$_POST['address'];
                        $data['address2']=$_POST['address2'];
                        $data['city']=$_POST['city'];
                        $data['zip']=$_POST['zip'];
                        $data['country']=$_POST['country'];
                        $data['is_shipping_same']=$_POST['is_shipping_same'];
                        $data['is_save_info']=$is_save_info;
                        $data['shipping_firstname']=$shipping_firstname;
                        $data['shipping_lastname']=$shipping_lastname;
                        $data['shipping_email']=$shipping_email;
                        $data['shipping_phone']=$shipping_phone;
                        $data['shipping_address']=$shipping_address;
                        $data['shipping_address2']=$shipping_address2;
                        $data['shipping_city']=$shipping_city;
                        $data['shipping_zip']=$shipping_zip;
                        $data['shipping_country']=$shipping_country;
                        $data['shipping_company']=$shipping_company;
                        if(!$userDetail){    
                            $userInsert=$FontEndData->getCustomerInsert($data);
                        }
                        if($_SESSION['userid']!=''){
                            $data['userid']=$_SESSION['userid'];
                            $userInsert=$FontEndData->getCustomerAddressInsert($data);
                        }
                        $paymentDate = date("Y-m-d H:i:s"); 
                        $uID = isset($_SESSION['userid'])?$_SESSION['userid']:'';
                        //Order Create
                        

                        $orderDetail=array('fld_transaction_id'=>'',
                                            'fld_order_id'=>$order_no,
                                            'fld_user_id'=>$uID,
                                            'fld_payment_type'=>'',
                                            'fld_currency'=>'INR',
                                            'fld_amount'=>($amount),
                                            'fld_first_name'=>$firstname,
                                            'fld_last_name'=>$lastname,
                                            'fld_email_id'=>$email,
                                            'fld_phone_no'=>$phone,
                                            'fld_address'=>$address,
                                            'fld_address2'=>$address2,
                                            'fld_city'=>$city,
                                            'fld_state'=>$state,
                                            'fld_zip_code'=>$zip,
                                            'fld_country'=>$country,
                                            'fld_shipping_first_name'=>$shipping_firstname,
                                            'fld_shipping_last_name'=>$shipping_lastname,
                                            'fld_shipping_email_id'=>$shipping_email,
                                            'fld_shipping_phone_no'=>$shipping_phone,
                                            'fld_shipping_address'=>$shipping_address,
                                            'fld_shipping_address2'=>$shipping_address2,
                                            'fld_shipping_city'=>$shipping_city,
                                            'fld_shipping_state'=>$shipping_state,
                                            'fld_shipping_zip_code'=>$shipping_zip,
                                            'fld_shipping_country'=>$shipping_country,
                                            'fld_status'=>'active',
                                            //'fld_comments'=>'New Order',
                                            'fld_payment_status'=>'Pending',
                                            'fld_payment_date'=>$paymentDate,
                                            'discount_code'=>$promo_code,
                                            'discount_amount'=>$discount_amount,
                                            'fld_upload_date'=>$paymentDate,
                                            'fld_modified_date'=>$paymentDate
                                        );

                        $createOrder=$FontEndData->createOrder($orderDetail);

                        foreach ($_SESSION["cart_item"] as $key => $item) { 
                            $productvariationId = isset($item['productvariationId'])?$item['productvariationId']:0;
                            if($productvariationId > 0){
                                $productvar_name = '';
                                $productvar_name=$FontEndData->getProductVariationAttributeValue($item['code'],$productvariationId);
                               
                            }
                            
                            $field_product_value = array(
                                'fld_order_id'=>$order_no,
                                'fld_product_id'=>$item['code'],
                                'fld_product_name'=>$item['fld_title'],' '.$productvar_name,
                                'fld_quantity'=>$item["quantity"],
                                'fld_product_variation_id'=>$productvariationId,
                                'fld_amount'=>$item['fld_price'],
                                'fld_sale_price'=>$item['fld_sale_price'],
                                'fld_sub_title'=>'',
                                'fld_product_type'=>$item['fld_product_type'],
                                'fld_img_path'=>$item['fld_img_path'],
                                'fld_upload_date'=>$paymentDate
                            );
                            //print_r($field_product_value);
                            $result[] = $FontEndData->createOrderHistory($field_product_value,'','order_history');
                            
                            
                        }
                       // print_r($result);
                        $_SESSION['fld_order_id'] = $order_no;
                    ?>      
                    

                    <?php 
                        
                        $getOrderDetails= $FontEndData->getOrderDetail($order_no);
                    ?>
                    <div class="customer__information--area border-radius-5">
                        <h3 class="customer__information--title h4">Customer Information</h3>
                        <div class="customer__information--inner d-flex">
                            <div class="customer__information--list">
                                <div class="customer__information--step">
                                    <h4 class="customer__information--subtitle h5">Contact information</h4>
                                    <ul>
                                        <li>
                                            <a class="customer__information--text__link" href="mailto:<?php echo $_SESSION['useremail'];?>">
                                            <?php echo $_SESSION['useremail'];?>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="customer__information--step">
                                    <h4 class="customer__information--subtitle h5">Billing Address</h4>
                                    <ul>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_first_name'].' '.$getOrderDetails['fld_last_name'];?>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_address'];?>
                                                <?php if($getOrderDetails['fld_address2']){ ?>, 
                                                <?php echo $getOrderDetails['fld_address2'];?>
                                                <?php } ?>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_city'];?> <?php echo $getOrderDetails['fld_zip_code'];?>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_country'];?>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="customer__information--list">
                                <div class="customer__information--step">
                                    <h4 class="customer__information--subtitle h5">&nbsp;</h4>
                                    <ul>
                                        <li>
                                            <a class="customer__information--text__link">&nbsp;
                                            
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="customer__information--step">
                                    <h4 class="customer__information--subtitle h5">Shipping Address</h4>
                                    <ul>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_shipping_first_name'].' '.$getOrderDetails['fld_shipping_last_name'];?>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_shipping_address'];?>
                                                <?php if($getOrderDetails['fld_shipping_address2']){ ?>, 
                                                <?php echo $getOrderDetails['fld_shipping_address2'];?>
                                                <?php } ?>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_shipping_city'];?> <?php echo $getOrderDetails['fld_shipping_zip_code'];?>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="customer__information--text">
                                                <?php echo $getOrderDetails['fld_shipping_country'];?>
                                            </span>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </main>
                </div>
                    <?php include('lib/templates/checkout-subtotal.php');
                ?>
            </div>
            <div>
                <style>
                .paysec span {
                  padding-right: 25px;
                }
                .paysec button {
                  width: 56%;
                }
                </style>
                
                
                <div class="paysec">
                    <label for="cod">  <input type="radio" name="fld_payment_type" value="cod" id="cod"> Cash On Delivery</label>
                    <label for="online"> <input type="radio" name="fld_payment_type" value="online"  id="online" > Online</label>
                    <span class="mt-2" id="payment_type_msg"></span>
                <br/>
                
                <button type="button" id="paynowbtn" class="continue__shipping--btn primary__btn border-radius-5 paynowbtn mt-4">Pay Now</button>
                </div>
                <?php //require("razorpay-php/checkout/manual.php"); ?>
            </div>
        </div>
    </div>
    <?php 
    }else{ ?>
    <main class="main__content_wrapper">
        <div class="checkout__page--area">
        <div class="container">
            <div class="checkout__page--inner d-flex">
                <div class="main checkout__mian w-100">
                <main class="main__content_wrapper" id="checkout-form w-100 mb-5">
                    <div class="checkout__content--step__footer d-flex align-items-center">
                        <a class="continue__shipping--btn primary__btn border-radius-5 mb-5" href="<?php echo SITE_URL; ?>shop.html">Return To Shop</a>
                    </div>
                </main>
                </div>
            </div>
            </div>
        </div>
        </div>                          
    </main>
    <?php }  ?>
</main>  
<button id="rzp-button1" class="continue__shipping--btn primary__btn border-radius-5 d-none">Pay Now</button>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<form name='razorpayform' action="order-success.html" method="POST">
    <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
    <input type="hidden" name="razorpay_signature"  id="razorpay_signature" >
</form>
<script>
 

    document.getElementById('paynowbtn').onclick = function(e){
        if(document.getElementById('cod').checked) {
            console.log('cod');
            <?php $_SESSION['fld_payment_type'] = 'COD'; ?>
            <?php $_SESSION['razorpay_order_id'] = ''; ?>
            location.href="<?php echo SITE_URL;?>order-success.html";
        }else if(document.getElementById('online').checked) {
            jQuery('#paynowbtn').attr('disabled');
            var createOrderrr="<?php echo $createOrder; ?>";
            var resulttt="<?php echo implode(" ",$result); ?>";
            var amount="<?php echo $amount; ?>";
            var name="<?php echo $_POST['firstname'].' '.$_POST['lastname']; ?>";
            var address="<?php echo $_POST['address']; ?>";
            var email="<?php echo $_POST['email']; ?>";
            var phone="<?php echo $_POST['phone']; ?>";
            var items_name="<?php echo $items_name; ?>";

            jQuery.ajax({
            	url: "<?php echo SITE_URL;?>razorpay-php/checkout/manual.php",
            	data:{createOrder:createOrderrr,result:resulttt,amount:amount,name:name,address:address,email:email,phone:phone,items_name:items_name},
            	type: "POST",
            	dataType: "json",
            	success:function(data){
            	    jQuery('#paynowbtn').removeAttr('disabled');
            		//console.log(data)
            		paynow(data);
            		
            	}
        	});
            
            
        }else{
            document.getElementById('payment_type_msg').innerHTML='<div class="alert alert-danger col-md-12" role="alert">Please select Payment Type</div>';
        }
        setTimeout(function(){
            document.getElementById('payment_type_msg').innerHTML='';
        },3000);
    }
    
function paynow(data){
    //console.log(data);
    var options = data;
    options.handler = function (response){
        
        document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
        document.getElementById('razorpay_signature').value = response.razorpay_signature;
        document.razorpayform.submit();
    };
   // console.log(options);
    options.theme.image_padding = false;
    options.modal = {
        ondismiss: function() {
            console.log("This code runs when the popup is closed");
        },
        escape: true,
        backdropclose: false
    };
    var rzp = new Razorpay(options);
    //console.log(rzp);
   // jQuery('#rzp-button1').trigger('click');
    
    //document.getElementById('rzp-button1').onclick = function(e){
        rzp.open();
        e.preventDefault();
    //}
    
}    
</script>
        
    
 

   
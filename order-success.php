<?php
include_once 'admin/includes/conn.php';
include_once('phpmailer/class.phpmailer.php');
include_once('lib/function.php');

//$keyId = 'rzp_test_kWPS7KqYlX21H7';
//$keySecret = 'AH6pBvWfumG36zYZFzAbT8lP';

$keyId = 'rzp_live_aWpKNIWVgb8kDL';
$keySecret = '10u9FaPYwDPIidFbcIwGCu3U';
$displayCurrency = 'INR';
error_reporting(E_ALL);
ini_set('display_errors', 1);
require('razorpay-php/Razorpay.php');
use Razorpay\Api\Api;
use Razorpay\Api\Errors\SignatureVerificationError;


if(isset($_SESSION['fld_payment_type']) && isset($_SESSION['fld_order_id']) && $_SESSION['fld_payment_type'] !='' &&  $_SESSION["fld_order_id"]!=""){


?>
    <main class="main__content_wrapper">
            
            <section id="payment-page">
                <div class="container">
                    <div class="track-orderss">
                        <div class="cart-section">
                           <a href="javascript:void(0)"><i class="far fa-shopping-cart"></i> <span>Cart</span></a>
                        </div>
                        <div class="ship-section">
                            <a href="javascript:void(0)"><i class="far fa-shipping-fast"></i> <span>Shipping</span></a>
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
            
        
        <!-- Start checkout page area -->
        <div class="checkout__page--area">
            <div class="container">
                <div class="checkout__page--inner d-flex">
                    <div class="main checkout__mian w-100">
                        <main class="main__content_wrapper">


                            <?php 
                            $razorpay_payment_id=$razorpay_order_id="";
                            $success = true;

                            $error = "Payment Failed";
                            $fld_payment_type=$_SESSION['fld_payment_type'] ;
                            if (empty($_POST['razorpay_payment_id']) === false)
                            {
                                $api = new Api($keyId, $keySecret);

                                try
                                {
                                    // Please note that the razorpay order ID must
                                    // come from a trusted source (session here, but
                                    // could be database or something else)
                                    $attributes = array(
                                        'razorpay_order_id' => $_SESSION['razorpay_order_id'],
                                        'razorpay_payment_id' => $_POST['razorpay_payment_id'],
                                        'razorpay_signature' => $_POST['razorpay_signature']
                                    );

                                    $api->utility->verifyPaymentSignature($attributes);
                                }
                                catch(SignatureVerificationError $e)
                                {
                                    $success = false;
                                    $error = 'Razorpay Error : ' . $e->getMessage();
                                }
                            }

                            if ($success === true || $fld_payment_type=='COD')
                            {
                                $html = '<div class="order__confirmed--area border-radius-5 mb-15">
                                            <h3 class="order__confirmed--title h4">Your order is confirmed</h3>
                                            <p class="order__confirmed--desc">You,ll receive a confirmation email with your order number shortly</p>
                                        </div>';
                            }
                            else
                            {
                                $html = ' <div class="order__confirmed--area border-radius-5 mb-15">
                                            <h3 class="order__confirmed--title h4">Your Order is Cancel</h3>
                                            <p class="order__confirmed--desc">'.$error.'</p>
                                        </div>';
                            }
                            
                            $fld_order_id=$_SESSION['fld_order_id'];
                            $userid=$_SESSION['userid'];
                            $razorpay_payment_id=isset($_POST['razorpay_payment_id'])?$_POST['razorpay_payment_id']:'';
                            if($fld_payment_type=='Online' && $razorpay_payment_id!=''){
                                $razorpay_order_id=$_SESSION['razorpay_order_id'];
                                if ($success === true){
                                    $updateorder=$FontEndData->UpdateOrder($fld_order_id,$userid,$razorpay_payment_id,$razorpay_order_id,'confirmed',$fld_payment_type);
                                }else{
                                    $updateorder=$FontEndData->UpdateOrder($fld_order_id,$userid,$razorpay_payment_id,$razorpay_order_id,'failed',$fld_payment_type);
                                }
                            }else{
                                $updateorder=$FontEndData->UpdateOrder($fld_order_id,$userid,$razorpay_payment_id,$razorpay_order_id,'confirmed',$fld_payment_type);
                                
                            }
                            //print_r($_SESSION);
                            //die('sss');
                            //$shippingAddress= $FontEndData->getAddress($userid,'shipping');
                            //$billingAddress= $FontEndData->getAddress($userid,'billing');
                            $getOrderDetailsHitory= $FontEndData->getOrderDetailHistory($fld_order_id);
                            $getOrderDetails= $FontEndData->getOrderDetail($fld_order_id);
                            

                            $sub_total = $discount_amount = 0;
                            $items_name = $promo_code =$mail_order_details= '';
                            $itemcat=$gtmitem="";
                            $gaItemIndex=0;
                            foreach ($_SESSION["cart_item"] as $key => $item) { 
                                $productvariationId = isset($item['productvariationId'])?$item['productvariationId']:0;
                                $productvar_name='';
                                // if($productvariationId > 0){
                                //     $productvar_name=$FontEndData->getProductVariationAttributeValue($item['code'],$productvariationId);
                                
                                // }
                                if($productvariationId > 0){
                                    $productvar_name=$FontEndData->getProductVariationAttributeValue($item['code'],$productvariationId);
                                    $product_code_sku=$FontEndData->getProductVaritaionCodeSku($item['code'],$productvariationId);
                                
                                }else{
                                    $product_code_sku=$FontEndData->getProductCodeSku($item['code']);
                                }
                                if($item['fld_sale_price'] > 0){
                    			//	$sellPrice = '<span class="current__price">'.CURRENCY.$item["fld_sale_price"].'</span>';
                    				$sub_total += ($item['quantity']*$item['fld_sale_price']);
                    				$item_price=$item['fld_sale_price'];
                    			}else{
                    			    //$sellPrice='<span class="current__price">'.CURRENCY.number_format((float) $item['fld_price'], 2, '.', '' ).'</span>';
                    			    $sub_total += ($item['quantity']*$item['fld_price']);
                    			    $item_price=$item['fld_price'];
                    			}
                                //$sub_total += ($item['quantity']*$item['fld_price']);
                                $items_name .= $item['fld_title'].' '.$productvar_name.' (QNT-'.$item["quantity"].')';
                                $mail_order_details .= '<tr><td style="border:1px solid #ccc;">'.$item['fld_title'].$productvar_name.'</td><td style="border:1px solid #ccc;text-align:center;">'.$item["quantity"].'</td>
                                <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' '.number_format((float)$item_price, 2, '.', '').'</td></tr>';
                                
                                
                                $shiprocketitem['name']= $item['fld_title'] ." ".$productvar_name;
                                $shiprocketitem['units']= $item['quantity'] ;
                                $shiprocketitem['sku']= $product_code_sku['sku'] .' || '.$product_code_sku['product_code'];
                                $shiprocketitem['selling_price']= $item_price ;
                                $shiprocketitem['discount']= "" ;
                                $shiprocketitem['tax']= "" ;
                                $shiprocketitem['hsn']= "" ;
                                   
                                $shiprocketproduct[]= $shiprocketitem;
                                
                                
                                //GTM Code Start
                                $getProCatForGoogleTag=$FontEndData->getProductCategoryForGoogleTag($item['code']);
                                
                                if($getProCatForGoogleTag){
                                    $ic=1;
                                    foreach($getProCatForGoogleTag as $prcatggl){
                                        if($ic==1){
                                            $itemcat.='item_category: "'.$prcatggl['name'].'",';
                                        }else{
                                            $itemcat.='item_category'.$ic.': "'.$prcatggl['name'].'",';
                                        }
                                        $ic++;
                                    }
                                    //$itemcat=rtrim($itemcat,',');
                                }
                                

                                $gtmitem.='{
                                    item_id: "'.$product_code_sku['sku'] .' || '.$product_code_sku['product_code'].'",
                                    item_name: "'. $item['fld_title'].'",
                                    affiliation: "",
                                    coupon: "",
                                    discount: 0,
                                    index: '.$gaItemIndex.',
                                    item_brand: "Al-Pasban",
                                    '.$itemcat.'
                                    item_variant: "'.$productvar_name.'",
                                    location_id: "",
                                    price: '.number_format((float)$item_price, 2, '.', '').',
                                    quantity: '.(int)$item['quantity'].'
                                },';
                                //GTM Code End
                                $gaItemIndex++;
                                
                            }
                            
                            $gtmitem=rtrim($gtmitem,',');
                            
                            $shiprocketproductlist=json_encode($shiprocketproduct);
                            
                            
                            $order_details =$mail_order_details ;
                            if(isset($_SESSION['coupon']) && $_SESSION['coupon']['discount_amount'] !=''){
                                if(isset($_SESSION['coupon']['discount_type']) && $_SESSION['coupon']['discount_type'] == 'flat'){
                                    $discount_amount = $_SESSION['coupon']['discount_amount'];
                                }else{
                                    $discount_amount = ($sub_total*$_SESSION['coupon']['discount_amount'])/100;
                                }
                                $promo_code = $_SESSION['coupon']['code'];
                            }
                            $vat=0;
                            $vat = ($sub_total*GST)/100;
                            $total_amount =  (($sub_total)-$discount_amount);
                            $amount = (int) $total_amount;

                            ?>
                            <script>
                            gtag("event", "purchase", {
                                transaction_id: "<?php echo $fld_order_id?>",
                                value: "<?php echo number_format((float)$amount, 2, '.', '');?>",
                                tax: "<?php echo number_format((float)$vat, 2, '.', '')?>",
                                shipping: 0,
                                currency: "INR",
                                coupon: "<?php echo $promo_code?>",
                                items: [
                                    <?php echo $gtmitem?>
                                    
                                ]

                            });
                            </script>

                            <?php
                           // die('www');
                            if($promo_code !=''){
                                $mail_order_details .= '<tr><td style="border:1px solid #ccc;text-align:right;"></td><td style="border:1px solid #ccc;text-align:right;">Discount (Promo Code: '.$promo_code.')</td>
                            <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' -'.number_format((float)$discount_amount, 2, '.', '').'</td></tr>';
                            }
                            $mail_order_details .= '<tr><td style="border:1px solid #ccc;text-align:right;"></td><td style="border:1px solid #ccc;text-align:right;">Sub Total</td>
                             <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' '.number_format((float)$sub_total-$vat, 2, '.', '').'</td></tr>';
                             $mail_order_details .= '<tr><td style="border:1px solid #ccc;text-align:right;"></td><td style="border:1px solid #ccc;text-align:right;">GST ('.GST.'%)</td>
                             <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' '.number_format((float)$vat, 2, '.', '').'</td></tr>';
                            
                            $email_subject = 'New Customer Order';
                            $admin_email_message = '<div style="font-family:Arial, Helvetica, sans-serif; padding:15px;width:70%;">
                            <div style="font-family:Arial, Helvetica, sans-serif; padding:15px; width:90%;">
                            <p>Hi Admin,</p>
                            <p>You have received an order from '.$getOrderDetails["fld_first_name"].' '.$getOrderDetails["fld_last_name"].' The order is as follows:</p>
                            <p><strong>ORD# '.$fld_order_id.' ('.$getOrderDetails['fld_payment_date'].')</strong></p>
            
                            <table cellpadding="10" width="90%"  cellspacing="1" class="table table-bordered checkout-table">
                            <tbody>
                            <tr style="border-bottom:1px solid #ccc;">
                            <th style="border:1px solid #ccc;"><strong>Items</strong></th>
                            <th style="border:1px solid #ccc; text-align:center;"><strong>QTY</strong></th>
                            <th style="border:1px solid #ccc; text-align:right;"><strong>Price</strong></th>
                            </tr>
                            '.$mail_order_details.'
                            <tr style="border-bottom:1px solid #ccc;">
                            <td style="border:1px solid #ccc; text-align:right;" colspan="2">Total Amount</td><td style="border:1px solid #ccc; text-align:right;">'.CURRENCY.' '.number_format((float)$amount, 2, '.', '').'</td>
                            </tr>
                            </table>
                            <h2>Customer Billing Details</h2>
                            <ul>
                            <li><strong>Email</strong>: '.$getOrderDetails["fld_email_id"].' </li>
                            <li><strong>Phone</strong>: '.$getOrderDetails["fld_phone_no"].'</li>
                            </ul>
                            <p><b>Address</b></p>
                            <p>'.$getOrderDetails["fld_first_name"].' '.$getOrderDetails["fld_last_name"].'</p>
                            <p>'.$getOrderDetails["fld_address"].', '.$getOrderDetails["fld_address2"].', 
                            '.$getOrderDetails["fld_city"].', '.$getOrderDetails["fld_state"].' - '.$getOrderDetails["fld_zip_code"].
                            ' '.$getOrderDetails["fld_country"].'</p>
                            <h2>Customer Shipping Details</h2>
                            <ul>
                            <li><strong>Email</strong>: '.$getOrderDetails["fld_shipping_email_id"].' </li>
                            <li><strong>Phone</strong>: '.$getOrderDetails["fld_shipping_phone_no"].'</li>
                            </ul>
                            <p><b>Address</b></p>
                            <p>'.$getOrderDetails["fld_shipping_first_name"].' '.$getOrderDetails["fld_shipping_last_name"].'</p>
                            <p>'.$getOrderDetails["fld_shipping_address"].', '.$getOrderDetails["fld_shipping_address2"].', 
                            '.$getOrderDetails["fld_shipping_city"].', '.$getOrderDetails["fld_shipping_state"].' - '
                            .$getOrderDetails["fld_shipping_zip_code"].' '.$getOrderDetails["fld_shipping_country"].'</p>
                            </div>';
                            
                           

                            $user_email_subject = 'New Order - Transaction ID# .'.$razorpay_payment_id;
                            $user_email_message = '<div style="font-family:Arial, Helvetica, sans-serif; padding:15px;">
                            <p>Hi '.$getOrderDetails["fld_first_name"].' '.$getOrderDetails["fld_last_name"].',</p>
                            <p>We have received your order. The order is as follows:</p>';
                            
                            $user_email_message .= '<table cellpadding="10" width="100%"  cellspacing="1" class="table table-bordered checkout-table">
                            <tbody>
                                <tr style="border-bottom:1px solid #ccc;">
                                    <td  style="border:1px solid #ccc; width:30%;"><h2>BILLED TO</h2></td>
                                    <td  style="border:1px solid #ccc; width:30%;"><h2>SHIPPING TO</h2></td>
                                    <td  style="border:1px solid #ccc; width:60%;"><h2>ORDER INFO</h2></td>
                                </tr>
                                <tr style="border-bottom:1px solid #ccc;">
                                    <td  style="border:1px solid #ccc; width:30%;">
                                        <p>'.$getOrderDetails["fld_first_name"].' '.$getOrderDetails["fld_last_name"].'</p>
                                        <p>'.$getOrderDetails["fld_address"].', '.$getOrderDetails["fld_address2"].', 
                                        '.$getOrderDetails["fld_city"].', '.$getOrderDetails["fld_state"].' - '
                                        .$getOrderDetails["fld_zip_code"].' '.$getOrderDetails["fld_country"].'</p>
                                        <p>Phone: '.$getOrderDetails["fld_phone_no"].'</p>
                                        <p>Email: '.$getOrderDetails["fld_email_id"].'</p>
                                    </td>
                                    <td  style="border:1px solid #ccc; width:30%;">
                                        <p>'.$getOrderDetails["fld_shipping_first_name"].' '.$getOrderDetails["fld_shipping_last_name"].'</p>
                                        <p>'.$getOrderDetails["fld_shipping_address"].', '.$getOrderDetails["fld_shipping_address2"].',
                                         '.$getOrderDetails["fld_shipping_city"].', '.$getOrderDetails["fld_shipping_state"].' - '
                                         .$getOrderDetails["fld_shipping_zip_code"].' '.$getOrderDetails["fld_shipping_country"].'</p>
                                        <p>Phone: '.$getOrderDetails["fld_shipping_phone_no"].'</p>
                                        <p>Email: '.$getOrderDetails["fld_shipping_email_id"].'</p>
                                    </td>
                                    <td  style="border:1px solid #ccc; width:60%;">
                                        <p><strong>ORD# </strong>'.$fld_order_id.'<br>
                                        <strong>ORD Date: </strong>'.$getOrderDetails["fld_payment_date"].'<br>
                                        <strong>Status: </strong> '.$getOrderDetails["fld_payment_status"].'<br>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                            <table cellpadding="10" width="100%"  cellspacing="1" class="table table-bordered checkout-table">
                            <tbody>
                            <tr style="border-bottom:1px solid #ccc;">
                            <th style="border:1px solid #ccc; width:25%;"><strong>Items</strong></th>
                            <th style="border:1px solid #ccc; width:25%; text-align:center;"><strong>QTY</strong></th>
                            <th style="border:1px solid #ccc; width:50%; text-align:right;"><strong>PRICE</strong></th>
                            </tr>
                            '.$mail_order_details.'
                            <tr style="border-bottom:1px solid #ccc;">
                            <td style="border:1px solid #ccc;"></td><td style="border:1px solid #ccc; text-align:right;">Total:</td><td style="border:1px solid #ccc; text-align:right;">'.CURRENCY.' '.number_format((float)$amount, 2, '.', '').'</td>
                            </tr>
                            </table>
                            </div>';
                           // echo $user_email_message;
                           // echo $admin_email_message;
                            //die('lll');
                            $email=$_SESSION['useremail'];
                            $to = "support@alpasban.com";
                            $from = $email;
                            $email_cc='';
                            // $headers  = 'MIME-Version: 1.0' . "\r\n";
                            // $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
                            // // // Additional headers\
                            // $headers .= 'To: New Customer Order <'.$to.'>' . "\r\n";
                            // $headers .= 'From: "Al Pasban" <support@alpasban.com>' . "\r\n";
                            // $headers .= 'Cc: '.$email_cc. "\r\n";
                            // $ok = mail($to,$email_subject,$admin_email_message,$headers);
                            $successmail = $FontEndData->send_mail($to,$from,$email_subject,$admin_email_message,$headers='');
                            if($successmail){
                                // $user_headers  = 'MIME-Version: 1.0' . "\r\n";
                                // $user_headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
                                // // // Additional headers\
                                // $user_headers .= 'To: New Customer Order <'.$email.'>' . "\r\n";
                                // $user_headers .= 'From: "Al Pasban" <support@alpasban.com>' . "\r\n";
                                // $user_headers .= 'Cc: '.$email_cc. "\r\n";
                                //$ok = mail($from,$user_email_subject,$user_email_message.$email_message,$user_headers);
                                $successmail = $FontEndData->send_mail($from,$to,$user_email_subject,$user_email_message,$user_headers='');
                            }
                            
                            if ($success === true || $fld_payment_type=='COD'){
                                // ShipRocket Api 
    
                                $curl = curl_init();
    
                                curl_setopt_array($curl, array(
                                    CURLOPT_URL => 'https://apiv2.shiprocket.in/v1/external/auth/login',
                                    CURLOPT_RETURNTRANSFER => true,
                                    CURLOPT_ENCODING => '',
                                    CURLOPT_MAXREDIRS => 10,
                                    CURLOPT_TIMEOUT => 0,
                                    CURLOPT_FOLLOWLOCATION => true,
                                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                    CURLOPT_CUSTOMREQUEST => 'POST',
                                    CURLOPT_POSTFIELDS =>'{
                                    "email": "no-reply@alpasban.com",
                                    "password": "jAEl?O.L^8t_"
                                    }',
                                    CURLOPT_HTTPHEADER => array(
                                        'Content-Type: application/json'
                                    ),
                                ));
                                $response = curl_exec($curl);
                                curl_close($curl);
                                $response=json_decode($response);
                                $tocken= $response->token;
    
                                //Ship Rocket Create Order
                                $curl = curl_init();
    
                                $fld_email_id=$getOrderDetails["fld_email_id"];
                                $fld_phone_no=$getOrderDetails["fld_phone_no"];
                                $fld_first_name=$getOrderDetails["fld_first_name"];
                                $fld_last_name=$getOrderDetails["fld_last_name"];
                                $fld_address=$getOrderDetails["fld_address"];
                                $fld_address2=$getOrderDetails["fld_address2"];
                                $fld_city=$getOrderDetails["fld_city"];
                                $fld_zip_code=$getOrderDetails["fld_zip_code"];
                                $fld_country=$getOrderDetails["fld_country"];
                                $fld_shipping_email_id=$getOrderDetails["fld_shipping_email_id"];
                                $fld_shipping_phone_no=$getOrderDetails["fld_shipping_phone_no"];
                                $fld_shipping_first_name=$getOrderDetails["fld_shipping_first_name"];
                                $fld_shipping_last_name=$getOrderDetails["fld_shipping_last_name"];
                                $fld_shipping_address=$getOrderDetails["fld_shipping_address"];
                                $fld_shipping_address2=$getOrderDetails["fld_shipping_address2"];
                                $fld_shipping_city=$getOrderDetails["fld_shipping_city"];
                                $fld_shipping_zip_code=$getOrderDetails["fld_shipping_zip_code"];
                                $fld_shipping_country=$getOrderDetails["fld_shipping_country"];
                                $fld_payment_date=$getOrderDetails['fld_payment_date'];
                                
    
                                
                                curl_setopt_array($curl, array(
                                CURLOPT_URL => 'https://apiv2.shiprocket.in/v1/external/orders/create/adhoc',
                                CURLOPT_RETURNTRANSFER => true,
                                CURLOPT_ENCODING => '',
                                CURLOPT_MAXREDIRS => 10,
                                CURLOPT_TIMEOUT => 0,
                                CURLOPT_FOLLOWLOCATION => true,
                                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                CURLOPT_CUSTOMREQUEST => 'POST',
                                CURLOPT_POSTFIELDS =>'{
                                    "order_id": "'.$fld_order_id.'",
                                    "order_date": "'.$fld_payment_date.'",
                                    "pickup_location": "AL PASBAN",
                                    "channel_id": "",
                                    "comment": "New Order ",
                                    "billing_customer_name": "'.$fld_first_name.'",
                                    "billing_last_name": "'.$fld_last_name.'",
                                    "billing_address": "'.$fld_address.'",
                                    "billing_address_2": "'.$fld_address2.'",
                                    "billing_city": "'.$fld_city.'",
                                    "billing_pincode": "'.$fld_zip_code.'",
                                    "billing_state": "NA",
                                    "billing_country": "'.$fld_country.'",
                                    "billing_email": "'.$fld_email_id.'",
                                    "billing_phone": "'.$fld_phone_no.'",
                                    "shipping_is_billing": true,
                                    "shipping_customer_name": "'.$fld_shipping_first_name.'",
                                    "shipping_last_name": "'.$fld_shipping_last_name.'",
                                    "shipping_address": "'.$fld_shipping_address.'",
                                    "shipping_address_2": "'.$fld_shipping_address2.'",
                                    "shipping_city": "'.$fld_shipping_city.'",
                                    "shipping_pincode": "'.$fld_shipping_zip_code.'",
                                    "shipping_country": "'.$fld_shipping_country.'",
                                    "shipping_state": "",
                                    "shipping_email": "'.$fld_shipping_email_id.'",
                                    "shipping_phone": "'.$fld_shipping_phone_no.'",
                                    "order_items": '.$shiprocketproductlist.',
                                    "payment_method": "Prepaid",
                                    "shipping_charges": 0,
                                    "giftwrap_charges": 0,
                                    "transaction_charges": 0,
                                    "total_discount": "'.$discount_amount.'",
                                    "sub_total": "'.$amount.'",
                                    "length": 10,
                                    "breadth": 15,
                                    "height": 20,
                                    "weight": 2.5
                                    }',
                                CURLOPT_HTTPHEADER => array(
                                    'Authorization: Bearer '.$tocken,
                                    'Content-Type: application/json'
                                ),
                                ));
    
                              
                                $response = curl_exec($curl);
    
                                curl_close($curl);
                               // echo $response;
                            }
                           
                           
                            
                            $_SESSION["cart_item"] = array();
                            $_SESSION['coupon'] = $_SESSION["formdata"] = $_SESSION["ItemName"] = '';
                            $_SESSION['razorpay_order_id'] = $_SESSION["fld_order_id"] =$_SESSION["fld_payment_type"] = '';
                            $_SESSION['comments'] = '';
                             unset($_SESSION["cart_item"]);
                             unset($_SESSION["ItemName"]);
                             unset($_SESSION["formdata"]);
                             unset($_SESSION['coupon']);
                             unset($_SESSION['razorpay_order_id']);
                             unset($_SESSION['fld_order_id']);
                             unset($_SESSION['fld_payment_type']);

                            //$order_details 

                            ?>

                            
                            <div class="checkout__content--step section__shipping--address pt-0">
                                <div class="section__header checkout__header--style3 position__relative mb-25">
                                    <span class="checkout__order--number">Order #<?php echo $fld_order_id; ?></span>
                                    <h2 class="section__header--title h3">Thank you submission</h2>
                                    <div class="checkout__submission--icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25.995" height="25.979" viewBox="0 0 512 512"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M416 128L192 384l-96-96"/></svg>
                                    </div>
                                </div>
                                <?php echo $html; ?>
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
                                    </div>
                                    
                                    <table cellpadding="10" width="90%"  cellspacing="1" class="mt-4 table table-bordered table-stripedd checkout-table">
                                        <thead>
                                            <tr style="border-bottom:1px solid #ccc;">
                                                <th style="border:1px solid #ccc;"><strong>Items</strong></th>
                                                <th style="border:1px solid #ccc; text-align:center;"><strong>QTY</strong></th>
                                                <th style="border:1px solid #ccc; text-align:right;"><strong>Price</strong></th>
                                            </tr>
                                        </thead>    
                                        <tbody>    
                                            <?php 
                                            
                                                $order_details .= '<tr><td style="border:1px solid #ccc;text-align:right;" colspan="2">Subtotal</td>
                                            <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' '.number_format((float)$sub_total-$vat, 2, '.', '').'</td></tr>';
                                            $order_details .= '<tr><td style="border:1px solid #ccc;text-align:right;" colspan="2">GST ('.GST.'%)</td>
                                            <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' '.number_format((float)$vat, 2, '.', '').'</td></tr>';
                                            if($promo_code !=''){
                                                $order_details .= '<tr><td style="border:1px solid #ccc;text-align:right;" colspan="2">Discount (Promo Code: '.$promo_code.')</td>
                                            <td style="border:1px solid #ccc;text-align:right;">'.CURRENCY.' -'.number_format((float)$discount_amount, 2, '.', '').'</td></tr>';
                                            }
                                            echo $order_details;
                                            ?>
                                            <tr style="border-bottom:1px solid #ccc;">
                                                <td style="border:1px solid #ccc; text-align:right;" colspan="2">Total Amount</td>
                                                <td style="border:1px solid #ccc; text-align:right;"><?php echo CURRENCY.' '.number_format((float)$amount, 2, '.', '') ;?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="checkout__content--step__footer d-flex align-items-center">
                                <a class="continue__shipping--btn primary__btn border-radius-5" href="<?php echo SITE_URL;?>my-account.html">View Orders</a>
                                <a class="previous__link--content" href="<?php echo SITE_URL; ?>shop.html">Return to Shopping</a>
                            </div>
                        </main>
                    </div>
                    <?php //include('lib/templates/checkout-subtotal.php') ?>
                </div>
            </div>
        </div>
        <!-- End checkout page area -->
    </main> 
<?php }else{ ?>
    <main class="main__content_wrapper">
        <!-- Start checkout page area -->
        <div class="checkout__page--area">
            <div class="container">
                <div class="checkout__page--inner d-flex">
                    <div class="main checkout__mian w-100">
                        <main class="main__content_wrapper">
                            <a class="continue__shipping--btn primary__btn border-radius-5" href="<?php echo SITE_URL; ?>shop.html">Return to Shopping</a>
                        </main>
                    </div>
                </div>
            </div>
        </div>
        <!-- End checkout page area -->
    </main> 
<?php } ?>   
    
       
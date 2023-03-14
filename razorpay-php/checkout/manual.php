<?php 
require($_SERVER['DOCUMENT_ROOT'].'/razorpay-php/Razorpay.php');
use Razorpay\Api\Api;
session_start();
$result=$amount=$items_name=$name="";

 $_SESSION['fld_payment_type'] = 'Online';
 $result=explode(',',$_POST['result']);
 $amount=$_POST['amount'];
 $name=$_POST['name'];
 $address=$_POST['address'];
 $email=$_POST['email'];
 $phone=$_POST['phone'];
 $items_name=$_POST['items_name'];
 $createOrder=$_POST['createOrder'];
 //print_r($_REQUEST);
  
 //die("Ssss");
 if($createOrder>0 && !empty($result)){
    //die("eerrre");
    //$keyId = 'rzp_test_kWPS7KqYlX21H7';
    //$keySecret = 'AH6pBvWfumG36zYZFzAbT8lP';
    
    $keyId = 'rzp_live_aWpKNIWVgb8kDL';
    $keySecret = '10u9FaPYwDPIidFbcIwGCu3U';
    $displayCurrency = 'INR';
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    //print_r($_REQUEST);
    
    

    $api = new Api($keyId, $keySecret);
    $orderData = [
        'receipt'         => 3456,
        'amount'          => $amount * 100,
        'currency'        => 'INR',
        'payment_capture' => 1
    ];
    $razorpayOrder = $api->order->create($orderData);
    $razorpayOrderId = $razorpayOrder['id'];
  
    $_SESSION['razorpay_order_id'] = $razorpayOrderId;
    
    $displayAmount = $amount = $orderData['amount'];
    if ($displayCurrency !== 'INR') {
        $url = "https://api.fixer.io/latest?symbols=$displayCurrency&base=INR";
        $exchange = json_decode(file_get_contents($url), true);

        $displayAmount = $exchange['rates'][$displayCurrency] * $amount / 100;
    }
     $siteurl="https://alpasban.com";
    $data = [
        "key"               => $keyId,
        "amount"            => $amount,
        "name"              => 'Al PASBAN',
        "description"       => $items_name,
        "image"             => "$siteurl/assets/img/logo/nav-log2.png",
        "prefill"           => [
        "name"              => $name,
        "email"             => $email,
        "contact"           => $phone,
        ],
        "notes"             => [
        "address"           => $address,
        "merchant_order_id" => "12312321",
        ],
        "theme"             => [
        "color"             => "#F37254"
        ],
        "order_id"          => $razorpayOrderId,
    ];

    if ($displayCurrency !== 'INR')
    {
        $data['display_currency']  = $displayCurrency;
        $data['display_amount']    = $displayAmount;
    }
    //print_r($data);
    echo $json = json_encode($data);
   // die("eeee");
}
?>

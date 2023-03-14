<?php
include_once('../lib/function.php');
if(!empty($_POST["action"]))
{
    $_SESSION['coupon'] = array();
    unset($_SESSION['coupon']);
    $message = 'Coupon code removed sucessfully.';
}
echo $message;
die;
?>
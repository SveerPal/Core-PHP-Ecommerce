<?php 
include_once('../lib/function.php');


$data['fld_address']=$_POST['fld_address'];
$data['fld_address2']=$_POST['fld_address2'];
$data['fld_city']=$_POST['fld_city'];
$data['fld_zip_code']=$_POST['fld_zip_code'];
$data['addressType']=$_POST['addressType'];
$data['userid']=$_SESSION['userid'];
$row=$FontEndData->updateBillingShippingAddress($data);

if($row){
    echo json_encode(array('sts'=>1));
}else{
    echo json_encode(array('sts'=>0));
}
die;    

?>
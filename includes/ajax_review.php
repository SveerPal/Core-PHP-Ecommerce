<?php
include_once '../admin/includes/conn.php';
require('../phpmailer/class.phpmailer.php');
include_once('../lib/function.php');
$conn = $pdo->open();
$resp = '';
if(isset($_POST['form_type']) && $_POST['form_type']=='review'){
    if( empty($_POST['name']) || empty($_POST['email']) ){
        $resp = "<span class='text-danger'>Please complete all mandatory fields</span>";
    }else{
		
		$name = isset($_POST["name"])?trim($_POST["name"]):'';
		$email = isset($_POST["email"])?trim($_POST["email"]):'';
		echo $rating = isset($_POST["rating"])?trim($_POST["rating"]):'';
		$message = isset($_POST["message"])?trim($_POST["message"]):'';
		$product_id = isset($_POST["product_id"])?trim($_POST["product_id"]):'0';
		$table_name = 'product_review';
		$date = date("Y-m-d H:i:s");
		
		$result = $conn->prepare("INSERT INTO ".$table_name." (fld_name,fld_email,fld_rating,fld_comments,fld_product_id,fld_status,fld_upload_date) VALUES (:fld_name,:fld_email,:fld_rating,:fld_comments,:fld_product_id,:fld_status,:fld_upload_date)");
		
		$result->execute(['fld_name'=>$name,'fld_email'=>$email,'fld_rating'=>$rating,'fld_comments'=>$message,'fld_product_id'=>$product_id,'fld_status'=>0,'fld_upload_date'=>$date]);
	
		if($result){
			$resp = "<span class='text-success'>Thank you for submission your review.</span>";
		}
	}
}
echo $resp;
die;
?>
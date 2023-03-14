<?php
error_reporting(0);
include_once '../admin/includes/conn.php';
include_once '../lib/function.php';
//require('../phpmailer/class.phpmailer.php');
  
    $date = date('d-m-Y H:i:s');
	$conn = $pdo->open();
	$result_customer =$conn->prepare("select email,id from users where email='".$_REQUEST['id_email']."' order by id asc");
	$result_customer->execute();
	$row_customer = $result_customer->fetch();
	 $fld_email_id = $row_customer['email'];
		if($row_customer > 0){
			 echo $res=1;
		} else {
		       
   $result_customer_data =$conn->prepare("INSERT INTO users (firstname,lastname,email,phone_no,password,status,created_on)VALUES('".$_REQUEST['firsts']."','".$_REQUEST['lasts']."','".$_REQUEST['id_email']."','".$_REQUEST['phone_reg']."','".md5($_REQUEST['pass_reg'])."','1','".$date."')");
   $result_customer_data->execute();
       echo $res=2;
   
   
   }
?>
<?php
error_reporting(0);
include_once '../admin/includes/conn.php';
include_once('../phpmailer/class.phpmailer.php');
include_once '../lib/function.php';

    //ini_set('display_errors', '1');
    //ini_set('display_startup_errors', '1');
    //error_reporting(E_ALL);
    
    $date = date('d-m-Y H:i:s');
	$conn = $pdo->open();
	$result_customer =$conn->prepare("select email,id from users where email='".$_REQUEST['id_email']."' order by id asc");
	$result_customer->execute();
	$row_customer = $result_customer->fetch();
	$fld_email_id = $row_customer['email'];
	if($row_customer > 0){
		echo $res=1;
	}else{    
        $result_customer_data =$conn->prepare("INSERT INTO users (firstname,lastname,email,phone_no,password,status)VALUES('".$_REQUEST['firsts']."','".$_REQUEST['lasts']."','".$_REQUEST['id_email']."','".$_REQUEST['phone_reg']."','".md5($_REQUEST['pass_reg'])."','1')");
        $result_customer_data->execute();
        echo $res=2;
        $user_email_subject = 'Welcome to Al-Pasban';
        $user_email_message = '<div style="font-family:Arial, Helvetica, sans-serif; padding:15px;">
        <img src="'.SITE_URL.'assets/img/logo/nav-log2.png" height="100" width="200"/><br/>
        <p><b>Dear '.$_REQUEST["firsts"].' '.$_REQUEST["lasts"].',</b></p>
        <p>Thank you for your registration on Al-Pasban.<a href="'.SITE_URL.'login.html">Login</a></p>';
        $user_email_message .= '<p><br>Best regards,<br><b>Al-Pasban</b></p></div>';
        
        $email=$_REQUEST['id_email'];
        $from = "support@alpasban.com";
        $successmail = $FontEndData->send_mail($email,$from,$user_email_subject,$user_email_message,$user_headers='');
   }
?>
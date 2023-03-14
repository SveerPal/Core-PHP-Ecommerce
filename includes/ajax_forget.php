<?php 
include_once '../admin/includes/conn.php';
require('../phpmailer/class.phpmailer.php');
include_once '../lib/function.php';

$conn = $pdo->open();
$formtype=$_REQUEST['formtype'];
		 $result_user_data =$conn->prepare("select email,lastname,username,firstname from users where email='".$_REQUEST['id_email']."'");
	     $result_user_data->execute();
		 $numrow_users = $result_user_data->rowCount();
	     $row_customer = $result_user_data->fetch();
		  
		  $result_user_data_can =$conn->prepare("select email,lastname,username,firstname from users where email='".$_REQUEST['id_email']."'");
	     $result_user_data_can->execute();
		 $numrow_users_can = $result_user_data_can->rowCount();
		 
	      $row_customer_can = $result_user_data_can->fetch();
		  $datess=date("Y-m-d");
		 $flag=true;
	     if($numrow_users > 0 )
	     {
			
		// generate a unique random token of length 100
		$name=ucfirst($row_customer['firstname'])." ".ucfirst($row_customer['lastname']);
	
			$token = bin2hex(random_bytes(50));
			// store token in the password-reset database table against the user's email
			$query = $conn->prepare("INSERT INTO  password_reset  (email,token,date) values('".$_REQUEST['id_email']."','".$token."','".$datess."');");
			$mm =$query->execute();
			
			// Send email to user with the token in a link they can click on
			$blankspace="\n\n";
			$to = $row_customer['email'];
			$subject = "Reset your password on AL  PASBAN";
			
			$msg = '<div style="font-family:Arial, Helvetica, sans-serif; padding:15px;width:70%;">
                              <div style="font-family:Arial, Helvetica, sans-serif; padding:15px; width:90%;">
                              <p>Dear '.$name.'</p>
                           
   				  <p><strong>Click below link to reset your password:</strong></p>
   				  <p><a href="https://alpasban.com/new-password.html?additonal_data='.$token.'">Click Here</a></p>
                                 <p>Thanks & Regards,</p>
                                  <p>AL  PASBAN</p>
                                  
                 </div>';
				 
			$headers  = 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
				   // Additional headers\
			$headers .= 'To: Reset your password on AL  PASBAN <'.$to.'>' . "\r\n";
			$headers .= 'From: "AL  PASBAN" <support@alpasban.com>' . "\r\n";
			$headers .= 'Cc: '.$email_cc. "\r\n";
		    $email = 'support@alpasban.com';
			mail($to, $subject, $msg, $headers);
		    $FontEndData->send_mail($to, $email, $subject, $msg,$headers);
			echo "<p style='color:red;'>We have sent you an email to your registered email address which will help you to recover your password.</p>";	 
			$flag=false;
		 }
	   
	   if($flag) {
	    echo "<p style='color:red;'>The e-mail address you entered is not registered with AL  PASBAN</p>";
	   }
	  ?>
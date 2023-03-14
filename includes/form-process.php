<?php
include_once '../admin/includes/conn.php';
require('../phpmailer/class.phpmailer.php');
include_once('../lib/function.php');

$to = 'support@alpasban.com';
$from = 'support@alpasban.com';
$user_mail_subject = 'Thanks for your Query to AL Pasban';
$user_mail_body = '<p>Thank you very much for contacting AL Pasban. Someone will get back to you within 24 hrs.</p>';
$user_mail_body .= '<p>If you have an urgent need, please feel free to text or call us at +91 9311503538.</p>';

if(isset($_POST['form_type']) && $_POST['form_type']=='contactus'){
    if( empty($_POST['name']) || empty($_POST['email']) ){
        echo $result = "Please complete all mandatory fields";
    }else{
		$name = isset($_POST["name"])?trim($_POST["name"]):'';
		$lname = isset($_POST["lname"])?trim($_POST["lname"]):'';
		$email = isset($_POST["email"])?trim($_POST["email"]):'';
		$phone = isset($_POST["phone"])?trim($_POST["phone"]):'';
		$message = isset($_POST["message"])?trim($_POST["message"]):'';
		if(!empty($lname)){
		    $name = $name.' '.$lname;
		}
		// redirect to success page
		$subject = 'Enquiry for Contact Us';
		$email_message = '<p>Hi, Admin<br></p>';
		$email_message = '<p>Following are contact enquiry details:</p>';
		$email_message .= '<p><b>Name:</b> '.$name.'</p>';
		if(!empty($phone)){
		    $email_message .= '<p><b>Phone:</b> '.$phone.'</p>';
		}
		$email_message .= '<p><b>Email:</b> '.$email.'</p>';
		$email_message .= '<p><b>Message:</b> '.$message.'</p>';
		$email_message .= '<p><br>Thanks & Regards,</p><p><b>AL Pasban Team</b></p>';
		
		$result = "Sorry there was an error sending your form";
		// To send HTML mail, the Content-type header must be set
        $headers[] = 'MIME-Version: 1.0';
        $headers[] = 'Content-type: text/html; charset=iso-8859-1';
        // Additional headers
        $headers[] = 'To: '.$to;
        $headers[] = 'From: '.$email;
        $header = implode("\r\n", $headers);
		$success = $FontEndData->send_mail($to, $email, $subject, $email_message,$header);
		if($success){
		    $result = "success";
		    $user_message = '<p>Hi '.$name.',<br></p>';
	    	$user_message .= $user_mail_body;
		    $user_message .= '<p><br>Thanks & Regards,</p><p><b>AL Pasban Team</b></p>';
		    $user_headers[] = 'MIME-Version: 1.0';
            $user_headers[] = 'Content-type: text/html; charset=iso-8859-1';
            // Additional headers
            $user_headers[] = 'To: '.$email;
            $user_headers[] = 'From: '.$to;
            $user_header = implode("\r\n", $user_headers);
		    $success = $FontEndData->send_mail($email, $to, $user_mail_subject, $user_message,$user_header);
    		if(!$success){
    		    $result = "Sorry there was an error sending your form";
    		}
		}
		echo $result;
	}
}else if(isset($_POST['form_type']) && $_POST['form_type']=='newsletter'){
    if( empty($_POST['email']) ){
        echo $result = "Please complete all mandatory fields";
    }else{
		$email = isset($_POST["email"])?trim($_POST["email"]):'';
		$subject = 'Request for Newsletter Subscription';
		$message = '<p>Hi, Admin<br></p>';
		$message .= '<p><b>Email:</b> '.$email.'</p>';
		$message .= '<p><br>Thanks & Regards,</p><p><b>AL Pasban</b></p>';
		$headers[] = 'MIME-Version: 1.0';
        $headers[] = 'Content-type: text/html; charset=iso-8859-1';
        // Additional headers
        $headers[] = 'To: '.$to;
        $headers[] = 'From: '.$email;
        $header = implode("\r\n", $headers);
		$success = $FontEndData->send_mail($to, $email, $subject, $message,$header);
		$result = "invalid";
		if($success){
			$user_message = '<p>Hi,<br></p>';
			$user_message .= '<p>Thank you for your Subscription to AL Pasban newsletter!</p>';
			$user_message .= '<p><br>Thanks & Regards,</p><p><b>AL Pasban Team</b></p>';
			$result = "success";
			$user_headers[] = 'MIME-Version: 1.0';
			$user_headers[] = 'Content-type: text/html; charset=iso-8859-1';
			// Additional headers
			$user_headers[] = 'To: '.$email;
			$user_headers[] = 'From: '.$to;
			$user_header = implode("\r\n", $user_headers);
			$success = $FontEndData->send_mail($email, $to, $subject, $user_message,$user_header);
			if(!$success){
				$result = "invalid";
			}
		}
		echo $result;
	}
}
die;
?>
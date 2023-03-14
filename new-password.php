<?php
error_reporting(0);
$pdo = new Database();
$db = $pdo->open();	
//print_r($_SESSION);
$conn = $pdo->open();
$pageURL = $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
if (isset($_POST['new_password'])) {
  $new_pass = addslashes(trim($_POST['new_pass']));
  $new_pass_c = addslashes(trim($_POST['new_pass_c']));
    $token = end(explode('=', $pageURL));
  // Grab to token that came from the email link
    $result_user_data_res =$conn->prepare("select email from password_reset where token='".$token."' LIMIT 1");
	$result_user_data_res->execute();
    $numrow_users_res = $result_user_data_res->rowCount();
    $row_customer_res = $result_user_data_res->fetch();
	$email=$row_customer_res['email'];
	
	$result_user_data =$conn->prepare("select email,lastname,firstname from users where email='".$email."'");
	     $result_user_data->execute();
		 $numrow_users = $result_user_data->rowCount();
	     $row_customer = $result_user_data->fetch();
	

    if($numrow_users > 0 )
	{
	  
      $result_update =$conn->prepare("UPDATE users SET password='".md5($new_pass)."' where  email='".$email."'");
	  $result_update->execute();
	  
	  $message = 'Your Password has been changed sucessfully';
    }else{
		 $message = 'Problem in updating password';
		}
}
?>

<style>
#pass-status {
  float: right;
  top: -48px !important;
  position: relative;
}
#pass-status1 {
  float: right;
  top: -48px !important;
  position: relative;
}

</style>
    <main class="main__content_wrapper">
        
    <?php// include('lib/templates/inner-banner.php')?>


        <section class="section--padding">
            <div class="container-fluid">
                <div class="row">
                    <?php echo $pageDetails['description'];?>
                </div>
            </div>
        </section>

        <!-- Start login section  -->
        <div class="login__section section--padding">
            <div class="container">
			   <form class="form-horizontal row-border empregfrm" id="loginform" name="loginform" method="post" enctype="multipart/form-data">
                   <div class="login__section--inner">
                        <div class="row">
                            <div class="col">
                                <div class="account__login">
                                    <div class="verify-acc">
                                        <div class="account__login--header mb-25">
                                        <h2 class="account__login--header__title h3 mb-10">New Password</h2>
                                       <span style="color:red;font-weight:bold;text-align:center;padding-left: 82px;margin-top: 10px;"><?php echo $message; ?></span>
                                    </div>
                                    <div class="account__login--inner">
									 <div class="row">
									
							
                           <div class="col-md-6">
                                    <input name="new_pass" id="fld_emp_pass" type="password" value="" class="account__login--input pass-input" required="">  
									<i id="pass-status" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPassword()"></i>
									<p id="password-strength-status"></p>
                                 
                            
                           </div>
						   
						   <div class="col-md-6">
                           
                                    <input name="new_pass_c" placeholder="Confirm new password" id="fld_emp_conpass" type="password" value="" class="account__login--input pass-input1" required="">  
									<i id="pass-status" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPassword1()"></i>
									<span id='message'></span>
                                
                             
                           </div>
                            <div class="checkout__content--step__footer d-flex align-items-center">
                                          
										 <button class="continue__shipping--btn primary__btn border-radius-5" id="forget_submit" name="new_password" type="submit">Reset Password</button>	
                                            
                                        </div>
                          
						 <div class="clearfix"></div>
						
                        </div>
                                    </div>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                 </form>
            </div>     
        </div>
        <!-- End login section  -->

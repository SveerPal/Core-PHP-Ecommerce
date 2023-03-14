<?php
error_reporting(0);
if($_SESSION['useremail']!=""){ ?>
<script>
window.location.replace("https://www.alpasban.com/my-account.html");
</script>
<?php	
}
?>
<main class="main__content_wrapper">
        
    <?php //include('lib/templates/inner-banner.php')?>
<style>
#reglogin #pass-status {float: right;top: -48px !important;position: relative;}
#reglogin #pass-status1 {float: right;top: -48px !important;position: relative;}
#pass-status-login {float: right;top: -48px !important;position: relative;}
</style>



        <!-- Start login section  -->
        <div class="login__section section--padding">
            <div class="container">
             
                    <div class="login__section--inner">
                        <div class="row">
                            <div class="col">
                                <div class="account__login">
                                    <div class="account__login--header mb-25">
                                        <h2 class="account__login--header__title h3 mb-10">Login</h2>
                                        <p class="account__login--header__desc">Login if you area a returning customer.</p>
                                    </div>
                                    <div class="account__login--inner">
                                        <div id="div_logins"></div>
                                        <input class="account__login--input" id="loginemail" placeholder="Email *" type="email" autocomplete="off">
                                        <input class="account__login--input pass-input-login" id="loginpassword" placeholder="Password" style="position:relative;" type="password" autocomplete="off">
										<i id="pass-status-login" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPasswordlog()"></i> 
                                        <div class="account__login--remember__forgot mb-15 d-flex justify-content-between align-items-center">
                                            
                                          <a href="forget-password.html" class="account__login--forgot" type="submit">Forgot Your Password?</a>
                                        </div>
                                        <button id="lgoin_submit" class="account__login--btn primary__btn" type="submit">Login</button>
                                       <!--- <div class="account__login--divide">
                                            <span class="account__login--divide__text">OR</span>
                                        </div>
                                        <div class="account__social d-flex justify-content-center mb-15">
                                            <a class="account__social--link facebook" target="_blank" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                                            <a class="account__social--link google" target="_blank" href="https://www.google.com/"><i class="fab fa-google"></i></a>
                                          
                                        </div> !--->
                                        
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col">
                               <div class="col">
                                <div class="account__login register">
                                    <div class="account__login--header mb-25">
                                        <h2 class="account__login--header__title h3 mb-10">Create an Account</h2>
                                        <p class="account__login--header__desc">Register here if you are a new customer</p>
                                    </div>
									
									<div id="output" style='color:red;'></div>
                                    <div class="account__login--inner">
									<form name="reglogin" id="reglogin" method="post">
									   <div class="row">
									    <div class="col-md-6">
									    <input class="account__login--input" placeholder="First Name *" id="firsts" type="text">
										</div>
										<div class="col-md-6">
                                        <input class="account__login--input" placeholder="Last Name *" id="lasts" type="email" value="">
										</div>
										
										<div class="col-md-6">
                                        <input class="account__login--input" placeholder="Email Address *" id="emails" type="email" value="">
										</div>
										<div class="col-md-6">
                                        <input class="account__login--input" placeholder="Phone Number *" id="phones" type="tel">
                                         </div>
										 <div class="col-md-6">
                                        <input class="account__login--input pass-input" style="position:relative;" placeholder="Password *" id="fld_emp_pass" type="password">
										 <i id="pass-status" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPassword()"></i> 
										 
										  </div>
										  <div class="col-md-6">
										 <input name="fld_emp_conpass" id="fld_emp_conpass" placeholder="Confirm Password *" type="password" value="" class="account__login--input pass-input1">
										<i id="pass-status1" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPassword1()"></i>
                                       
										  </div>
										  
										   <div class="col-md-12">
										   
										     <p id="password-strength-status"></p>
											 <p id="message"></p>
										   </div>
										    <div class="account__login--remember position__relative">
                                            <input class="checkout__checkbox--input" id="check2" required="" value="1" type="checkbox" required>
                                            <span class="checkout__checkbox--checkmark"></span>
                                            <label class="checkout__checkbox--label login__remember--label" for="check2">
                                                I have read and agree to the terms & conditions</label>
                                        </div>
                                        <button class="account__login--btn primary__btn mb-10" id="reg_submit" type="button">Submit & Register</button>
										</div>
                                       
									 </form>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
               
            </div>     
        </div>

        

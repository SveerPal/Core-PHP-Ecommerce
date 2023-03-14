
    <main class="main__content_wrapper">
        
    <?php// include('lib/templates/inner-banner.php')?>


      
        <!-- Start login section  -->
        <div class="login__section section--padding">
            <div class="container">
                <form action="#">
                    <div class="login__section--inner">
                        <div class="row">
                            <div class="col">
                                <div class="account__login">
                                    <div class="verify-acc">
                                        <div class="account__login--header mb-25">
                                        <h2 class="account__login--header__title h3 mb-10">Reset Password</h2>
                                        <p class="account__login--header__desc">Login if you area a returning customer.</p>
                                    </div>
                                    <div class="account__login--inner">
									  <div id="div_forgetlogin"></div>
									<form name="restpass" id="restpass" method="post">
                                        <input class="account__login--input" name="email" placeholder="Email Address" id="restemail" type="text">
                                      <div class="checkout__content--step__footer d-flex align-items-center">
                                          
										 <button class="continue__shipping--btn primary__btn border-radius-5" id="forget_submit" type="button">Reset Password</button>	
                                            <a class="previous__link--content" href="login.html">Cancel</a>
                                        </div>
										 <input type="hidden" name="formtype" id="formtype" value="">
                                       </form> 
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

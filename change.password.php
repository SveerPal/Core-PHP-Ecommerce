
    <main class="main__content_wrapper">
        
    <?php include('lib/templates/inner-banner.php')?>


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
                <form action="#">
                    <div class="login__section--inner">
                        <div class="row">
                            <div class="col">
                                <div class="account__login">
                                    <div class="account__login--header mb-25">
                                        <h2 class="account__login--header__title h3 mb-10">Change Password</h2>
                                        <p class="account__login--header__desc">Login if you area a returning customer.</p>
                                    </div>
                                    <div class="account__login--inner">
                                        <input class="account__login--input" placeholder="Previous Password" type="password">
                                        <input class="account__login--input" placeholder="New Password" type="password">
                                        <input class="account__login--input" placeholder="Confirm Password" type="password">
                                        <div class="checkout__content--step__footer d-flex align-items-center">
                                            <a class="continue__shipping--btn primary__btn border-radius-5" href="#">Update</a>
                                            <a class="previous__link--content" href="#">Cancel</a>
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

    

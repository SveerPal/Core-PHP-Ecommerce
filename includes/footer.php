  <!-- Start shipping section -->
          <section class="shipping__section shipping__style3" id="ship">
            <div class="container-fluid">
                <div class="shipping__style3--inner border-radius-10 d-flex justify-content-between">
                    <div class="shipping__style3--items d-flex align-items-center">
                        <div class="shipping__style3--icon">
                           <img width="50" height="50" src="<?php echo SITE_URL; ?>/assets/img/icon/credit-card.png" alt="alpasban">                           
                        </div>
                        <div class="shipping__style3--content">
                            <h2 class="shipping__style3--content__title">Secure Payment</h2>
                            <p class="shipping__style3--content__desc">Visa, Paypal, Master</p>
                        </div>
                    </div>
                    <div class="shipping__style3--items d-flex align-items-center">
                        <div class="shipping__style3--icon">
                           <img width="50" height="50" src="<?php echo SITE_URL; ?>assets/img/icon/express-delivery.png" alt="alpasban">                        
                        </div>
                        <div class="shipping__style3--content">
                            <h2 class="shipping__style3--content__title">Express Delivery</h2>
                            <p class="shipping__style3--content__desc">Always On Time</p>
                        </div>
                    </div>
                    <div class="shipping__style3--items d-flex align-items-center">
                        <div class="shipping__style3--icon">
                            <img width="50" height="50" src="<?php echo SITE_URL; ?>assets/img/icon/distribution.png" alt="alpasban">                              
                        </div>
                        <div class="shipping__style3--content">
                            <h2 class="shipping__style3--content__title">Easy Return</h2>
                            <p class="shipping__style3--content__desc">14 days</p>
                        </div>
                    </div>
                    <div class="shipping__style3--items d-flex align-items-center">
                        <div class="shipping__style3--icon">
                             <img width="50" height="50" src="<?php echo SITE_URL; ?>assets/img/icon/24.png" alt="alpasban">                          
                        </div>
                        <div class="shipping__style3--content">
                            <h2 class="shipping__style3--content__title">24/7 SUPPORT</h2>
                            <p class="shipping__style3--content__desc">Support every time</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End shipping section -->


<!-- Start footer section -->
 <footer class="footer__section bg__black color-scheme-2" id="foot">
        <div class="container-fluid">
            <div class="main__footer d-flex justify-content-between">
                
                <div class="col-md-4">
                    <div class="footer__widget footer__widget--width">
                    <h2 class="footer__widget--title text-ofwhite h3">About Us </h2>
<!--
                        <button class="footer__widget--button" aria-label="footer widget button">
                            <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg" width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                <path  d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z" transform="translate(-6 -8.59)" fill="currentColor"></path>
                            </svg>
                        </button>
-->
                    
                    <div class="footer__widget--inner">
                        <p class="footer__widget--desc text-ofwhite mb-20">
                        <?php echo $FontEndData->getSettingsData('footerText'); ?>
                        </p>
                        <p class="footer__widget--desc text-ofwhite mb-20">
                            <strong>Address:</strong>
                        <?php echo $FontEndData->getSettingsData('address'); ?>
                        </p>
                        <p class="footer__widget--desc text-ofwhite mb-20">
                            <strong>Email:</strong>
                            <a href="mailto:<?php echo $FontEndData->getSettingsData('email'); ?>"><?php echo $FontEndData->getSettingsData('email'); ?></a>
                        </p>
                        <div class="footer__social">
                            <h3 class="social__title text-ofwhite h4 mb-15">Follow Us</h3>
                            <ul class="social__shear d-flex">
                                <li class="social__shear--list">
                                    <a class="social__shear--list__icon" target="_blank" href="<?php echo $FontEndData->getSettingsData('facebook'); ?>">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                </li>
                                <?php 
                                    $twitter = $FontEndData->getSettingsData('twitter');
                                    if(isset($twitter) && !empty($twitter)){ 
                                ?>
                                <li class="social__shear--list">
                                    <a class="social__shear--list__icon" target="_blank" href="<?php echo $FontEndData->getSettingsData('twitter'); ?>">
                                         <i class="fab fa-twitter"></i>
                                    </a>
                                </li>
                                <?php } ?>
                                <li class="social__shear--list">
                                    <a class="social__shear--list__icon" target="_blank" href="<?php echo $FontEndData->getSettingsData('instagram'); ?>">
                                         <i class="fab fa-instagram"></i>
                                    </a>
                                </li>
                                <?php 
                                    $youtube = $FontEndData->getSettingsData('youtube');
                                    if(isset($youtube) && !empty($youtube)){ 
                                ?>
                                <li class="social__shear--list">
                                    <a class="social__shear--list__icon" target="_blank" href="<?php echo $FontEndData->getSettingsData('youtube'); ?>">
                                         <i class="fab fa-youtube"></i>
                                    </a>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
                </div>
                
                <div class="col-md-2">
                    <div class="footer__widget--menu__wrapper d-flex footer__widget--width">
                    <div class="footer__widget">
                        <h2 class="footer__widget--title text-ofwhite h3">My Account 
<!--
                            <button class="footer__widget--button" aria-label="footer widget button">
                                <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg" width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                    <path  d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z" transform="translate(-6 -8.59)" fill="currentColor"></path>
                                </svg>
                            </button>
-->
                        </h2>
                        <ul class="footer__widget--menu footer__widget--inner">
                            <?php 
                            $menus=$FontEndData->menu('My Account');
                            ?>
                            <?php foreach($menus as $menu){ ?>
                            <li class="footer__widget--menu__list">
                                <a class="footer__widget--menu__text" href="<?php echo SITE_URL.$FontEndData->getSlug($menu['item_id'],$menu['menu_type']); ?>.html">
                                <?php echo $menu['name']; ?>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                </div>
                
                <div class="col-md-3">
                    <div class="footer__widget">
                        <h2 class="footer__widget--title text-ofwhite h3">Useful Links 
<!--
                            <button class="footer__widget--button" aria-label="footer widget button">
                                <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg" width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                    <path  d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z" transform="translate(-6 -8.59)" fill="currentColor"></path>
                                </svg>
                            </button>
-->
                        </h2>
                        <ul class="footer__widget--menu footer__widget--inner">
                            <?php 
                            $menusULS=$FontEndData->menu('Useful Links');
                            ?>
                            <?php foreach($menusULS as $menusUL){ ?>
                            <li class="footer__widget--menu__list">
                                <a class="footer__widget--menu__text" href="<?php echo SITE_URL.$FontEndData->getSlug($menusUL['item_id'],$menusUL['menu_type']); ?>.html">
                                <?php echo $menusUL['name']; ?>
                                </a>
                            </li>
                            <?php } ?>                           
                        </ul>
                    </div>
                </div>
                
                
               <div class="col-md-3">
                     <div class="footer__widget footer__widget--width">
                    <h2 class="footer__widget--title text-ofwhite h3">Newsletter 
<!--
                        <button class="footer__widget--button" aria-label="footer widget button">
                            <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg" width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                <path  d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z" transform="translate(-6 -8.59)" fill="currentColor"></path>
                            </svg>
                        </button>
-->
                    </h2>
                    <div class="footer__widget--inner">
                        <!-- <p class="footer__widget--desc text-ofwhite m-0">Fill their seed open meat. Sea you <br> great Saw image stl</p>  -->
                        
                            <form action="" method='post' id="newsletter" onsubmit="return newsletter_validation('newsletter')" class="newsletter__subscribe--form" >
                                <div class="newsletter__subscribe">    
                                <label>
                                    <input class="newsletter__subscribe--input" placeholder="Email Address" name='email' type="email" required='' maxlength="200">
                                </label>
                                <input type="submit" class="newsletter__subscribe--button" value="Subscribe">
                                <p class="text-white message"></p>
                                 </div>     
                            </form>   
                       
                    </div> 
                </div>
                </div>
            </div>
            
            
            <div class="footer__bottom d-flex justify-content-between align-items-center">
                <p class="copyright__content text-ofwhite m-0">Copyright © <?php echo date('Y'); ?> <a class="copyright__content--link" href="<?php echo SITE_URL;?>">AL Pasban</a> . All Rights Reserved. Design By <a href="https://www.ezrankings.com/" target="_blank" style="color: darkgoldenrod">Ez Rankings</a></p>
                <div class="footer__payment text-right">
                    <img class="display-block" src="<?php echo SITE_URL;?>assets/img/other/payment-visa-card.png" alt="visa-card"  width="410" height="35">
                </div>
            </div>
            <div class="whatsapp">
                <a href="https://wa.me/<?php echo preg_replace('/\s+/', '', $FontEndData->getSettingsData('phone')); ?>" target="_blank">
               <!--<a href="https://api.whatsapp.com/send?phone=<?php echo $FontEndData->getSettingsData('phone'); ?>&amp;text=Hello" target="_blank">-->
                <img src="<?php echo SITE_URL;?>assets/img/WhatsApp-icon.png" class="img-responsive" alt="whatsapp"  width="50" height="50"></a>
            </div>
           
        </div>
    </footer>
    <!-- End footer section -->


    <!-- Scroll top bar -->
    <button class="color-scheme-2" id="scroll__top"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M112 244l144-144 144 144M256 120v292"/></svg></button>
    
    <!-- Check Out -->

  <script src="<?php echo SITE_URL;?>assets/js/vendor/popper.js" defer="defer"></script>
  <script src="<?php echo SITE_URL;?>assets/js/vendor/bootstrap.min.js" defer="defer"></script>
  <script src="<?php echo SITE_URL;?>assets/js/plugins/swiper-bundle.min.js"></script>
  <script src="<?php echo SITE_URL;?>assets/js/plugins/glightbox.min.js"></script>

   <script src="<?php echo SITE_URL;?>assets/js/script.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://www.jqueryscript.net/demo/infinite-scroll-pagination/js/scrollpagination.js"></script>
  <link href="https://www.jqueryscript.net/demo/infinite-scroll-pagination/css/scrollpagination.css"/>
  <script src="<?php echo SITE_URL; ?>assets/js/Lobibox.js"></script>
  <script src="<?php echo SITE_URL;?>assets/js/custom.js"></script>
  
  <?php include_once('footer-script.php'); ?>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/smooth-scroll/16.1.3/smooth-scroll.js" integrity="sha512-vfE8OCUETP038fi2pHsLeJC/5xd48FyLsATJLulbdsCRBXgRWxA+0K9he4GClcPjT24vMJk1mFMFbjYS9J7NpA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <?php if($_SERVER['REQUEST_URI']=="/")
  { 
  ?>
  <script>
var scroller = new SmoothScroll({
  target: document.querySelector("#scroll-container"),
  scrollEase: 0.08,
});
</script>
  <?php }   $actual_link = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";?>
  
    <?php if(SITE_URL==$actual_link){ ?>
    <?php if(isset($_SESSION['useremail']) && $_SESSION['useremail']!=""){ //no popup
    }else{ ?>
    <!-- Start News letter popup -->
    <div class="newsletter__popup" data-animation="slideInUp">
        <div id="boxes" class="newsletter__popup--inner">
            <button class="newsletter__popup--close__btn" aria-label="search close button">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 512 512"><path fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M368 368L144 144M368 144L144 368"></path></svg>
            </button>
            <div class="box newsletter__popup--box d-flex align-items-center">
                <div class="newsletter__popup--thumbnail">
                    <img  width="330" height="95" class="newsletter__popup--thumbnail__img display-block" src="https://www.alpasban.com/admin/uploaded_files/products/a195dccad398c025fd91c4c14f8d29a5.jpg" alt="newsletter-popup-thumb">
                </div>
                <div class="newsletter__popup--box__right">
                    <h2 class="newsletter__popup--title">New Here ?</h2>
                    <div class="newsletter__popup--content">
                        <label class="newsletter__popup--content--desc">Signup and discover a great amount of new opportunities.</label>
                        <div class="newsletter__popup--subscribe" id="frm_subscribe">
                            <a href="<?php echo SITE_URL; ?>login.html">Login</a> <a href="<?php echo SITE_URL; ?>login.html">Signup</a>
                            <!--<form action="" method='post' id="newsletterpopup" onsubmit="return newsletter_validation('newsletterpopup')" class="newsletter__popup--subscribe__form" >-->
                            <!--    <div class="newsletter__subscribe">    -->
                                    <!--<input class="newsletter__popup--subscribe__input" placeholder="Enter you email address here..." name='email' type="email" required='' maxlength="200">-->
                            <!--     <input type="submit" class="newsletter__subscribe--button" value="Login">-->
                            <!--     <input type="submit" class="newsletter__subscribe--button" value="Signup">-->
                                    <!--<p class="text-success message"></p>-->
                            <!--    </div>    -->
                            <!--</form>  -->
                            <!--<div class="newsletter__popup--footer d-flex align-items-center" style="gap:5px;">-->
                            <!--    <input type="checkbox" id="newsletter__dont--show">-->
                            <!--    <label class="newsletter__popup--dontshow__again--text" for="newsletter__dont--show">Don't show this popup again</label>-->
                            <!--</div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- End News letter popup -->
    <script>
        const newsletterPopup = function() {
    	    let newsletterWrapper = document.querySelector(".newsletter__popup"),
    		newsletterCloseButton = document.querySelector(".newsletter__popup--close__btn"),
    		dontShowPopup = document.querySelector("#newsletter__dont--show"),
    		popuDontShowMode = localStorage.getItem("newsletter__show");
    	    newsletterWrapper && null == popuDontShowMode && window.addEventListener("load", event => {
        		setTimeout((function() {
        			document.body.classList.add("overlay__active"), newsletterWrapper.classList.add("newsletter__show"), document.addEventListener("click", (function(event) {
        				event.target.closest(".newsletter__popup--inner") || (document.body.classList.remove("overlay__active"), newsletterWrapper.classList.remove("newsletter__show"))
        			})), newsletterCloseButton.addEventListener("click", (function() {
        				document.body.classList.remove("overlay__active"), newsletterWrapper.classList.remove("newsletter__show")
        			})), dontShowPopup.addEventListener("click", (function() {
        				dontShowPopup.checked ? localStorage.setItem("newsletter__show", !0) : localStorage.removeItem("newsletter__show")
        			}))
        		}), 3e3)
    	    })
        };
        newsletterPopup();
    </script>
    <?php } ?>
    <?php } ?>
</body>

</html>



    
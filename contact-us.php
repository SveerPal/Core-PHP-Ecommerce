
    <main class="main__content_wrapper">
        
    <?php include('lib/templates/inner-banner.php')?>


<!--
        <section class="section--padding">
            <div class="container-fluid">
                <div class="row">
                    <?php //echo $pageDetails['description'];?>
                </div>
            </div>
        </section>
-->

    <main class="main__content_wrapper">
        
      

        <!-- Start contact section -->
        <section class="contact__section section--padding">
            <div class="container">
                <div class="section__heading text-center mb-40">
                    <h2 class="section__heading--maintitle">Get In Touch</h2>
                </div>
                <div class="main__contact--area position__relative">
                    
                    <div class="contact__form">
                        <h3 class="contact__form--title mb-40">Contact Me</h3>
                        <form class="contact__form--inner" action="" method="POST" name="contactus" id="contactus" onsubmit="return validation_v1('contactus')">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="contact__form--list mb-20">
                                        <label class="contact__form--label" for="input1">First Name <span class="contact__form--label__star">*</span></label>
                                        <input class="contact__form--input" name="name" id="name" required='' placeholder="Your First Name" type="text" maxlength="100">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="contact__form--list mb-20">
                                        <label class="contact__form--label" for="input2">Last Name <span class="contact__form--label__star">*</span></label>
                                        <input class="contact__form--input" name="lname" id="lname" required='' placeholder="Your Last Name" type="text" maxlength="100">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="contact__form--list mb-20">
                                        <label class="contact__form--label" for="input3">Phone Number <span class="contact__form--label__star">*</span></label>
                                        <input class="contact__form--input" type="tel" name="phone" id="phone" placeholder="Phone Number" required='' pattern=".{9,14}" maxlength="15">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="contact__form--list mb-20">
                                        <label class="contact__form--label" for="input4">Email <span class="contact__form--label__star">*</span></label>
                                        <input class="contact__form--input" type="email" name="email" id="email" placeholder="Email Address" required='' maxlength="100">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="contact__form--list mb-15">
                                        <label class="contact__form--label" for="input5">Write Your Message <span class="contact__form--label__star">*</span></label>
                                        <textarea class="contact__form--textarea" name="message" id="message" required='' placeholder="Write Your Message"></textarea>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" name="action" id="btn-success" value="Submit Now" class="send-btn contact-btn contact__form--btn primary__btn">
							<div class="message"></div>
                        </form>
                    </div>
                    <div class="contact__info border-radius-5">
                        <div class="contact__info--items">
                            <h3 class="contact__info--content__title text-white mb-15">Address</h3>
                            <div class="contact__info--items__inner d-flex">
                                <div class="contact__info--icon">
                                   <i class="fas fa-address-card"></i>
                                </div>
                                <div class="contact__info--content">
                                    <p class="contact__info--content__desc text-white">Address: <br><?php echo $FontEndData->getSettingsData('address'); ?> </p>
                                </div>
                            </div>
                        </div>
                        <div class="contact__info--items">
                            <h3 class="contact__info--content__title text-white mb-15">Contact Us</h3>
                            <div class="contact__info--items__inner d-flex">
                                <div class="contact__info--icon">
                                   <i class="fas fa-phone-volume"></i>
                                </div>
                                <div class="contact__info--content">
                                    <p class="contact__info--content__desc text-white">Change the design through a range <br> <a href="tel:<?php echo $FontEndData->getSettingsData('phone'); ?>"><?php echo $FontEndData->getSettingsData('phone'); ?></a>  </p>
                                </div>
                            </div>
                        </div>
                        <div class="contact__info--items">
                            <h3 class="contact__info--content__title text-white mb-15">Email Address</h3>
                            <div class="contact__info--items__inner d-flex">
                                <div class="contact__info--icon">
                                   <i class="fas fa-envelope-open-text"></i>
                                </div>
                                <div class="contact__info--content">
                                    <p class="contact__info--content__desc text-white">Mailto: <br> <a href="mailto:<?php echo $FontEndData->getSettingsData('email'); ?>"><?php echo $FontEndData->getSettingsData('email'); ?></a></p> 
                                </div>
                            </div>
                        </div>
                        <div class="contact__info--items">
                            <h3 class="contact__info--content__title text-white mb-15">Working Hours</h3>
                            <div class="contact__info--items__inner d-flex">
                                <div class="contact__info--icon">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="contact__info--content">
                                    <p class="contact__info--content__desc text-white">Open 10AM - 6PM <br> Monday to Sunday</p> 
                                </div>
                            </div>
                        </div>
                        <div class="contact__info--items">
                            <h3 class="contact__info--content__title text-white mb-15">Follow Us</h3>
                            <ul class="contact__info--social d-flex">
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
        </section>

   
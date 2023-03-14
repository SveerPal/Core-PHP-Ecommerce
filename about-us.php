
    <main class="main__content_wrapper">
        
    <?php include('lib/templates/inner-banner.php')?>


        <section class="section--padding">
            <div class="container-fluid">
                <div class="row">
                    <?php echo $pageDetails['description'];?>
                </div>
            </div>
        </section>

        <!--<section class="deals__banner--section section--padding pt-0">-->
        <!--    <div class="container-fluid">-->
        <!--        <div class="deals__banner--inner banner__bg3">-->
        <!--            <div class="row row-cols-1 align-items-center">-->
        <!--                <div class="col">-->
        <!--                    <div class="deals__banner--content deals__content--style3  position__relative">-->
        <!--                        <span class="deals__content--style3__subtitle text__secondary">Hurry up and Get 25% Discount</span>-->
        <!--                        <h2 class="deals__content--style3__maintitle">Deals Of The Day</h2>-->
        <!--                        <p class="deals__content--style3__desc d-none  d-md-block mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, <br> sed do eiusmod tempor incididunt ut labore </p>-->
        <!--                        <div class="deals__countdown--style3 d-flex" data-countdown="Sep 30, 2022 00:00:00"></div>-->
        <!--                        <a class="countdown__style3--btn primary__btn" href="#">Show Collection-->
        <!--                            <svg class="primary__btn--arrow__icon" xmlns="http://www.w3.org/2000/svg" width="20.2" height="12.2" viewBox="0 0 6.2 6.2">-->
        <!--                            <path d="M7.1,4l-.546.546L8.716,6.713H4v.775H8.716L6.554,9.654,7.1,10.2,9.233,8.067,10.2,7.1Z" transform="translate(-4 -4)" fill="currentColor"></path>-->
        <!--                            </svg>-->
        <!--                        </a>-->
        <!--                        <br>-->

        <!--                    </div>-->
        <!--                </div>-->
        <!--            </div>-->
        <!--        </div>-->
        <!--    </div>-->
        <!--</section>-->

        <?php 
            $faqs=$FontEndData->getFaqList(); 
            if($faqs){
        ?>        
                
        
        <section class="faq__section section--padding">
            <div class="container-fluid">
                <div class="faq__section--inner">
                    <div class="face__step one border-bottom" id="accordionExample">
                        <h2 class="face__step--title h3 mb-30">Frequently Asked Question</h2>
                        <div class="row">
                            <?php foreach($faqs as $faq){ ?>
                            <div class="col-lg-6">
                                <div class="accordion__container">
                                    <div class="accordion__items">
                                        <h2 class="accordion__items--title">
                                            <button class="faq__accordion--btn accordion__items--button"><?php echo $faq['title']; ?>
                                            
                                                <i class="fas fa-caret-down accordion__items--button__icon"></i>
                                            </button>
                                        </h2>
                                        <div class="accordion__items--body">
                                            <p class="accordion__items--body__desc"><?php echo $faq['description']; ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            
                        </div>
                    </div>
                </div>   
            </div>     
        </section>
        <?php        
            }
        ?>

    </main>


  
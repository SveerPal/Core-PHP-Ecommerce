<?php include('includes/header.php'); ?>
    <main class="main__content_wrapper">
        <!-- Start slider section -->
        <section class="hero__slider--section color-scheme-2">
            <div class="hero__slider--inner hero__slider--activation swiper">
                <div class="hero__slider--wrapper swiper-wrapper">
                    <?php 
                    $sliders=$FontEndData->getSliderList();
                    ?>
                    <?php foreach($sliders as $slider){ ?>
                    <div class="swiper-slide ">
                        <div class="hero__slider--items home2__slider--bg" style="background: url(<?php echo UPLOADS.'sliders/'.$slider['photo']; ?>);
                        background-repeat: no-repeat;background-attachment: scroll;
                        background-position: center center;background-size: cover;">
                            <div class="container-fluid">
                                <div class="hero__slider--items__inner hero__slider--bg2__inner">
                                    <div class="row row-cols-1">
                                        <div class="col">
                                            <div class="slider__content">
                                                <p class="slider__content--desc desc1 text__secondary2 mb-15"><?php echo $slider['heading_1']; ?></p> 
                                                <h2 class="slider__content--maintitle h1"> <?php echo $slider['heading_2']; ?></h2>
                                                <p class="slider__content--desc desc2 d-sm-2-none mb-40"><?php echo $slider['description']; ?></p>    
                                                <a class="bg__secondary2 slider__btn primary__btn" href="<?php echo $slider['url']; ?>"><?php echo $slider['label']; ?> <i class="fal fa-arrow-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <div class="swiper__nav--btn swiper-button-next"></div>
                <div class="swiper__nav--btn swiper-button-prev"></div>
            </div>
        </section>
        <!-- End slider section -->

      
        <!-- Start product section -->
        <section class="product__section section--padding color-scheme-2 pt-0" id="arrivals">
            <div class="container-fluid">
                <div class="section__heading text-center mb-35">
                    <h2 class="section__heading--maintitle style2">New Arrivals</h2>
                </div>
                <div class="product__section--inner">
                    <div class="row row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-2 mb--n30">
                        <?php 
                        $products=$FontEndData->getProductList(10);
                        ?>
                        <?php foreach($products as $product){ ?>
                        <div class="col ">
                            <?php include('lib/templates/product-list.php')?>
                        </div>
                        <?php } ?>
                        
                    </div>
                </div>
            </div>
        </section>
        <!-- End product section -->

        <!-- Start banner section -->
<!--
        <section class="banner__section banner__discount section--padding color-scheme-2 pt-0">
            <div class="container-fluid">
                <div class="banner__discount--inner position__relative">
                    <div class="row row-cols-sm-2 row-cols-1">
                        <div class="col">
                            <div class="banner__items banner__discount--items position__relative">
                                <a class="banner__items--thumbnail " href="<?php echo SITE_URL ;?>shop.html"><img class="banner__items--thumbnail__img" src="assets/img/banner/banner5.jpg" alt="banner-img"></a>
                            </div>
                        </div>
                        <div class="col">
                            <div class="banner__items banner__discount--items position__relative">
                                <a class="banner__items--thumbnail " href="<?php echo SITE_URL ;?>shop.html"><img class="banner__items--thumbnail__img" src="assets/img/banner/banner1.png" alt="banner-img"></a>
                            </div>
                        </div>
                    </div>
                    <div class="banner__discount--content text-center">
                        <span class="banner__discount--content__subtitle">Summer Collection 2022</span>
                        <h2 class="banner__discount--content__title h3">Get 35% Discount For <br>
                            Couple Special</h2>
                        <a class="banner__discount--content__link" href="<?php echo SITE_URL ;?>shop.html">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </section>
-->
        <!-- End banner section -->
        
        
        <section class="banner__section banner__discount section--padding color-scheme-2 pt-0">
            <div class="container-fluid">
                <div class="banner__discount--inner position__relative">
                    <div class="row row-cols-sm-2 row-cols-1">
                        <div class="col">
                            <div class="banner__items banner__discount--items position__relative">
                                <a class="banner__items--thumbnail " href="#"><img class="banner__items--thumbnail__img" src="assets/img/banner/banner5.png" alt="banner-img"></a>
                            </div>
                        </div>
                        <div class="col">
                            <div class="banner__items banner__discount--items position__relative">
                                <a class="banner__items--thumbnail " href="#"><img class="banner__items--thumbnail__img" src="assets/img/banner/banner6.png" alt="banner-img"></a>
                            </div>
                        </div>
                    </div>
                    <div class="banner__discount--content text-center">
                        <span class="banner__discount--content__subtitle">Summer Collection 2022</span>
                        <h2 class="banner__discount--content__title h3">Get 35% Diseount For <br>
                            Couple Special</h2>
                        <a class="banner__discount--content__link" href="shop.php">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </section>
        
        
        <!-- Start product section -->
        <section class="product__section section--padding pt-0">
            <div class="container-fluid">
                <div class="section__heading text-center mb-50">
                    <h2 class="section__heading--maintitle">Our Best Seller</h2>
                </div>
                <div class="product__section--inner product__swiper--activation swiper">
                    <div class="swiper-wrapper">

                        <?php 
                        $products=$FontEndData->getBestSellerProductList(10);
                        ?>
                        <?php foreach($products as $product){ ?>
                        <div class="swiper-slide">
                            <?php include('lib/templates/product-list.php')?>
                        </div>
                        <?php } ?>
                        
                    </div>
                    <div class="swiper__nav--btn swiper-button-next"></div>
                    <div class="swiper__nav--btn swiper-button-prev"></div>
                </div>
            </div>
        </section>
        <!-- End product section -->
        
        
          <!-- Start deals banner section -->
        <!-- <section class="deals__banner--section section--padding pt-0">
            <div class="container-fluid">
                <div class="deals__banner--inner banner__bg3">
                    <div class="row row-cols-1 align-items-center">
                        <div class="col">
                            <div class="deals__banner--content deals__content--style3  position__relative">
                                <span class="deals__content--style3__subtitle text__secondary">Hurry up and Get 25% Discount</span>
                                <h2 class="deals__content--style3__maintitle">Deals Of The Day</h2>
                                <p class="deals__content--style3__desc d-none  d-md-block mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, <br> sed do eiusmod tempor incididunt ut labore </p>
                                <div class="deals__countdown--style3 d-flex" data-countdown="Sep 30, 2022 00:00:00"></div>
                                <a class="countdown__style3--btn primary__btn" href="#">Show Collection
                                    <svg class="primary__btn--arrow__icon" xmlns="http://www.w3.org/2000/svg" width="20.2" height="12.2" viewBox="0 0 6.2 6.2">
                                    <path d="M7.1,4l-.546.546L8.716,6.713H4v.775H8.716L6.554,9.654,7.1,10.2,9.233,8.067,10.2,7.1Z" transform="translate(-4 -4)" fill="currentColor"></path>
                                    </svg>
                                </a>
                                <br>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->
        <!-- End deals banner section -->


       <!-- Start product section -->
        <section class="new__product--section section--padding pt-0">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-lg-4 col-md-5">
                        <div class="product__collection--content">
                            <?php $newarrival=$FontEndData->getProductCategory(16);?>
                            <h2 class="product__collection--content__title"><?php echo $newarrival['name'];?></h2>
                            <p class="product__collection--content__desc"><?php echo $newarrival['description'];?></p>
                            <a class="product__collection--content__btn primary__btn btn__style3" href="<?php echo SITE_URL.'category/'. $newarrival['cat_slug'];?>.html">View More</a>  
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="new__product--sidebar position__relative">
                            <div class=" product__swiper--column3 swiper">
                                <div class="swiper-wrapper">
                                    <?php 
                                    $newarrivalproducts=$FontEndData->getProductListCategory(16,15);
                                    
                                    if($newarrivalproducts){
                                        foreach($newarrivalproducts as $newarrivalproduct){ 
                                    ?>
                                    <div class="swiper-slide">
                                        <div class="new__product--items">
                                            <div class="new__product--thumbnail">
                                                <a class="new__product--thumbnail__link" href="<?php echo SITE_URL;?>product/<?php echo $newarrivalproduct['slug'];?>.html">
                                                    <img class="new__product--thumbnail__img" src="<?php echo UPLOADS.'products/'.$newarrivalproduct['photo']; ?>" alt="<?php echo $newarrivalproduct['name']; ?>">
                                                </a>
                                            </div>
                                            <div class="new__product--content text-center">
                                                <h3 class="new__product--content__title"><a href="<?php echo SITE_URL;?>product/<?php echo $newarrivalproduct['slug'];?>.html"><?php echo $newarrivalproduct['name']; ?></a></h3>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } }  ?>
                                </div>
                            </div>
                            <div class="swiper__nav--btn style3 swiper-button-next"></div>
                            <div class="swiper__nav--btn style3 swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End product section -->
        

   
        
        <section class="testimonial__section section--padding pt-0">
            <div class="container-fluid">
               <div class="testimonial__bg--inner testimonial__activation--column1 swiper">
                    <div class="swiper-wrapper">
                        <?php 
                        $testimonials=$FontEndData->getTestimonialList(3);
                        ?>
                        <?php foreach($testimonials as $testimonial){ ?>
                        <div class="swiper-slide">
                            <div class="testimonial__items--style2 testimonial__items text-center">
                                <div class="testimonial__items--style2__thumbnail mb-10">
                                    <img class="testimonial__items--style2__thumbnail--img border-radius-50" src="<?php echo UPLOADS.'testimonials/'.$testimonial['photo']; ?>" alt="<?php echo $testimonial['name']; ?>">
                                </div>
                                <div class="testimonial__items--content">
                                    <h2 class="testimonial__items--title h3"><?php echo $testimonial['name']; ?></h2>
                                    <span class="testimonial__items--subtitle"><?php echo $testimonial['designation']; ?></span>
                                    <p class="testimonial__items--desc style2"><?php echo $testimonial['message']; ?></p>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="testimonial__pagination style2 swiper-pagination"></div>
                </div>
            </div>
        </section>

      

        <!-- Start blog section -->
        <!-- <section class="blog__section section--padding color-scheme-2 pt-0" id="blog">
            <div class="container-fluid">
                <div class="section__heading text-center mb-40">
                    <h2 class="section__heading--maintitle style2">From The Blog</h2>
                </div>
                <div class="blog__section--inner blog__swiper--activation swiper">
                    <div class="swiper-wrapper">
                        <?php 
                       // $blogs=$FontEndData->getBlogList(4);
                        ?>
                        <?php //foreach($blogs as $blog){ ?>
                        <div class="swiper-slide">
                            <div class="blog__items">
                                <div class="blog__thumbnail">
                                    <a class="blog__thumbnail--link" href="#">
                                        <img class="blog__thumbnail--img" src="<?php //echo UPLOADS.'blogs/'.$blog['photo']; ?>" alt="<?php //echo $blog['alt'];?>">
                                    </a>
                                </div>
                                <div class="blog__content style2">
                                    <span class="blog__content--meta"><?php //echo date('M d, Y',strtotime($blog['createDate']));?></span>
                                    <h3 class="blog__content--title style2"><a href="#"><?php //echo $blog['name'];?></a></h3>
                                    <a class="blog__content--btn style2 primary__btn" href="#">Read more </a>
                                </div>
                            </div>
                        </div>
                        <?php
                          //  }
                        ?>
                    </div>
                    <div class="swiper__nav--btn swiper-button-next"></div>
                    <div class="swiper__nav--btn swiper-button-prev"></div>
                </div>
            </div>
        </section> -->
        <!-- End blog section -->
        


    </main>



    
<?php include('includes/footer.php'); ?>

   
 
 
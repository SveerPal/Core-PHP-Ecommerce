<main class="main__content_wrapper">
<?php include('lib/templates/inner-banner.php')?>
		<?php 
		if(isset($pageDetails['photo']) && $pageDetails['photo']==''){
			$pageDetails['photo'] = 'not-found.jpg';
		} ?>
		<?php 
		$added_wishlist = 0;
		if(isset($_SESSION["wish_list"])){
			$wishlist_array = array_column($_SESSION["wish_list"], 'code');
			if(in_array($pageDetails['id'],$wishlist_array)){
				$added_wishlist = 1;
			}
		}
		?>
        <!-- Start product details section -->
        <section class="product__details--section section--padding ezzz">
            <div class="container">
                <div class="row row-cols-lg-2 row-cols-md-2">
                    <div class="col">
                        <div class="product__details--media">
                            <div class="product__media--preview  swiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="product__media--preview__items">
                                            <a class="product__media--preview__items--link glightbox" data-gallery="product-media-preview" href="<?php echo UPLOADS.'products/'.$pageDetails['photo']; ?>">
                                            <img class="product__media--preview__items--img" src="<?php echo UPLOADS.'products/'.$pageDetails['photo']; ?>" alt="product-media-img"></a>
                                            <!--<div class="product__media--view__icon">-->
                                            <!--    <a class="product__media--view__icon--link glightbox" href="<?php echo UPLOADS.'products/'.$pageDetails['photo']; ?>" data-gallery="product-media-preview">-->
                                            <!--       <i class="far fa-search"></i>-->
                                            <!--    </a>-->
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    
                                    <?php 
                                    $galleries=$FontEndData->getProductDetailGallery($pageDetails['id']);
                                    if($galleries){
                                    ?>
                                    <?php foreach($galleries as $gallery){ ?>


                                    <div class="swiper-slide">
                                        <div class="product__media--preview__items">
                                            <a class="product__media--preview__items--link glightbox" data-gallery="product-media-preview" href="<?php echo UPLOADS.'products/'.$gallery['gal_photo']; ?>">
                                                <img class="product__media--preview__items--img" src="<?php echo UPLOADS.'products/'.$gallery['gal_photo']; ?>" alt="<?php echo $pageDetails['name']; ?>"></a>
                                            <!--<div class="product__media--view__icon">-->
                                            <!--    <a class="product__media--view__icon--link glightbox" href="<?php echo UPLOADS.'products/'.$gallery['gal_photo']; ?>" data-gallery="product-media-preview">-->
                                            <!--        <i class="far fa-search"></i> -->
                                            <!--    </a>-->
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <?php }} ?>
                                    
                                </div>
                            </div>
                            <div class="product__media--nav swiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="product__media--nav__items">
                                            <img class="product__media--nav__items--img" src="<?php echo UPLOADS.'products/'.$pageDetails['photo']; ?>" alt="<?php echo $pageDetails['name']; ?>">
                                        </div>
                                    </div>
                                    <?php 
                                    $galleries=$FontEndData->getProductDetailGallery($pageDetails['id']);
                                   
                                    if($galleries){
                                    ?>
                                    <?php foreach($galleries as $gallery){ ?>
                                    <div class="swiper-slide">
                                        <div class="product__media--nav__items">
                                            <img class="product__media--nav__items--img" src="<?php echo UPLOADS.'products/'.$gallery['gal_photo']; ?>" alt="<?php echo $pageDetails['name']; ?>">
                                        </div>
                                    </div>
                                    <?php }} ?>                                    
                                </div>
                                <div class="swiper__nav--btn swiper-button-next"></div>
                                <div class="swiper__nav--btn swiper-button-prev"></div>
                            </div>
                        </div>
                    </div>   
                    <div class="col">
                        <div class="product__details--info">
                           
                                <h2 class="product__details--info__title mb-15"><?php echo $pageDetails['name']; ?></h2>
								<?php 
								$reviews= $FontEndData->getProductReviews($pageDetails['id']); 
								if($reviews){
								$avg_rew = ($reviews['total_rating']/$reviews['total_user']);
								$roundup_rew = ceil($avg_rew);
								$roundup_rew = number_format($avg_rew,1);
								?>
								<div class="avg-reviews" title="<?php echo $roundup_rew; ?> average based on <?php echo $reviews['total_user'];?> reviews.">
								<?php 
								for($i=0; $i<5;$i++){
									$selected = '';
									if($i < $roundup_rew){
										$selected = 'fas fa-star checked';
									}else{
										$selected = 'fal fa-star checked';
									}
									echo '<span class="'.$selected.'"></span>';
								}
								}else{
									for($i=0; $i<5;$i++){
										$selected = '';
										
										echo '<span class="fal fa-star '.$selected.'"></span>';
									}
								}
								?>
								
								</div>
                                <div class="product__details--info__price mb-10">
                                    <?php $price= $FontEndData->getProductDetailPrice($pageDetails['id']);
                                   // print_r($price);
                                    ?>
                                <?php /* if($price['minVarRegPrice']!=''){ ?>                

                                    <?php if($price['minVarSalePrice']!=0){ ?>
                                    <span class="current__price"><?php echo CURRENCY.$price['minVarSalePrice']; ?></span>
                                    <span class="price__divided"></span>
                                    <span class="old__price"><?php echo CURRENCY.$price['maxVarSalePrice']; ?></span>
                                    <?php }else{?>
                                    <span class="current__price"><?php echo CURRENCY.$price['minVarRegPrice']; ?></span>
                                    <?php if($price['minVarRegPrice']!=$price['maxVarRegPrice']){ ?>
                                    <span class="price__divided"></span>
                                    <span class="current__price"><?php echo CURRENCY.$price['maxVarRegPrice']; ?></span>
                                    <?php } } ?> 
                                      

                                <?php } else{ ?>
                                    <?php if($price['sale_price']!=0){ ?>
                                    <span class="current__price"><?php echo CURRENCY.$price['sale_price']; ?></span>
                                    <span class="price__divided"></span>
                                    <span class="old__price"><?php echo CURRENCY.$price['regular_price']; ?></span>
                                    <?php }else{?>
                                    <span class="current__price"><?php echo CURRENCY.$price['regular_price']; ?></span>
                                    <?php } ?>
                                <?php } ?>
                                   <?php  */ ?>
								     <?php if($price['sale_price']!=0){ ?>
								     <span class="old__price"><?php echo CURRENCY.$price['regular_price']; ?></span>
									 <span class="price__divided"></span>
									 <span class="current__price"><?php echo CURRENCY.$price['sale_price']; ?></span>
									 <?php }else{ ?>
                                    
                                    <span class="current__price"><?php echo CURRENCY.$price['regular_price']; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="product__details--info__rating d-flex align-items-center mb-15">
                                    
                                      <!--<fieldset>
                                        <span class="star-cb-group">
                                          <input type="radio" id="rating-5" name="rating" value="5" /><label for="rating-5">5</label>
                                          <input type="radio" id="rating-4" name="rating" value="4" checked="checked" /><label for="rating-4">4</label>
                                          <input type="radio" id="rating-3" name="rating" value="3" /><label for="rating-3">3</label>
                                          <input type="radio" id="rating-2" name="rating" value="2" /><label for="rating-2">2</label>
                                          <input type="radio" id="rating-1" name="rating" value="1" /><label for="rating-1">1</label>
                                          <input type="radio" id="rating-0" name="rating" value="0" class="star-cb-clear" /><label for="rating-0">0</label>
                                        </span>
                                      </fieldset>-->
                                   
                                </div>
                                <p class="product__details--info__desc mb-15"><?php echo $pageDetails['short_description']; ?></p>
                                <div class="product__variant">
                                    <input type="hidden" id="product_id_detail" name="product_id_detail" value="<?php echo $pageDetails['id'];?>">
                                    <?php 
                                    //print_r($pageDetails['products_attributes_id']);
                                    if($pageDetails['product_type']=='Variation'){
                                        $varattval="";

                                        $variationproducts=$FontEndData->getProductDetailVariation($pageDetails['id']);
                                        if($variationproducts){
                                            foreach($variationproducts as $variationproduct){
                                                $varattval.=$variationproduct['variation_value'].',';
                                            }
                                        }    
                                       
                                        $varattval=rtrim($varattval,',');
                                        $varattvalArr=array_unique(explode(',',$varattval));
                                        $varattvalArrnew="'".implode("','",$varattvalArr)."'";

                                       
                                        $attributes=$FontEndData->getProductDetailAttribute($pageDetails['products_attributes_id']);
                                        if($attributes){
                                            foreach($attributes as $attribute){
                                          
										 if($attribute['name']=="Size")
												{
													$variationcls="prodductvari";
													$variationnone="";
												}else{
													
													$variationcls="noprodductvari";
													$variationnone="style='display:none;'";
												}
										
                                        ?>
										<?php if($attribute['name']=="Size")
												{ ?>
                                        <div class="product__variant--list mb-10">
                                            <fieldset class="variant__input--fieldset">
											 
                                                <legend class="product__variant--title mb-8" <?php echo $variationnone; ?> ><?php echo $attribute['name']; ?> :</legend>
                                                <?php
												}
                                                //print_r($pageDetails['products_attributes_id']);
                                                $attributesvalues=$FontEndData->getProductDetailAttributeValue($attribute['id'],$varattvalArrnew);
                                               
                                                if($attributesvalues){
                                                    foreach($attributesvalues as $attributesvalue){
                                                        
                                                ?> 
                                               <?php if($attribute['name']=="Size")
												{ ?>
                                                <input class="<?php echo $variationcls; ?>" <?php echo $variationnone; ?> onclick="varationproducts(this)" value="<?php echo $attributesvalue['id']; ?>" id="<?php echo $attributesvalue['code']; ?>" name="<?php echo $attribute['code'] ;?>" type="radio">
                                               
                                                <label attri-name="<?php echo $attribute['code'] ;?>" <?php echo $variationnone; ?> attri="<?php echo $attribute['id'] ;?>" attri-value="<?php echo $attributesvalue['id'] ;?>" class="variant__size--value color_size <?php echo $attributesvalue['name']; ?> red variationproduct" for="<?php echo $attributesvalue['code']; ?>" title="<?php echo $attributesvalue['name']; ?>">
                                                    <?php if($attributesvalue['photo']!=''){ ?>
                                                    <img class="variant__size--value__img" src="<?php echo UPLOADS.'products_attributes/'.$attributesvalue['photo']; ?>" alt="<?php echo $attributesvalue['name']; ?>">
                                                    <?php }else{ ?>
                                                    <?php echo $attributesvalue['name']; ?>
                                                    <?php } ?>
                                                </label>
                                                <?php 
																							
                                                    }
                                                }
                                                ?>
                                            </fieldset>
                                            
                                        </div>
                                        <?php 
												}										
                                            }
                                        }
                                    ?>
                                        <!--<span class="variation-product-price"></span> <br/>!--->
                                        <input type="hidden" name="variation_id" id="variation_id" value="">
                                        <span class="msgvar text-danger"></span>
                                        <div class="product__variant--list quantity d-flex align-items-center mb-20">
                                            <div class="quantity__box">
                                                <button onclick="decrement()" class="quantity__value decrease">-</button>
                                                <input type="hidden" id="productqty" name="qty" value="1" min="1">
                                                <h2 id="counting" class="quantity__value">1</h2>
                                                <button onclick="increment()" class="quantity__value increase">+</button>
                                                
                                            </div>
                                            
                                            <button class="quickview__cart--btn primary__btn cust-buy varaddtocart" type="button" id="varaddtocart">Add To Cart</button> 
                                            
                                            
                                        </div>
                                        <div class="product__variant--list mb-15">
											<?php if($added_wishlist > 0){ ?>
												<i class="fa fa-heart"></i>
                                                Added to Wishlist
											<?php }else{ ?>
                                            <a class="variant__wishlist--icon mb-15" href="javascript:void(0)" onclick="wishListAction(<?php echo $pageDetails['id'];?>)" title="Add to wishlist">
                                                <i class="fal fa-heart"></i>
                                                Add to Wishlist
                                            </a>
											<?php } ?>
                                            <button class="variant__buy--now__btn primary__btn varbuynow"  type="submit" id="varbuynow">Buy it now</button>
                                            
                                        </div>
                                    <?php 
                                    }else{ 
                                        if($pageDetails['stock']){
                                    ?>
                                                <div class="product__variant--list quantity d-flex align-items-center mb-20">
                                                    <div class="quantity__box">
                                                        <button onclick="decrement()" class="quantity__value decrease">-</button>
                                                        <input type="hidden" id="productqty" name="qty" value="1" min="1">
                                                        <h2 id="counting" class="quantity__value">1</h2>
                                                        <button onclick="increment()" class="quantity__value increase">+</button>
                                                        
                                                    </div>
                                                    
                                                    <button class="quickview__cart--btn primary__btn cust-buy addtocart" type="button" id="addtocart">Add To Cart</button> 
                                                    
                                                    
                                                </div>
                                                <div class="product__variant--list mb-15">
													
											<?php if($added_wishlist > 0){ ?>
												<i class="fa fa-heart"></i>
                                                Added to Wishlist
											<?php }else{ ?>
                                                    <a class="variant__wishlist--icon mb-15" href="javascript:void(0)" onclick="wishListAction(<?php echo $pageDetails['id'];?>)" title="Add to wishlist">
                                                        <i class="fal fa-heart"></i>
                                                        Add to Wishlist
                                                    </a>
											<?php } ?>
                                                    <button class="variant__buy--now__btn primary__btn buynow"  type="submit" id="buynow">Buy it now</button>
                                                    
                                                </div>
                                        <?php }else{ ?>
                                            <h5 class="text-danger mb-5">Out Of Stock</h5>
                                        <?php } ?>    
                                    <?php } ?>



                                    <div class="product__details--info__meta">
                                        <p class="product__details--info__meta--list "><strong>Product Code:</strong> 
                                            <span class="variation_product_code"><?php echo $pageDetails['product_code']; ?></span> 
                                        </p>
                                        <p class="product__details--info__meta--list "><strong>SKU:</strong>  
                                            <span class="variation_sku"><?php echo $pageDetails['sku']; ?></span> 
                                        </p>
                                        <p class="product__details--info__meta--list"><strong>Fabric:</strong>  
                                            <span><?php echo $FontEndData->getProductDetailStyleFabric($pageDetails['fabric_id'],'products_fabrics'); ?></span> 
                                        </p>
                                        <p class="product__details--info__meta--list"><strong>Type:</strong>  
                                            <span><?php echo $FontEndData->getProductDetailStyleFabric($pageDetails['style_id'],'products_styles'); ?></span> 
                                        </p>
                                        <p class="product__details--info__meta--list "><strong>Size:</strong>  
                                            <span class="custom_size"></span> 
                                        </p>
                                     <?php

                                     if(!empty($pageDetails['color'])){ 
                                      $colors = $FontEndData->getProductDetailStyleColor($pageDetails['color'],'products_color'); 
                                      // print_r($colors);
                                      ?>
                                    <p class="product__details--info__meta--list "><strong>Color:</strong>  
                                         <span class="variation_color"><?php echo $colors; ?></span> 
                                        </p>
                                    <?php } ?>
                                    </div>
                                    
                                    <div class="quickview__social d-flex align-items-center mb-15">
                                    <label class="quickview__social--title">Social Share:</label>
                                    <ul class="quickview__social--wrapper mt-0 d-flex">
                                        <li class="quickview__social--list">
                                            <a class="quickview__social--icon" target="_blank" href="http://www.facebook.com/sharer.php?u=<?php echo urlencode(SITE_URL.'product/'.$pageDetails['slug'].'.html') ?>">
                                                  <i class="fab fa-facebook-f"></i>
                                            </a>
                                        </li>
                                        <li class="quickview__social--list">
                                            <a class="quickview__social--icon" target="_blank" href="http://twitter.com/share?text=<?php echo $pageDetails['name'];?>&url=<?php echo SITE_URL;?>product/<?php echo $pageDetails['slug'];?>.html">
                                               <i class="fab fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="quickview__social--list">
                                            <a class="quickview__social--icon" target="_blank" href="http://pinterest.com/pin/create/button/?url=<?php echo urlencode (SITE_URL.'product/'.$pageDetails['slug'].'.html') ?>&media=<?php echo UPLOADS.'products/'.$pageDetails['photo']; ?>">
                                                     <i class="fab fa-pinterest"></i>
                                            </a>
                                        </li>
                                        <li class="quickview__social--list">
                                            <a class="quickview__social--icon" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo urlencode(SITE_URL.'product/'.$pageDetails['slug'].'.html') ?>">
                                                     <i class="fab fa-linkedin"></i>
                                            </a>
                                        </li>
                                        <!--<li class="quickview__social--list">-->
                                           
                                        <!--    <a class="quickview__social--icon" target="_blank" href="http://instagram.com/?u=<?php echo SITE_URL.'product/'.$pageDetails['slug'].'.html' ?>&media=<?php echo UPLOADS.'products/'.$pageDetails['photo']; ?>&description=<?php echo $pageDetails['name']; ?>">-->
                                        <!--             <i class="fab fa-instagram"></i>-->
                                        <!--    </a>-->
                                        <!--</li>-->
                                      
    
                                    </ul>
                                </div>
                                </div>
                                
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End product details section -->

        <!-- Start product details tab section -->
        <section class="product__details--tab__section section--padding">
            <div class="container">
                <div class="row row-cols-1">
                    <div class="col">
                        <ul class="product__details--tab d-flex mb-30">
                            <li class="product__details--tab__list active" data-toggle="tab" data-target="#description">Description</li>
                            <li class="product__details--tab__list" data-toggle="tab" data-target="#reviews">Product Reviews</li>
                            <?php if($pageDetails['additional_info']){ ?>
                            <li class="product__details--tab__list" data-toggle="tab" data-target="#information">Additional Info</li>
                            <?php } ?>
                            <!-- <li class="product__details--tab__list" data-toggle="tab" data-target="#custom">Custom Content</li> -->
                        </ul>
                        <div class="product__details--tab__inner border-radius-10">
                            <div class="tab_content">
                                <div id="description" class="tab_pane active show">
                                    <div class="product__tab--content">
                                        <?php echo preg_replace('/\\\\/', '', $pageDetails['description']);  ?>
                                    </div> 
                                </div>
                                <div id="reviews" class="tab_pane">
                                    <div class="product__reviews">
                                        <div class="product__reviews--header">
                                            <h2 class="product__reviews--header__title h3 mb-20">Customer Reviews</h2>
                                            <div class="reviews__ratting d-flex align-items-center">
                                                <div class="product__details--info__rating d-flex align-items-center">
                                                    
                                                    
                                                </div>
                                                
                                            </div>
                                            <a class="actions__newreviews--btn primary__btn" href="#writereview">Write A Review</a>
                                        </div>
                                        <div class="reviews__comment--area">
											<?php 
											$all_reviews = $FontEndData->getProductReviewslist($pageDetails['id']); 
											if($all_reviews){
											foreach($all_reviews as $key=>$value){
											?>
                                            <div class="reviews__comment--list d-flex">
                                                <div class="reviews__comment--thumb">
                                                    <img src="<?php echo SITE_URL; ?>assets/img/not-found-user.png" alt="comment-thumb">
                                                </div>
                                                <div class="reviews__comment--content">
                                                    <div class="reviews__comment--top d-flex justify-content-between">
                                                        <div class="reviews__comment--top__left avg-reviews">
                                                            <h3 class="reviews__comment--content__title h4"><?php echo stripcslashes($value['fld_name']); ?></h3>
                                                            <div class="product__details--info__rating d-flex align-items-center mb-15">
															<?php 
															$roundup_rew = trim($value['fld_rating']);
								
															for($i=0; $i<5;$i++){
																
																if($i < $roundup_rew){
																	$selected = 'fas fa-star checked';
																}else{
																	$selected = 'fal fa-star checked';
																}
																echo '<span class="'.$selected.'"></span>';
															}
															?>
															
																					 </div>
																					</div>
																					<span class="reviews__comment--content__date"><?php echo date("F d, Y", strtotime($value['fld_upload_date'])); ?></span>
																				</div>
																				<p class="reviews__comment--content__desc"><?php echo stripcslashes($value['fld_comments']); ?></p>
																			</div>
																		</div>
											<?php } } ?>
																		
																		
																		
                                        </div>
                                        <div id="writereview" class="reviews__comment--reply__area">
										<form method="post" class="form" onSubmit="return validate_review('reviewForm')" id="reviewForm" name="reviewForm">
                                             <h3 class="reviews__comment--reply__title mb-15">Add a review </h3>
                                                <div class="reviews__ratting d-flex align-items-center mb-20">
                                                    <div class="product__details--info__rating d-flex align-items-center mb-15">
                                    
										<fieldset>
                                        <span class="star-cb-group">
                                          <input type="radio" id="rating-5" name="rating" value="5" /><label for="rating-5">5</label>
                                          <input type="radio" id="rating-4" name="rating" value="4" /><label for="rating-4">4</label>
                                          <input type="radio" id="rating-3" name="rating" value="3" /><label for="rating-3">3</label>
                                          <input type="radio" id="rating-2" name="rating" value="2" /><label for="rating-2">2</label>
                                          <input type="radio" id="rating-1" name="rating" value="1" /><label for="rating-1">1</label>
                                          <input type="radio" id="rating-0" name="rating" value="0" class="star-cb-clear" /><label for="rating-0">0</label>
                                        </span>
                                      </fieldset>
                                     
                                      </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 mb-10">
                                                        <textarea class="reviews__comment--reply__textarea" placeholder="Your Comments...."  name="review_notes" id="review_notes"></textarea>
                                                    </div> 
													<?php if(isset($_SESSION['userid']) && $_SESSION['userid']!=''){ ?>
													<input type="hidden" name="full_name" id="full_name" value="<?php echo isset($_SESSION['username'])?$_SESSION['username']:''; ?>">
													<input type="hidden" name="email_id" id="email_id" value="<?php echo isset($_SESSION['useremail'])?$_SESSION['useremail']:''; ?>">
													<?php }else{ ?>
                                                    <div class="col-lg-6 col-md-6 mb-15">
                                                        <label>
                                                            <input class="reviews__comment--reply__input" placeholder="Your Name...." type="text" name="full_name" id="full_name" >
                                                        </label>
                                                    </div>  
                                                    <div class="col-lg-6 col-md-6 mb-15">
                                                        <label>
                                                            <input class="reviews__comment--reply__input" placeholder="Your Email...." type="email" name="email_id" id="email_id" >
                                                        </label>
                                                    </div>  
													<?php } ?>
                                                </div>
                                                <button class="reviews__comment--btn text-white primary__btn" data-hover="Submit" type="submit">SUBMIT</button>
												<input type="hidden" name="product_id" value="<?php echo $pageDetails['id']; ?>" />
												<p class="message"></p>
                                            </form> 
                                        </div> 
                                    </div>    
                                </div>
                                <?php if($pageDetails['additional_info']){ ?>
                                <div id="information" class="tab_pane">
                                    <div class="product__tab--conten">
                                        <div class="product__tab--content__step mb-30">
                                            <?php echo $pageDetails['additional_info']; ?>
                                        </div>
                                    </div> 
                                </div>
                                <?php } ?>
                                <!-- <div id="custom" class="tab_pane">
                                    <div class="product__tab--content">
                                        <div class="product__tab--content__step mb-30">
                                            <h2 class="product__tab--content__title h4 mb-10">Nam provident sequi</h2>
                                            <p class="product__tab--content__desc">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nam provident sequi, nemo sapiente culpa nostrum rem eum perferendis quibusdam, magnam a vitae corporis! Magnam enim modi, illo harum suscipit tempore aut dolore doloribus deserunt voluptatum illum, est porro? Ducimus dolore accusamus impedit ipsum maiores, ea iusto temporibus numquam eaque mollitia fugiat laborum dolor tempora eligendi voluptatem quis necessitatibus nam ab?</p>
                                        </div>
                                    </div> 
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End product details tab section -->
        
        <!-- Start product section -->
        <section class="product__section section--padding pt-0">
            <div class="container-fluid">
                <div class="section__heading text-center mb-50">
                    <h2 class="section__heading--maintitle">Our Best Seller</h2>
                </div>
                <div class="product__section--inner product__swiper--activation swiper">
                    <div class="swiper-wrapper">
                        <?php //echo $pageDetails['category_id'];
                        $products=$FontEndData->getBestSellerProductList(5);
                        if($products){
                        ?>
                        <?php foreach($products as $product){ ?>
                        <div class="swiper-slide">
                            <?php include('lib/templates/product-list.php')?>
                        </div>
                        <?php } } ?>
                    </div>
                    <div class="swiper__nav--btn swiper-button-next"></div>
                    <div class="swiper__nav--btn swiper-button-prev"></div>
                </div>
            </div>
        </section>
        <!-- End product section -->
</main>
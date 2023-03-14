<?php 
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
?>
<section class="product__section section--padding color-scheme-2 pt-0" id="arrivals">
<div class="container-fluid">
<div class="section__heading text-center mb-35">
<h2 class="section__heading--maintitle style2">My Wishlist</h2>
</div>
<div class="product__section--inner">
<div class="row row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-2 mb--n30">
<?php
$products=$FontEndData->getWishList();
if(isset($products) && count($products) > 0){
foreach($products as $product){
?>
<div class="col ">
<div class="product__items ">
    <div class="product__items--thumbnail">
        <a class="product__items--link" href="<?php echo SITE_URL;?>product/<?php echo $product['slug'];?>.html">
            <img class="product__items--img product__primary--img" src="<?php echo UPLOADS.'products/'.$product['photo']; ?>" alt="<?php echo $product['name']; ?>">
            <img class="product__items--img product__secondary--img" src="<?php echo UPLOADS.'products/'.$product['photo']; ?>" alt="<?php echo $product['name']; ?>">
        </a>
        <div class="product__badge">
            <?php if(($product['minVarSalePrice']!=0 || $product['minVarSalePrice']!=NULL) && $product['sale_price']!=0){ ?>
            <span class="product__badge--items sale">Sale</span>
            <?php } ?>
        </div>
        <?php if($product['product_type']=='Simple'){ ?>
            <a class="product__add-to__cart--btn__style2 " href="javascript:void(0)" onclick="cartAction('add','<?php echo $product['id']; ?>')">
                <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg" width="22.51" height="20.443" viewBox="0 0 14.706 13.534">
                    <g transform="translate(0 0)">
                        <g>
                        <path data-name="Path 16787" d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z" transform="translate(0 -463.248)" fill="currentColor"></path>
                        <path data-name="Path 16788" d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z" transform="translate(-1.191 -466.622)" fill="currentColor"></path>
                        <path data-name="Path 16789" d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z" transform="translate(-2.875 -466.622)" fill="currentColor"></path>
                        </g>
                    </g>
                </svg>
                <span class="add__to--cart__text" > + Add to cart</span>
            </a>
        <?php }else{ ?>
            <a class="product__add-to__cart--btn__style2 " href="<?php echo SITE_URL;?>product/<?php echo $product['slug'];?>.html">
                <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg" width="22.51" height="20.443" viewBox="0 0 14.706 13.534">
                    <g transform="translate(0 0)">
                        <g>
                        <path data-name="Path 16787" d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z" transform="translate(0 -463.248)" fill="currentColor"></path>
                        <path data-name="Path 16788" d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z" transform="translate(-1.191 -466.622)" fill="currentColor"></path>
                        <path data-name="Path 16789" d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z" transform="translate(-2.875 -466.622)" fill="currentColor"></path>
                        </g>
                    </g>
                </svg>
                <span class="add__to--cart__text" >Select Option</span>
            </a>
        <?php } ?>
        <ul class="product__items--action__style2">
			<li class="product__items--action__style2--list">
			<a class="product__items--action__style2--btn" href="javascript:void(0)" onclick="wishListActionRemove(<?php echo $product['id'];?>)">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
			</li>
            <li class="product__items--action__style2--list">
				
                <a class="product__items--action__style2--btn" data-open="modal1" href="<?php echo SITE_URL;?>product/<?php echo $product['slug'];?>.html">
                    <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg"  width="22.51" height="20.443" viewBox="0 0 512 512"><path d="M255.66 112c-77.94 0-157.89 45.11-220.83 135.33a16 16 0 00-.27 17.77C82.92 340.8 161.8 400 255.66 400c92.84 0 173.34-59.38 221.79-135.25a16.14 16.14 0 000-17.47C428.89 172.28 347.8 112 255.66 112z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/><circle cx="256" cy="256" r="80" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="32"/></svg>
                    <span class="visually-hidden">Quick View</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="product__items--content text-center">
        
        <h3 class="product__items--content__title h4">
            <a href="<?php echo SITE_URL;?>product/<?php echo $product['slug'];?>.html"><?php echo $product['name']; ?></a>
        </h3>
        <div class="product__items--price">
            <?php if($product['minVarRegPrice']!=''){?>
                

                <?php if($product['minVarSalePrice']!=0){ ?>
                <span class="current__price"><?php echo CURRENCY.$product['minVarSalePrice']; ?></span>
                <span class="price__divided"></span>
                <span class="old__price"><?php echo CURRENCY.$product['maxVarSalePrice']; ?></span>
                <?php }else{?>
                <span class="current__price"><?php echo CURRENCY.$product['minVarRegPrice']; ?></span>
                <?php if($product['minVarRegPrice']!=$product['maxVarRegPrice']){ ?>
                <span class="price__divided"></span>
                <span class="old__price"><?php echo CURRENCY.$product['maxVarRegPrice']; ?></span>
                <?php } } ?>   

            <?php }else{ ?>
                <?php if($product['sale_price']!=0){ ?>
                <span class="current__price"><?php echo CURRENCY.$product['sale_price']; ?></span>
                <span class="price__divided"></span>
                <span class="old__price"><?php echo CURRENCY.$product['regular_price']; ?></span>
                <?php }else{?>
                <span class="current__price"><?php echo CURRENCY.$product['regular_price']; ?></span>
                <?php } ?>
            <?php } ?>
        </div>
        
    </div>
</div>
</div>
<?php }
}else{ ?>


</div>
<div class="product__items--content text-center">
<p class="text-center">No Wishlist Found</p>
</div>
<?php } ?>
</div>
</div>
</section>
<!-- End product section -->
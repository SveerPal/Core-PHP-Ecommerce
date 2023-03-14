<?php 
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
if(isset($product['photo']) && $product['photo']!=''){
    $img=$product['photo'];
}else{
    $img='not-found.jpg';
}
?>
<div class="product__items ">
    <div class="product__items--thumbnail">
        <a class="product__items--link" href="<?php echo SITE_URL;?>product/<?php echo $product['slug'];?>.html">
            <img class="product__items--img product__primary--img" src="<?php echo UPLOADS.'products/'.$img; ?>" alt="<?php echo $product['name']; ?>" width="265" height="350">
            <!--<img class="product__items--img product__secondary--img" src="<?php echo UPLOADS.'products/'.$img; ?>" alt="<?php echo $product['name']; ?>">-->
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
        <?php     
        }
        ?>
        <ul class="product__items--action__style2">
            <li class="product__items--action__style2--list">
				<?php
				$added_wishlist = 0;
				if(isset($_SESSION["wish_list"])){
					$wishlist_array = array_column($_SESSION["wish_list"], 'code');
					if(in_array($product['id'],$wishlist_array)){
						$added_wishlist = 1;
					}
				}
				if($added_wishlist > 0){
					echo '<a class="product__items--action__style2--btn" href="javascript:void(0)"><i class="fa fa-heart"></i></a>';
				}else{
				?>
                <a class="product__items--action__style2--btn" href="javascript:void(0)" onclick="wishListAction(<?php echo $product['id'];?>)">
                    <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg" width="23.51" height="21.443" viewBox="0 0 512 512"><path d="M352.92 80C288 80 256 144 256 144s-32-64-96.92-64c-52.76 0-94.54 44.14-95.08 96.81-1.1 109.33 86.73 187.08 183 252.42a16 16 0 0018 0c96.26-65.34 184.09-143.09 183-252.42-.54-52.67-42.32-96.81-95.08-96.81z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"></path></svg>
                    <span class="visually-hidden">Wishlist</span> 
                </a>
				<?php } ?>
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
            <?php /* if($product['minVarRegPrice']!=''){ ?>
                

                <?php if($product['minVarSalePrice']>0){ ?>
                <span class="current__price"><?php echo CURRENCY.$product['minVarSalePrice']; ?></span>
                <span class="price__divided"></span>
                <span class="old__price"><?php echo CURRENCY.$product['maxVarSalePrice']; ?></span>
                <?php }else{?>
                <span class="current__price"><?php echo CURRENCY.$product['minVarRegPrice']; ?></span>
                <?php if($product['minVarRegPrice']!=$product['maxVarRegPrice']){ ?>
                <span class="price__divided"></span>
                <span class="current__price"><?php echo CURRENCY.$product['maxVarRegPrice']; ?></span>
                <?php } } ?>   

            <?php }else{ ?>
                <?php if($product['sale_price']!=0){ ?>
                <span class="current__price"><?php echo CURRENCY.$product['sale_price']; ?></span>
                <span class="price__divided"></span>
                <span class="old__price"><?php echo CURRENCY.$product['regular_price']; ?></span>
                <?php }else{?>
                <span class="current__price"><?php echo CURRENCY.$product['regular_price']; ?></span>
                <?php } ?>
            <?php }  */?>
			 <?php if($product['sale_price']!=0) { ?>
			<span class="old__price"><?php echo CURRENCY.$product['sale_price']; ?></span>
                <span class="price__divided"></span>
			 <?php } ?>
                <span class="current__price"><?php echo CURRENCY.$product['regular_price']; ?></span>
        </div>
        
    </div>
</div>
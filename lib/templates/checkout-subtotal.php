<aside class="checkout__sidebar sidebar">
    <div class="cart__table checkout__product--table">
        <table class="cart__table--inner">
            <tbody class="cart__table--body">
                <?php 
                $total_quantity = 0;
                
                if(isset($_SESSION["cart_item"])){ 
                $total_quantity = array_sum(array_column($_SESSION["cart_item"], 'quantity'));
                }
                $totalCountItems = $total_quantity;
                $message = '';
                if(isset($_SESSION["cart_item"])){
                    $sub_total = 0;
                    foreach ($_SESSION["cart_item"] as $key => $item) { 
                    $productvar_name = '';
                    $sellPrice = '';
                    if($item['fld_sale_price'] > 0){
                        $sellPrice = '<span class="old__price">'.CURRENCY.$item["fld_sale_price"].'</span>';
                    }
                    $productvariationName="";
                    if(isset($item['productvariationName'])){
                         $productvariationName=$item['productvariationName'];
                    }

                    $producturl = SITE_URL.'product/'.$item["fld_slug"].'.html';
                    $productvariationId = isset($item['productvariationId'])?$item['productvariationId']:0;
                    $sub_total += ($item['quantity']*$item['fld_price']);
                    $total_amount = $sub_total;
                    $discountrow="";
                    $discount_amount = 0;
                    if(isset($_SESSION['coupon']) && $_SESSION['coupon']['discount_amount'] !=''){
                        if(isset($_SESSION['coupon']['discount_type']) && $_SESSION['coupon']['discount_type'] == 'flat'){
                            $discount_amount = $_SESSION['coupon']['discount_amount'];
                        }else{
                            $discount_amount = ($sub_total*$_SESSION['coupon']['discount_amount'])/100;
                        }
                    
                    $discountrow= '<tr class="checkout__total--items"><td class="checkout__total--title text-left">Coupon Code ('.$_SESSION['coupon']['code'].') <a href="javascript:void(0)" onclick="removePromoCode()"><i class="fa fa-times" aria-hidden="true"></i></a> </td> <td id="discount_amount" class="checkout__total--calculated__text text-right"><b>'.CURRENCY.number_format((float)$discount_amount, 2, '.', '').'</b></td></tr>';
                    }
                    
                    $vat = ceil(($sub_total*GST)/100);
                    $total_amount =  (($sub_total)-$discount_amount);
                ?>
                    <tr class="cart__table--body__items">
                        <td class="cart__table--body__list">
                            <div class="product__image two  d-flex align-items-center">
                                <div class="product__thumbnail border-radius-5">
                                    <a href="<?php echo $producturl; ?>"><img class="border-radius-5" src="<?php echo SITE_URL ;?>admin/uploaded_files/products/<?php echo $item["fld_img_path"] ?>" alt="<?php echo $item["fld_title"]; ?>"></a>
                                    <span class="product__thumbnail--quantity"><?php echo $item["quantity"]; ?></span>
                                </div>
                                <div class="product__description">
                                    <h3 class="product__description--name h4"><a href="<?php echo $producturl; ?>"><?php echo $item["fld_title"]; ?></a></h3>
                                    <span class="product__description--variant text-dark"><?php echo $productvariationName;?></span>
                                </div>
                            </div>
                        </td>
                        <td class="cart__table--body__list">
                            <span class="cart__price"><?php echo CURRENCY. number_format((float)$item['fld_price'], 2, '.', ''); ?></span>
                        </td>
                    </tr>
                <?php }
                } 
                ?>
                
            </tbody>
        </table> 
    </div>
    <div class="checkout__discount--code" style="display:none;">
        <form class="d-flex" action="" method="post" id="couponForm" onSubmit="return apply_coupon()">
            <p class="message text-danger"></p>
            <label>
                <input class="checkout__discount--code__input--field border-radius-5" placeholder="Gift card or discount code"  type="text" name="coupon_code" required = "" id="coupon_code" >
            </label>
            <button class="checkout__discount--code__btn primary__btn border-radius-5" type="submit">Apply</button>
        </form>
    </div>
    <div class="checkout__total">
        <table class="checkout__total--table">
            <tbody class="checkout__total--body">
                <tr class="checkout__total--items">
                    <td class="checkout__total--title text-left">Subtotal </td>
                    <td class="checkout__total--amount text-right"><?php echo CURRENCY. number_format((float)($sub_total-$vat), 2, '.', ''); ?></td>
                </tr>
                <?php  
                echo $discountrow;
                ?>
                <tr class="checkout__total--items">
                    <td class="checkout__total--title text-left">GST (<?php echo GST ?>%)</td>
                    <td class="checkout__total--calculated__text text-right"><?php echo CURRENCY. number_format((float)$vat, 2, '.', ''); ?></td>
                </tr>
            </tbody>
            <tfoot class="checkout__total--footer">
                <tr class="checkout__total--footer__items">
                    <td class="checkout__total--footer__title checkout__total--footer__list text-left">Total </td>
                    <td class="checkout__total--footer__amount checkout__total--footer__list text-right"><?php echo CURRENCY. number_format((float) ($total_amount-$discount_amount), 2, '.', ''); ?></td>
                </tr>
            </tfoot>
        </table>
    </div>
    </aside>
<?php 
include_once('../lib/function.php');
$total_quantity = 0;

if(isset($_SESSION["cart_item"])){ 
$total_quantity = array_sum(array_column($_SESSION["cart_item"], 'quantity'));
}
$totalCountItems = $total_quantity;
$message = '';
if(isset($_SESSION["cart_item"])){
$message .= '<div class="minicart__header ">
                <div class="minicart__header--top d-flex justify-content-between align-items-center">
                    <h2 class="minicart__title h3"> Shopping Cart</h2>
                    <button class="minicart__close--btn" aria-label="minicart close button" data-offcanvas onClick="closeShoppingPopup()"> 
                        <svg class="minicart__close--icon" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512"><path fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M368 368L144 144M368 144L144 368"/></svg>
                    </button>
                </div>
                <p class="minicart__header--desc">Clothing and fashion products are limited</p>
            </div>
            <div class="minicart__product">';
			$sub_total = 0;
			foreach ($_SESSION["cart_item"] as $key => $item) { 
			$productvar_name = '';
			$sellPrice = '';
			if($item['fld_sale_price'] > 0){
				$sellPrice = '<span class="current__price">'.CURRENCY.$item["fld_sale_price"].'</span>';
				$sub_total += ($item['quantity']*$item['fld_sale_price']);
			}else{
			    $sellPrice='<span class="current__price">'.CURRENCY.number_format((float) $item['fld_price'], 2, '.', '' ).'</span>';
			    $sub_total += ($item['quantity']*$item['fld_price']);
			}
            $productvariationName="";
            if(isset($item['productvariationName'])){
                $productvariationName=$item['productvariationName'];
            }
			$producturl = SITE_URL.'product/'.$item["fld_slug"].'.html';
			$productvariationId = isset($item['productvariationId'])?$item['productvariationId']:0;
            
			$message .= '<div class="minicart__product--items d-flex" >
                    <div class="minicart__thumb">
                        <a href="'.$producturl.'"><img src="'.SITE_URL.'admin/uploaded_files/products/'.$item["fld_img_path"].'" alt="'.$item["fld_title"].'"></a>
                    </div>
                    <div class="minicart__text">
                        <h3 class="minicart__subtitle h4"><a href="'.$producturl.'">'.$item['fld_title'].'</a></h3>
                        <span class="color__variant">'.$productvariationName.'</span>
                        <div class="minicart__price">
                            
                            '.$sellPrice.'
                        </div>
                        <div class="minicart__text--footer d-flex align-items-center" style="justify-content: flex-start; gap: 10px;">
                            <span class="color__variant cart-product-qty"><b>QTY: </b> '.$item["quantity"].'</span>
                            <div class="cart-product-remove"><button class="remove-product btn-remove icon-cancel minicart__product--remove" onClick="cartAction(\'remove\','.$item["code"].','.$productvariationId.')" title="'.$item['fld_title'].'">Remove</button></div>
                        </div>
                    </div>
                </div>
            </div>';
			}
            $message .= '<div class="minicart__amount">
                <div class="minicart__amount_list d-flex justify-content-between">
                    <span>Sub Total:</span>
                    <span><b>'.CURRENCY.number_format((float) $sub_total, 2, '.', '' ).'</b></span>
                </div>';
				
			$discount_amount = 0;
                          if(isset($_SESSION['coupon']) && $_SESSION['coupon']['discount_amount'] !=''){
                              if(isset($_SESSION['coupon']['discount_type']) && $_SESSION['coupon']['discount_type'] == 'flat'){
                                   $discount_amount = $_SESSION['coupon']['discount_amount'];
                              }else{
                                   $discount_amount = ($sub_total*$_SESSION['coupon']['discount_amount'])/100;
                              }
                         
                          $message .= '<div class="minicart__amount_list d-flex justify-content-between"><span>Coupon Code ('.$_SESSION['coupon']['code'].') <a href="javascript:void(0)" onclick="removePromoCode()"><i class="fa fa-times" aria-hidden="true"></i></a> </span> <span id="discount_amount" class="cart__summary--amount text-right"><b>'.CURRENCY.number_format((float) $discount_amount, 2, '.', '' ).'</b></span></div>';
                          } 
                $message .= '<div class="minicart__amount_list d-flex justify-content-between">
                    <span>Total:</span>
                    <span><b>'.CURRENCY.number_format((float) ($sub_total-$discount_amount), 2, '.', '' ).'</b></span>
                </div>
            </div>
            <div class="minicart__conditions text-center" >
                
            </div>
            <div class="minicart__button d-flex justify-content-center">
                <a class="primary__btn minicart__button--link" href="'.SITE_URL.'cart.html">View cart</a>
                <a class="primary__btn minicart__button--link" href="'.SITE_URL.'checkout.html">Checkout</a>
            </div>';
}else{
	$message .= '<div class="minicart__header ">
                <div class="minicart__header--top d-flex justify-content-between align-items-center">
                    <h2 class="minicart__title h3">Your cart is empty.</p><h2><button class="minicart__close--btn" aria-label="minicart close button" data-offcanvas onClick="closeShoppingPopup()"> 
                        <svg class="minicart__close--icon" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512"><path fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M368 368L144 144M368 144L144 368"/></svg>
                    </button></div></div>';
}
$cart_message = '';
if(isset($_SESSION["cart_item"]) && $_SESSION["cart_item"]!=''){
$cart_message .='<div class="row"><div class="col-lg-8"><table class="cart__table--inner">
                                        <thead class="cart__table--header">
                                            <tr class="cart__table--header__items">
                                                <th class="cart__table--header__list">Product</th>
                                                <th class="cart__table--header__list">Price</th>
                                                <th class="cart__table--header__list">Quantity</th>
                                                <th class="cart__table--header__list">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody class="cart__table--body">';
							$sub_total = 0;
							$productsubtotal="";
							$pro_Idss = $pro_var_Idss = array();
                            foreach ($_SESSION["cart_item"] as $key => $item) {
                                if($item['productvariationId']){
                                    $productvariationId = $item['productvariationId'];
                                }else{
                                    $productvariationId = 0;
                                }
							
							$pro_Idss[] = $item['code'];
							$pro_var_Idss[] = $item['code'].'-'.$productvariationId;
                            $producturl = SITE_URL.'product/'.$item["fld_slug"].'.html';
                            //$sub_total += ($item['quantity']*$item['fld_price']);
                            $productvariationName='';
                            if(isset($item['productvariationName'])){
                                $productvariationName=$item['productvariationName'];
                            }
							
							if($item['fld_sale_price'] > 0){
                				$sellPrice = '<span class="cart__price">'.CURRENCY.number_format((float) $item['fld_sale_price'], 2, '.', '').'</span>';
                				$sub_total += ($item['quantity']*$item['fld_sale_price']);
                				$productsubtotal=($item['quantity']*$item['fld_sale_price']);
                			}else{
                			    $sellPrice='<span class="cart__price">'.CURRENCY.number_format((float) $item['fld_price'], 2, '.', '').'</span>';
                			    $sub_total += ($item['quantity']*$item['fld_price']);
                			    $productsubtotal=($item['quantity']*$item['fld_price']);
                			}
							
                            $productimg = SITE_URL.'admin/uploaded_files/products/'.$item["fld_img_path"];
                            $cart_message .='<tr class="cart__table--body__items">
                                                <td class="cart__table--body__list">
                                                    <div class="cart__product d-flex align-items-center">
                                                        <a class="cart__remove--btn" aria-label="search button" type="button" onClick="cartAction(\'remove\','.$item["code"].','.$productvariationId.')">
                                                            <svg fill="currentColor" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" width="16px" height="16px"><path d="M 4.7070312 3.2929688 L 3.2929688 4.7070312 L 10.585938 12 L 3.2929688 19.292969 L 4.7070312 20.707031 L 12 13.414062 L 19.292969 20.707031 L 20.707031 19.292969 L 13.414062 12 L 20.707031 4.7070312 L 19.292969 3.2929688 L 12 10.585938 L 4.7070312 3.2929688 z"/></svg>
                                                        </a>
                                                        <div class="cart__thumbnail">
                                                            <a href="'.$producturl.'"><img class="border-radius-5" src="'.$productimg.'" alt="'.$item["fld_title"].'"></a>
                                                        </div>
                                                        <div class="cart__content">
                                                            <h4 class="cart__content--title"><a href="'.$producturl.'">'.$item["fld_title"].'</a></h4>
                                                            '.$productvariationName.'
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__table--body__list">
                                                    <span class="cart__price">'.$sellPrice.'</span>
                                                </td>
                                                <td class="cart__table--body__list">
                                                   <div class="quantity__box">
                                                        
														<div class="quantity__box">
                                                <button onclick="decrementCart('.$item['code'].','.$productvariationId.')" class="quantity__value decrease">-</button>
                                                <input type="hidden" id="productqty'.$item['code'].'-'.$productvariationId.'" name="qty" value="'.$item['quantity'].'" min="1" >
                                                <h2 id="counting'.$item['code'].'-'.$productvariationId.'" class="quantity__value">'.$item['quantity'].'</h2>
                                                <button onclick="incrementCart('.$item['code'].','.$productvariationId.')" class="quantity__value increase">+</button>
                                                
                                            </div>
											
                                                    </div>
                                                </td>
                                                <td class="cart__table--body__list">
                                                    <span class="cart__price end">'.CURRENCY.number_format((float) $productsubtotal, 2, '.', '').'</span>
                                                </td>
                                            </tr>';
							}
							$total_amount = $sub_total;
							$pid = implode(',',$pro_Idss);
							$pvid = implode(',',$pro_var_Idss);
					$cart_message .= '</tbody></table><div class="continue__shopping d-flex justify-content-between">
										<div><a href="'.SITE_URL.'shop.html" class="cart__summary--footer__btn primary__btn cart">Continue Shopping</a></div>
                                        <input type="hidden" id="product_ids" value="'.$pid.'" />
                                        <input type="hidden" id="product_var_ids" value="'.$pvid.'" />
                                        <button class="cart__summary--footer__btn primary__btn cart" type="submit" onClick="updatecartQty()">Update Cart</button>
                                    </div></div>';
					$cart_message .= '<div class="col-lg-4">
								<form action="" method="post" id="couponForm" onSubmit="return apply_coupon()">
                                <div class="cart__summary border-radius-10">
                                    <div class="coupon__code mb-30">
                                        <h3 class="coupon__code--title">Coupon</h3>
                                        <p class="coupon__code--desc">Enter your coupon code if you have one.</p>
										<p class="message text-danger"></p>
                                        <div class="coupon__code--field d-flex">
                                            <input type="text" placeholder="Coupon Code" name="coupon_code" required = "" id="coupon_code" class="coupon__code--field__input form-control">
											<button class="coupon__code--field__btn primary__btn" type="submit">Apply Coupon</button>
                                        </div>
                                    </div>
									</form>
                                    <hr>
                                    <div class="cart__summary--total mb-20">
                                        <table class="cart__summary--total__table">
                                            <tbody>
                                                <tr class="cart__summary--total__list">
                                                    <td class="cart__summary--total__title text-left">SUBTOTAL</td>
                                                    <td class="cart__summary--amount text-right">'.CURRENCY.number_format((float)$sub_total, 2, '.', '').'</td>
                                                </tr>';
												$discount_amount = 0;
                          if(isset($_SESSION['coupon']) && $_SESSION['coupon']['discount_amount'] !=''){
                              if(isset($_SESSION['coupon']['discount_type']) && $_SESSION['coupon']['discount_type'] == 'flat'){
                                   $discount_amount = $_SESSION['coupon']['discount_amount'];
                              }else{
                                   $discount_amount = ($sub_total*$_SESSION['coupon']['discount_amount'])/100;
                              }
                         
                          $cart_message .= '<tr class="cart__summary--total__list"><td class="cart__summary--total__title text-left">Coupon Code ('.$_SESSION['coupon']['code'].') <a href="javascript:void(0)" onclick="removePromoCode()"><i class="fa fa-times" aria-hidden="true"></i></a> </td> <td id="discount_amount" class="cart__summary--amount text-right">'.CURRENCY.number_format((float)$discount_amount, 2, '.', '').'</td></tr>';
                          } 
						  
                                               $cart_message .= ' <tr class="cart__summary--total__list">
                                                    <td class="cart__summary--total__title text-left">GRAND TOTAL</td>
                                                    <td class="cart__summary--amount text-right">'.CURRENCY.number_format((float)($total_amount-$discount_amount), 2, '.', '').'</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="cart__summary--footer">
                                        <p class="cart__summary--footer__desc">Shipping & taxes calculated at checkout</p>
                                        <ul class="d-flex justify-content-between">
											<li></li>
                                            <li><a class="cart__summary--footer__btn primary__btn checkout" href="'.SITE_URL.'checkout.html">Check Out</a></li>
                                        </ul>
                                    </div>
                                </div> 
                            </div></div>';
}else{
	$cart_message = '<p>Your Cart is Empty</p><p><a href="'.SITE_URL.'shop.html" class="cart__summary--footer__btn primary__btn cart">Continue Shopping</a></p>';
}
echo json_encode(array("success"=>true,"totalIteminCart"=>$totalCountItems,"message"=>$message,"cart_message"=>$cart_message));
die();
?>
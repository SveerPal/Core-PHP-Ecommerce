<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>AL - PASBAN</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    
   <?php include('link.php'); ?>

</head>
<style>
    main{
        background: #f5f5f5;
    }    
</style>
<body>

<?php include('header.php'); ?>

    <main class="main__content_wrapper">
        
        <section id="shipping-page">
            <div class="container">
                <div class="track-orderss">
                    <div class="cart-section">
                       <a href="checkout.php"><i class="far fa-shopping-cart"></i> <span>Cart</span></a>
                    </div>
                    <div class="ship-section">
                        <a href="shipping.php"><i class="far fa-shipping-fast"></i> <span>Shipping</span></a>
                    </div>
                    <div class="payment-section">
                        <a href="payment.php"><i class="far fa-money-bill-wave"></i> <span>Payment</span></a>
                    </div>
                    <div class="confirm-section">
                        <a href="#"><i class="far fa-box-check"></i> </a>
                        <span>Confirmation</span>
                    </div>
                </div>
            </div>
        </section>
    <!-- End preloader -->
        
    <!-- Start checkout page area -->
    <div class="checkout__page--area">
        <div class="container">
            <div class="checkout__page--inner d-flex">
                <div class="main checkout__mian">
                    <main class="main__content_wrapper">
                        <form action="#">
                            <div class="checkout__content--step checkout__contact--information2 border-radius-5">
                                <div class="checkout__review d-flex justify-content-between align-items-center">
                                    <div class="checkout__review--inner d-flex align-items-center">
                                        <label class="checkout__review--label">Contact</label>
                                        <span class="checkout__review--content">info42@gmail.com</span>
                                    </div>
                                    <div class="checkout__review--link">
                                        <a href="checkout.php"><button class="checkout__review--link__text" type="button">Change</button></a>
                                    </div>
                                </div> 
                                <div class="checkout__review d-flex justify-content-between align-items-center">
                                    <div class="checkout__review--inner d-flex align-items-center">
                                        <label class="checkout__review--label"> Ship to</label>
                                        <span class="checkout__review--content"> Dhaka, DHaka 1219, Bangladesh</span>
                                    </div>
                                    <div class="checkout__review--link">
                                        <a href="checkout.php"><button class="checkout__review--link__text" type="button">Change</button> </a> 
                                    </div>
                                </div>
                                <div class="checkout__review d-flex justify-content-between align-items-center">
                                    <div class="checkout__review--inner d-flex align-items-center">
                                        <label class="checkout__review--label"> Method</label>
                                        <span class="checkout__review--content"> Standard . <strong>$0.23</strong></span>
                                    </div>
                                    <div class="checkout__review--link">
                                        <a href="checkout.php"> <button class="checkout__review--link__text" type="button">Change</button>   </a>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__content--step section__shipping--address">
                                <div class="section__header mb-25">
                                    <h3 class="section__header--title">Payment</h3>
                                    <p class="section__header--desc">All transactions are secure and encrypted.</p>
                                </div>
                                <div class="checkout__content--step__inner3 border-radius-5">
                                    <div class="checkout__address--content__header d-flex align-items-center justify-content-between">
                                        <span class="checkout__address--content__title">Credit card</span>
                                        <span class="heckout__address--content__icon"><img src="assets/img/icon/credit-card.svg" alt="card"></span>
                                    </div>
                                    <div class="checkout__content--input__box--wrapper ">
                                        <div class="row">
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list position__relative">
                                                    <label>
                                                        <input class="checkout__input--field border-radius-5" placeholder="Card number"  type="text">
                                                    </label>
                                                    <button class="checkout__input--field__button" type="button">
                                                        
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="15.51" height="15.443" viewBox="0 0 512 512"><path d="M336 208v-95a80 80 0 00-160 0v95" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/><rect x="96" y="208" width="320" height="272" rx="48" ry="48" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/></svg>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input class="checkout__input--field border-radius-5" placeholder="Name on card"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input class="checkout__input--field border-radius-5" placeholder="piration date (MM / YY)"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-12">
                                                <div class="checkout__input--list position__relative">
                                                    <label>
                                                        <input class="checkout__input--field border-radius-5" placeholder="Security code"  type="text">
                                                    </label>
                                                    <button class="checkout__input--field__button" type="button">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="18.51" height="18.443" viewBox="0 0 512 512"><title>Help Circle</title><path d="M256 80a176 176 0 10176 176A176 176 0 00256 80z" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="32"/><path d="M200 202.29s.84-17.5 19.57-32.57C230.68 160.77 244 158.18 256 158c10.93-.14 20.69 1.67 26.53 4.45 10 4.76 29.47 16.38 29.47 41.09 0 26-17 37.81-36.37 50.8S251 281.43 251 296" fill="none" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="28"/><circle cx="250" cy="348" r="20"/></svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                            <div class="checkout__content--step__footer d-flex align-items-center">
                                <a class="continue__shipping--btn primary__btn border-radius-5" href="payment.php">Pay now</a>
                                <a class="previous__link--content" href="shop.php">Return to shipping</a>
                            </div>
                        </form>
                    </main>
                   <footer class="main__footer checkout__footer">
                        <p class="copyright__content">Copyright © 2022 <a class="copyright__content--link text__primary" href="index.php">AL Pasban</a> . All Rights Reserved.</p>
                    </footer>
                </div>
                <aside class="checkout__sidebar sidebar">
                    <div class="cart__table checkout__product--table">
                        <table class="cart__table--inner">
                            <tbody class="cart__table--body">
                                <tr class="cart__table--body__items">
                                    <td class="cart__table--body__list">
                                        <div class="product__image two  d-flex align-items-center">
                                            <div class="product__thumbnail border-radius-5">
                                                <a href="product-details.php"><img class="border-radius-5" src="assets/img/product/small-product7.png" alt="cart-product"></a>
                                                <span class="product__thumbnail--quantity">1</span>
                                            </div>
                                            <div class="product__description">
                                                <h3 class="product__description--name h4"><a href="product-details.php">Fresh-whole-fish</a></h3>
                                                <span class="product__description--variant">COLOR: Blue</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__table--body__list">
                                        <span class="cart__price">£65.00</span>
                                    </td>
                                </tr>
                                <tr class="cart__table--body__items">
                                    <td class="cart__table--body__list">
                                        <div class="cart__product d-flex align-items-center">
                                            <div class="product__thumbnail border-radius-5">
                                                <a href="product-details.php"><img class="border-radius-5" src="assets/img/product/small-product2.png" alt="cart-product"></a>
                                                <span class="product__thumbnail--quantity">1</span>
                                            </div>
                                            <div class="product__description">
                                                <h3 class="product__description--name h4"><a href="product-details.php">Vegetable-healthy</a></h3>
                                                <span class="product__description--variant">COLOR: Green</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__table--body__list">
                                        <span class="cart__price">£82.00</span>
                                    </td>
                                </tr>
                                <tr class="cart__table--body__items">
                                    <td class="cart__table--body__list">
                                        <div class="cart__product d-flex align-items-center">
                                            <div class="product__thumbnail border-radius-5">
                                                <a href="product-details.php"><img class="border-radius-5" src="assets/img/product/small-product4.png" alt="cart-product"></a>
                                                <span class="product__thumbnail--quantity">1</span>
                                            </div>
                                            <div class="product__description">
                                                <h3 class="product__description--name h4"><a href="product-details.php">Raw-onions-surface</a></h3>
                                                <span class="product__description--variant">COLOR: White</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__table--body__list">
                                        <span class="cart__price">£78.00</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
                    </div>
                    <div class="checkout__discount--code">
                        <form class="d-flex" action="#">
                            <label>
                                <input class="checkout__discount--code__input--field border-radius-5" placeholder="Gift card or discount code"  type="text">
                            </label>
                            <button class="checkout__discount--code__btn primary__btn border-radius-5" type="submit">Apply</button>
                        </form>
                    </div>
                    <div class="checkout__total">
                        <table class="checkout__total--table">
                            <tbody class="checkout__total--body">
                                <tr class="checkout__total--items">
                                    <td class="checkout__total--title text-left">Subtotal </td>
                                    <td class="checkout__total--amount text-right">$860.00</td>
                                </tr>
                                <tr class="checkout__total--items">
                                    <td class="checkout__total--title text-left">Shipping</td>
                                    <td class="checkout__total--calculated__text text-right">Calculated at next step</td>
                                </tr>
                            </tbody>
                            <tfoot class="checkout__total--footer">
                                <tr class="checkout__total--footer__items">
                                    <td class="checkout__total--footer__title checkout__total--footer__list text-left">Total </td>
                                    <td class="checkout__total--footer__amount checkout__total--footer__list text-right">$860.00</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </aside>
            </div>
        </div>
    </div>
    <!-- End checkout page area -->

  
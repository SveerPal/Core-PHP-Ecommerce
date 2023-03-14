<main class="main__content_wrapper">
    <?php include('lib/templates/inner-banner.php')?>
   

    <!-- Start shop section -->
    <section class="shop__section section--padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-4">
                    <?php include('lib/templates/product-filter.php')?>
                </div>
                <div class="col-xl-9 col-lg-8">
                    <?php 
                    //$products=$FontEndData->getProductList(15);
                    
                    //if($products){
                    ?>
                    <div class="shop__header bg__gray--color d-flex align-items-center justify-content-between mb-30">
                        <button class="widget__filter--btn d-flex d-lg-none align-items-center" data-offcanvas>
                            <i class="fal fa-filter"></i>
                            <span class="widget__filter--btn__text">Filter</span>
                        </button>
                        <p class="product__showing--count"> <!--Items--></p>
                        <div class="product__view--mode d-flex align-items-center">
                            <div class="product__view--mode__list product__short--by align-items-center d-none d-lg-flex">
                                <label class="product__view--label">Sort By :</label>
                                <div class="select shop__header--select">
                                    <select class="product__view--select orderby" name="orderby">
                                        <option value="id_desc">Newest</option>
                                        <option value="count_desc">Best Selling</option>
                                        <option value="cat_discount">Discount </option>
                                        <option value="price_asc">Price low to high</option>
                                        <option value="price_desc">Price high to low </option>
                                        <option value="name_asc">A to Z </option>
                                        <option value="name_desc">Z to A</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shop__product--wrapper" >
                        <div class="tab_content" data-autoscroll>
                            <div id="product_grid" class="tab_pane active show">
                                <div class="product__section--inner product__grid--inner">
                                    <div class="row row-cols-xl-4 row-cols-lg-3 row-cols-md-3 row-cols-2 mb--n30 product-list" id="content">


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php //}else{ ?>
                        <!-- <div class="alert alert-danger" role="alert">Oops! No Product Found</div> -->
                    <?php //} ?>
                </div>
            </div>
        </div>
    </section>
    <!-- End shop section -->
</main>
<script>
    var urlAjax="<?php echo SITE_URL;?>/lib/templates/product-ajax.php";
    var category_id="";
    
</script>

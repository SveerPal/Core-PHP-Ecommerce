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
                   
                    //$products=$FontEndData->getProductListCategory($pageDetails['id'],15);
                    
                    //if($products){
                    ?>
                    <div class="shop__header bg__gray--color d-flex align-items-center justify-content-between mb-30">
                        <button class="widget__filter--btn d-flex d-lg-none align-items-center" data-offcanvas>
                            <svg  class="widget__filter--btn__icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="28" d="M368 128h80M64 128h240M368 384h80M64 384h240M208 256h240M64 256h80"/><circle cx="336" cy="128" r="28" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="28"/><circle cx="176" cy="256" r="28" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="28"/><circle cx="336" cy="384" r="28" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="28"/></svg> 
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
                                    
                                    <!-- <div class="row row-cols-xl-4 row-cols-lg-3 row-cols-md-3 row-cols-2 mb--n30">
                                        <?php //foreach($products as $product){ ?>
                                        <div class="col mb-30">
                                            <?php //include('lib/templates/product-list.php')?>
                                        </div>
                                        <?php //}  ?>
                                    </div> -->
                                        
                                    <div class="row row-cols-xl-4 row-cols-lg-3 row-cols-md-3 row-cols-2 mb--n300 product-list" id="content">


                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        
                    </div>
                    <?php echo $pageDetails['description']; ?>
                    <!-- <?php //}else{ ?>
                        <div class="alert alert-danger" role="alert">Oops! No Product Found</div>
                    <?php //} ?> -->
                </div>
            </div>
        </div>
    </section>
    <!-- End shop section -->
</main>

<script>
    var urlAjax="<?php echo SITE_URL;?>/lib/templates/product-ajax.php";
    var category_id="<?php echo $pageDetails['id'];?>";
   
</script>
<style>.shop__product--wrapper{ min-height:65px; }</style>
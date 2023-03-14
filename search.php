
  <main class="main__content_wrapper">
    <?php include('lib/templates/inner-banner.php')?>
   

    <!-- Start shop section -->
    <section class="shop__section section--padding">
        <div class="container-fluid">
            <div class="row">
                <!-- <div class="col-xl-3 col-lg-4">
                    <?php //include('lib/templates/product-filter.php')?>
                </div> -->
                <div class="col-xl-12 col-lg-12">
                    
                    <div class="shop__product--wrapper" >
                        <div class="tab_content" data-autoscroll>
                            <div id="product_grid" class="tab_pane active show">
                                <div class="product__section--inner product__grid--inner">
                                    <div class="row row-cols-xl-4 row-cols-lg-3 row-cols-md-3 row-cols-2 mb--n30 product-list-search" id="contentt">


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End shop section -->
    <?php// print_r($_POST);?>
</main>
<script>
    var urlAjax="<?php echo SITE_URL;?>/lib/templates/product-search-ajax.php";
    var category_id="";
    var search="<?php echo $_POST['search']?>";
</script>



  
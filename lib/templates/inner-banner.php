<!-- Start breadcrumb section -->

<?php //print_r($_REQUEST);?>
<section class="breadcrumb__section breadcrumb__bg <?php if(isset($pageDetails['slug']) && $pageDetails['slug']=='shop'){ echo 'two'; } ?>" 
    <?php if($pageDetails['photo']!='' &&  !isset($_REQUEST['fld_product'])){ ?> 
    style="background-image:url(<?php echo UPLOADS.'pages/'.$pageDetails['photo']; ?>)"
    <?php }elseif($pageDetails['photo']!='' &&  isset($_REQUEST['fld_category']) && $_REQUEST['fld_category']=='category'){ ?> 
    style="background-image:url(<?php echo UPLOADS.'products_categories/'.$pageDetails['photo']; ?>)"
    <?php } ?>
    >
    <div class="container-fluid">
        <div class="row row-cols-1 align-items-center">
            
            <div class="col-md-12">
                <div class="breadcrumb__content text-left">
                    <h1 class="breadcrumb__content--title mb-25"><?php echo $pageDetails['name'];?></h1>
                    <?php if($pageDetails['banner_heading']){ ?>
                    <h3><?php echo $pageDetails['banner_heading'];?></h3>
                    <?php } ?>
                    <?php if($pageDetails['banner_description']){ ?>
                    <h5><?php echo $pageDetails['banner_description'];?></h5>
                    <?php } ?>
                    <?php 
                        if($pageDetails['banner_url']){ 
                            $url=$pageDetails['banner_url'];
                        }else{
                            $url='#';
                        }
                     ?>   
                    <a href="<?php echo $url;?>" ><?php echo $pageDetails['banner_label'];?></a>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End breadcrumb section -->


<section class="brecrumb">
    <div class="container-fluid">
        <div class="row">
            <ul class="breadcrumb__content--menu d-flex justify-content-center">
                <li class="breadcrumb__content--menu__items"><a class="" href="<?php echo SITE_URL; ?>">Home</a> / </li>
                <li class="breadcrumb__content--menu__items"><span class=""><?php echo $pageDetails['name'];?></span></li>
            </ul>
        </div>
    </div>
</section>

<?php 
if(!isset($_GET['product-id']) || $_GET['product-id']==''){
    header('Location: products.php');
}
?>
<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Products Edit</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Products Edit</li>
      </ol>
    </section>

    <?php
    $productid=$_GET['product-id'];
    $productDetails=$SettingsData->getProductDetail($productid);
    //var_dump($productDetails);
    foreach($productDetails as $productDetail){ 
    
    ?>

    
    
    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <form class="form-inlinee" method="POST" id="editForm" enctype="multipart/form-data">
            <input type="hidden" name="product_id" value="<?php echo $productDetail['id']; ?>"> 
            <div class="box">
              <div class="box-header with-border">
                <a href="products.php" class="btn btn-primary btn-sm btn-flat backto"><i class="fa fa-arrow-left"></i> Back</a>
              </div>
              <div class="box-body">
                  <div class="form-group col-sm-6">
                    <label for="category_id" class="col-sm-12 control-label">Category</label>
                    <div class="col-sm-12">                      
                      <select class="form-control select2" id="category_id" name="category_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $SettingsData->categoryTreeEdit($parent_id = 0, $sub_mark = '',$productDetail['category_id']);?>                        
                      </select>                      
                    </div>
                  </div> 
                  <div class="form-group col-sm-6">
                    <label for="brand_id" class="col-sm-12 control-label">Brand</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="brand_id" name="brand_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $brands=$SettingsData->selctDataOption('products_brands');
                        $brandArray=explode(',',$productDetail['brand_id']);
                        foreach($brands as $brand){
                          $brandselected="";
                          if(in_array($brand['id'],$brandArray)){
                            $brandselected="selected";
                          }
                          echo '<option value="'.$brand['id'].'"'. $brandselected.'>'.$brand['name'].'</option>';
                        }
                        ?>
                      </select>                      
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="name" class="col-sm-12 control-label">Name</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['name']; ?>" type="text" class="form-control" id="name" name="name" required>
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="slug" class="col-sm-12 control-label">Slug</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['slug']; ?>" type="text" class="form-control" id="slug" name="slug" >
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="regular_price" class="col-sm-12 control-label">Regular Price</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['regular_price']; ?>" type="text" class="form-control" id="regular_price" name="regular_price" required>
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="sale_price" class="col-sm-12 control-label">Sale Price</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['sale_price']; ?>" type="text" class="form-control" id="sale_price" name="sale_price">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="sku" class="col-sm-12 control-label">SKU</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['sku']; ?>" type="text" class="form-control" id="sku" name="sku">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="product_code" class="col-sm-12 control-label">Product Code</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['product_code']; ?>" type="text" class="form-control" id="product_code" name="product_code">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="style_id" class="col-sm-12 control-label">Style/Type</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="style_id" name="style_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $styles=$SettingsData->selctDataOption('products_styles');
                        $styleArray=explode(',',$productDetail['style_id']);
                        foreach($styles as $style){
                          $styleselected="";
                          if(in_array($style['id'],$styleArray)){
                            $styleselected="selected";
                          }
                          echo '<option value="'.$style['id'].'"'.$styleselected.'>'.$style['name'].'</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="stock" class="col-sm-12 control-label">Stock</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['stock']; ?>" type="text" class="form-control" id="stock" name="stock">
                    </div>
                  </div>
                  
                    <div class="form-group  col-sm-6">
                    <label for="color_id" class="col-sm-12 control-label">Color</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="color_id" name="color_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $colors=$SettingsData->selctDataOption('products_color');
                        $styleArray=explode(',',$productDetail['color']);
                        foreach($colors as $color){
                          $colorselected="";
                          if(in_array($color['id'],$styleArray)){
                            $colorselected="selected";
                          }
                          echo '<option value="'.$color['id'].'"'.$colorselected.'>'.$color['name'].'</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="stock" class="col-sm-12 control-label">HSN Code</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['hsn_code']; ?>" type="text" class="form-control" id="hsn_code" name="hsn_code" >
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="custom_size" class="col-sm-12 control-label">Custom Size</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="custom_size" name="custom_size"> <?php echo $productDetail['custom_size']; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="short_description" class="col-sm-12 control-label">Short Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="short_description" name="short_description"> <?php echo $productDetail['short_description']; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="additional_info" class="col-sm-12 control-label">Additional Info</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="additional_info" name="additional_info"><?php echo $productDetail['additional_info']; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="description" class="col-sm-12 control-label">Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control editor1" id="description" name="description"><?php echo $productDetail['description']; ?></textarea>
                    </div>
                  </div> 
                  <div class="form-group  col-sm-6">
                    <label for="photoadd" class="col-sm-12 control-label">Photo</label>
                    <div class="col-sm-12">
                      <input type="file" id="photoadd" name="photoadd" class="form-control">
                      <input type="hidden" id="photo_old" name="photo_old" class="form-control" value="<?php echo $productDetail['photo']; ?>">
                      <?php 
                        if($productDetail['photo']){
                          echo "<img src='uploaded_files/products/". $productDetail['photo'] ."' height='50' >";
                        }
                      ?>
                    </div>
                  </div>    
                  <div class="form-group col-sm-6">
                      <label for="banner_heading" class="col-sm-12 control-label">Banner Heading</label>
                      <div class="col-sm-12">
                        <input type="text" value="<?php echo $productDetail['banner_heading']; ?>" class="form-control" id="banner_heading" name="banner_heading">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_description" class="col-sm-12 control-label">Banner Description</label>
                      <div class="col-sm-12">
                        <input type="text" value="<?php echo $productDetail['banner_description']; ?>" class="form-control" id="banner_description" name="banner_description">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_label" class="col-sm-12 control-label">Banner Label</label>
                      <div class="col-sm-12">
                        <input type="text" value="<?php echo $productDetail['banner_label']; ?>" class="form-control" id="banner_label" name="banner_label">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_url" class="col-sm-12 control-label">Banner URL</label>
                      <div class="col-sm-12">
                        <input type="text" value="<?php echo $productDetail['banner_url']; ?>" class="form-control" id="banner_url" name="banner_url">
                      </div>
                  </div>                    
                  <div class="form-group  col-sm-6">
                    <label for="alt" class="col-sm-12 control-label">Alt</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['alt']; ?>" type="text" class="form-control" id="alt" name="alt">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="fabric_id" class="col-sm-12 control-label">Fabric</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="fabric_id" name="fabric_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $fabrics=$SettingsData->selctDataOption('products_fabrics');
                        $fabricArray=explode(',',$productDetail['fabric_id']);
                        foreach($fabrics as $fabric){
                          $fabricselected="";
                          if(in_array($fabric['id'],$fabricArray)){
                            $fabricselected="selected";
                          }
                          echo '<option value="'.$fabric['id'].'"'.$fabricselected.'>'.$fabric['name'].'</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>                  
                  <div class="form-group col-sm-6">
                      <label  class="col-sm-12 control-label">Product Type</label>
                      <div class="col-sm-12">
                        <div class="radio">
                          <?php if($productDetail['product_type']=='Simple'){ ?> 
                          <label for="product_type1">
                            <input <?php if($productDetail['product_type']=='Simple'){echo 'checked';} ?> type="radio" name="product_type" class="product_type" id="product_type1" value="Simple">Simple
                          </label>&nbsp; 
                          <?php }elseif($productDetail['product_type']=='Variation'){ ?>                    
                          <label for="product_type0">
                            <input <?php if($productDetail['product_type']=='Variation'){echo 'checked';} ?> type="radio" name="product_type" class="product_type" id="product_type0" value="Variation">Variation
                          </label>
                          <?php } ?>
                        </div>                      
                      </div>
                  </div>                  
                  <div class="form-group  col-sm-6">
                    <label for="meta_title" class="col-sm-12 control-label">Meta Title</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['meta_title']; ?>" type="text" class="form-control" id="meta_title" name="meta_title">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="meta_keyword" class="col-sm-12 control-label">Meta Keywords</label>
                    <div class="col-sm-12">
                    <input value="<?php echo $productDetail['meta_keyword']; ?>" type="text" class="form-control" id="meta_keyword" name="meta_keyword">
                    </div>
                  </div> 
                  <div class="form-group  col-sm-12">
                    <label for="meta_description" class="col-sm-12 control-label">Meta Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="meta_description" name="meta_description"> <?php echo $productDetail['meta_description']; ?></textarea>
                    </div>
                  </div>                 
                  <div class="form-group  col-sm-12">
                    <label for="gallery" class="col-sm-12 control-label">Gallery</label>
                    <div class="col-sm-12">
                    <input type="file" class="form-control" id="gallery" name="gallery" multiple>
                    <?php $galleries=$SettingsData->getProductGallery($productid);
                      foreach($galleries as $gallery){     
                    ?>
                    <div class='col-sm-1 col-xs-1 col-md-1 col-lg-1 gal_id<?php echo $gallery['id']; ?>'>
                        <input type="hidden" name="gallery_id[]" value="<?php echo $gallery['id']; ?>">
                        <a class="thumbnaill fancybox" rel="ligthbox" href="uploaded_files/products/<?php echo $gallery['gal_photo'] ?>">  
                            <img class="img-responsivee" height="50" src="uploaded_files/products/<?php echo $gallery['gal_photo'] ?>" />  
                            <div class='text-center'>  
                                <small class='text-muted'><?php //echo $gallery['gal_photo'] ?></small>  
                            </div>  
                        </a>  
                        <a type="button" gal-id="<?php echo $gallery['id']; ?>" class="deletegallery text-danger">
                          <i class="glyphicon glyphicon-remove"></i>
                      </a> 
                    </div>
                    <?php
                      }
                    ?>
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label  class="col-sm-12 control-label">Status</label>
                    <div class="col-sm-12">
                      <div class="radio">
                        <label for="edit_status1">
                          <input type="radio" name="status" class="status" id="edit_status1" value="1" <?php if($productDetail['status']==1){ ?>checked<?php } ?> >Yes
                        </label>&nbsp;
                        <label for="edit_status0">
                          <input type="radio" name="status" class="status" id="edit_status0" value="0" <?php if($productDetail['status']==0){ ?>checked<?php } ?>>No
                        </label>
                      </div>                      
                    </div>
                  </div>                    
              </div>
            </div>
            
            <?php if($productDetail['product_type']=='Variation'){ ?> 
            <div class="variation box">
              <div class="box-header variation-body">
                <h3>Product Variation</h3>
              </div>
              <div class="box-body variation-body">
                <?php $attributes=$SettingsData->getAttribute('products_attributes');?>
                  <div class="col-sm-12 form-group ">
                      <label  class="col-sm-2 control-label">Variation Type</label>
                      <div class="col-sm-8">
                        <?php  $proAttriArray=explode(',',$productDetail['products_attributes_id']); ?>
                        <?php $a=0;foreach($attributes as $attribute){ ?>
                          <label for="variation_type<?php echo $a;?>">
                            <?php 
                            $attrichecked="";
                            if(in_array($attribute['id'],$proAttriArray)){
                              $attrichecked="checked";
                            }
                            ?>
                            <input <?php echo $attrichecked ;?> value="<?php echo $attribute['id'];?>" code="<?php echo $attribute['code'];?>" type="checkbox" name="variation_type[]" class="variation_type" id="variation_type<?php echo $a;?>"><?php echo $attribute['name'];?>
                            &nbsp;&nbsp;
                          </label>
                        <?php $a++; } ?> 
                      </div>
                  </div>
                <?php $variations=$SettingsData->getProductVariation($productid);
                  foreach($variations as $variation){     
                ?>  
                <span class="v-row col-sm-12 varproduuct<?php echo $variation['id']; ?>">
                  <input type="hidden" name="pro_var_id[];" class="hiddenid" value="<?php echo $variation['id']; ?>">
                  
                  
                  <?php for($v=0;$v<count($proAttriArray);$v++){
                  $attrdetail=$SettingsData->getAttributeDetail($proAttriArray[$v])  
                  ?>
                    <div class="form-group customattr col-sm-3 <?php echo $attrdetail['code'];?>_<?php echo $proAttriArray[$v]; ?>'">
                      <label for="<?php echo $attrdetail['code'];?>_<?php echo $proAttriArray[$v]; ?>" class="col-sm-12 control-label">Attribute <?php echo $attrdetail['name'];?> Value</label>
                      <div class="col-sm-12">
                        <select class="form-control require" required name="attribute_<?php echo $proAttriArray[$v]; ?>[]" required>
                        <?php
                          $attributeValues=$SettingsData->getAttributeValue($proAttriArray[$v]);
                          $attributeValuesArray=explode(',',$variation['variation_value']);
                          foreach($attributeValues as $attributeValue){
                            $varselct="";
                            if(in_array($attributeValue['id'],$attributeValuesArray)){
                              $varselct="selected";
                            }
                        ?>
                          <option <?php echo $varselct;?> value="<?php echo $attributeValue['id'];?>"><?php echo $attributeValue['name'];?></option>
                        <?php } ?>
                        </select> 
                      </div>
                    </div>
                  <?php } ?>
                  <div class="form-group col-sm-3 var_reg_prc_div">
                    <label for="variation_regular_price" class="col-sm-12 control-label">Regular Price</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_regular_price']; ?>" type="text" class="form-control require" name="variation_regular_price[]" required>                     
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_sale_price" class="col-sm-12 control-label">Sale Price</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_sale_price']; ?>" type="text" class="form-control" name="variation_sale_price[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_stock" class="col-sm-12 control-label">Stock</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_stock']; ?>" type="text" class="form-control require" name="variation_stock[]" required>
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_sku" class="col-sm-12 control-label">SKU</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_sku']; ?>" type="text" class="form-control require" name="variation_sku[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_product_code" class="col-sm-12 control-label">Product Code</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_product_code']; ?>" type="text" class="form-control require" name="variation_product_code[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_fabric" class="col-sm-12 control-label">Fabric</label>
                    <div class="col-sm-12">
                      <select class="form-control select22 variation_fabric" id="variation_fabric" name="variation_fabric[]" multiple>
                        <option value="0">Select</option>
                        <?php $fabrics=$SettingsData->selctDataOption('products_fabrics');
                        $fabricArray=explode(',',$variation['variation_fabric']);
                        foreach($fabrics as $fabric){
                          $fabricselected="";
                          if(in_array($fabric['id'],$fabricArray)){
                            $fabricselected="selected";
                          }
                          echo '<option value="'.$fabric['id'].'"'.$fabricselected.'>'.$fabric['name'].'</option>';
                        }
                        ?>
                      </select>
                      <input value="<?php echo $variation['variation_fabric']; ?>" type="hidden" class="form-control variation_fabric_value" name="variation_fabric_value[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_custom_size" class="col-sm-12 control-label">Custom Size</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_custom_size']; ?>" type="text"  class="form-control" name="variation_custom_size[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_description" class="col-sm-12 control-label">Description</label>
                    <div class="col-sm-12">
                      <input value="<?php echo $variation['variation_description']; ?>" type="text" class="form-control" name="variation_description[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_photo" class="col-sm-12 control-label">Image</label>
                    <div class="col-sm-9">
                      <input type="file" class="form-control variation_photo" name="variation_photo[]">                      
                      <input type="hidden" name="variation_photo_old[]" class="form-control variation_photo_old" value="<?php echo $variation['variation_photo']; ?>">
                      <?php 
                        if($variation['variation_photo']){
                          echo "<img src='uploaded_files/products/". $variation['variation_photo'] ."' height='50' class='variation_photo_old'>";
                        }
                      ?>                      
                    </div>
                    <div class="col-sm-3">
                      <a class="text-danger deletevariation" data-id="<?php echo $variation['id']; ?>" ><i class="fa fa-remove"></i></a>
                    </div>
                  </div> 
                  <hr class="col-sm-12">
                </span>
                <?php
                  }
                ?>

                <a class="btn btn-primary btn-flat add-more"><i class="fa fa-plus"></i> Add More</a>
                <a class="btn btn-danger btn-flat remove"><i class="fa fa-trash"></i> Remove</a>
              </div>
            </div>
            <?php } ?>
            <div class="form-group col-sm-offset-11">
              <button type="submit" class="btn btn-success btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
            </div>
            <span class="msg"></span>
          </form>

        </div>
      </div>
    </section>
    <?php }  ?> 
  </div>
    <?php include 'includes/footer.php'; ?>
    <?php include 'includes/products/products_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>

<script>
  $(function(){
    //Initialize Select2 Elements
    $('.select2').select2();
    //CK Editor
    CKEDITOR.replace('custom_size')
    CKEDITOR.replace('short_description')
    CKEDITOR.replace('description')
    CKEDITOR.replace('additional_info')
    
  });

  $('.variation_fabric').change(function(){
    let variation_fabric=[];
    $(this).each(function(){
      variation_fabric.push($(this).val());
    })
    //console.log(variation_fabric);
    $(this).next('.variation_fabric_value').val(variation_fabric);
  })
 

  
  $('.product_type').change(function(){
      if($(this).val()=='Variation'){
        $('.variation').removeClass('hide');
        $('.variation .require').attr('required','required');
      }else{
        $('.variation').addClass('hide');
        $('.variation_type').prop('checked', false);
        $('.variation .customattr').addClass('hide');
        $('.variation .require').removeAttr('required','required');
      }
  })
  $('.variation_type').change(function(){
    $('.customattr').remove(); 
    $('.variation_type').each(function(){
      let id,code,av;
      id=$(this).val();
      code=$(this).attr('code'); 
      if ($(this).is(':checked')) { 
        
        $.ajax({
          type: 'POST',
          url: 'includes/products/products_row.php',
          data: {id:id,attribute_value:'attribute_value'},
          dataType: 'json',
          success: function(response){
            let formoption=av="";
            if(response.length>0){
                formoption = '<option value="">Select</option>';
              $.each(response, function(v) {
                var av_id = response[v]['id'];
                var av_name = response[v]['name'];
                formoption += '<option value="' + av_id + '">' + av_name + '</option>';
              });
            }
            av='<div class="form-group customattr col-sm-2 '+code+'_'+id+'"><label for="'+code+'_'+id+'" class="col-sm-12 control-label">Attribute '+code+' Value</label><div class="col-sm-12"><select class="form-control require" name="attribute_'+id+'[]" required>'+formoption+'</select> </div></div>';
            $(av).insertBefore(".var_reg_prc_div");
          }
        });
      }else{
        $('.'+code+'_'+id).remove();
      }
    })  
  })

  $(".add-more").click(function(){   
    let html = $(".v-row:first").html(); 
    $('.variation-body .v-row:last').after('<span class="v-row col-sm-12 varadd">'+html+'</span>');
    $('body .varadd').find('.deletevariation').remove();
    $('body .varadd').find('.hiddenid').remove();
    $('body .varadd').find('.variation_photo_old').remove();
    $('body .varadd').find('input').val('');
    $("body .varadd").find("option:selected").removeAttr("selected");

  });  

  $("body").on("click",".remove",function(){ 
    let vrow=$('.v-row').length;  
    if(vrow>1 ){
      $('.variation-body .v-row:last').remove();
    }
  }); 
</script>







<script>
$(function(){

  $(document).on('click', '.edit', function(e){
    e.preventDefault();
    $('#edit').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  
});

$('#editForm').on('submit',function(e) {
    e.preventDefault();

    let formData = new FormData(this);
    let custom_size = CKEDITOR.instances.custom_size.getData();
    let short_description = CKEDITOR.instances.short_description.getData();
    let additional_info = CKEDITOR.instances.additional_info.getData();
    let description = CKEDITOR.instances.description.getData();
    formData.set("short_description", short_description);
    formData.set("additional_info", additional_info);
    formData.set("description", description);
    formData.set("custom_size", custom_size);


    if($('input[name=product_type]:checked', '#addForm').val()=='Variation'){
      if ($('.variation_type').filter(':checked').length < 1){
        alert("Please Check at least one Variation Type");
        return false;
      }


      $(".variation-body").find("input[type=file]").each(function(index, field){
        if(field.files[0]!=undefined){
          formData.append("variation_photo[]", field.files[0]);
        }else{
          formData.append("variation_photo[]",'');
        }
      });
      
    }
    
    //return false;

    var filesLength=document.getElementById('gallery').files.length;
    if(filesLength>0){
      for(var i=0;i<filesLength;i++){
        formData.append("gallery[]", document.getElementById('gallery').files[i]);
      }
    }else{
      formData.append("gallery[]",'');
    }


    let photo=document.getElementById('photoadd').files[0];    
    
    if(photo!=undefined){
      formData.append("photo",photo);
    }else{
      formData.append("photo",'');
    }
    formData.append("edit",'edit');
    //console.log(formData);
    $.ajax({
      type: 'POST',
      url: 'includes/products/products_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      cache: false,
      success: function(response){
        //console.log(response);
        $('.msg').html(response.msg);
          setTimeout(function(){
            $('.msg').html('');
          },5000)
        if(response.sts==1){
          setTimeout(function(){
            window.location.href="products.php";
          },3000)          
        }
        
      }
    })
});



$('.deletegallery').on('click',function(e) {
    e.preventDefault();        
    let id=$(this).attr('gal-id');
    if (window.confirm("Do you really want to Delete?")) {    
    
      $.ajax({
        type: 'POST',
        url: 'includes/products/products_ajax.php',
        data: {id:id,deletegallery:'deletegallery'},
        dataType: 'json',        
        success: function(response){
            $('.msg').html(response.msg);
            $('.gal_id'+id).remove();
            
            setTimeout(function(){
              $('.msg').html('');
            },3000) 
        }
      })
    }
});

$('.deletevariation').on('click',function(e) {
    e.preventDefault();        
    let id=$(this).attr('data-id');
    if (window.confirm("Do you really want to Delete?")) {
      $.ajax({
        type: 'POST',
        url: 'includes/products/products_ajax.php',
        data: {id:id,deletevariation:'deletevariation'},
        dataType: 'json',        
        success: function(response){
            $('.msg').html(response.msg);
            $('.varproduuct'+id).remove();            
            setTimeout(function(){
              $('.msg').html('');
            },3000) 
        }
      })
    }
});


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'includes/products/products_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('.id').val(response.id);
      $('.status').attr('checked',false);
      
      $('#edit_parent_category').html(response.parent_category_list)    
      $('#edit_parent_category option[value="'+response.parent_category+'"]').attr("selected", "selected");
      if(response.photo!=null && response.photo !=""){
        $('#edit_img').css('display','block');
        $('#edit_img').attr('src','uploaded_files/products/'+response.photo);
      }else{
        $('#edit_img').css('display','none');
      }

      $('#edit_name').val(response.name);
      $('#edit_description').val(response.description);
      $('#edit_cat_slug').val(response.cat_slug);
      $('#edit_alt').val(response.alt);
      $('#edit_photo_old').val(response.photo);
      $('#edit_status'+response.status).attr('checked',true); 
      $('#edit_meta_title').val(response.meta_title);
      $('#edit_meta_description').val(response.meta_description);
      $('#edit_meta_keyword').val(response.meta_keyword);     
      $('.fullname').html(response.name);
          
    }
  });
}
</script>
</body>
</html>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">  
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
<script type="text/javascript">  
$(document).ready(function(){  
    $(".fancybox").fancybox({  
        openEffect: "none",  
        closeEffect: "none"  
    });  
});  
</script>    





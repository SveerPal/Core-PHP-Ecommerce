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
      <h1>Products</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Products</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <form class="form-inlinee" method="POST" id="addForm" enctype="multipart/form-data">
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
                        <?php $SettingsData->categoryTree();?>                        
                      </select>                      
                    </div>
                  </div> 
                  <div class="form-group col-sm-6">
                    <label for="brand_id" class="col-sm-12 control-label">Brand</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="brand_id" name="brand_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $brands=$SettingsData->selctDataOption('products_brands');
                        foreach($brands as $brand){
                          echo '<option value="'.$brand['id'].'">'.$brand['name'].'</option>';
                        }
                        ?>
                      </select>                      
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="name" class="col-sm-12 control-label">Name</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="slug" class="col-sm-12 control-label">Slug</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="slug" name="slug" >
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="regular_price" class="col-sm-12 control-label">Regular Price</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="regular_price" name="regular_price" required>
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="sale_price" class="col-sm-12 control-label">Sale Price</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="sale_price" name="sale_price">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="sku" class="col-sm-12 control-label">SKU</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="sku" name="sku">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="product_code" class="col-sm-12 control-label">Product Code</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="product_code" name="product_code">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="style_id" class="col-sm-12 control-label">Style/Type</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="style_id" name="style_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $styles=$SettingsData->selctDataOption('products_styles');
                        foreach($styles as $style){
                          echo '<option value="'.$style['id'].'">'.$style['name'].'</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="color_id" class="col-sm-12 control-label">Color</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="color_id" name="color_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $colors=$SettingsData->selctDataOption('products_color');
                        foreach($colors as $color){
                          echo '<option value="'.$color['id'].'">'.$color['name'].'</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="stock" class="col-sm-12 control-label">Stock</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="stock" name="stock">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="stock" class="col-sm-12 control-label">HSN Code</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="hsn_code" name="hsn_code">
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="custom_size" class="col-sm-12 control-label">Custom Size</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="custom_size" name="custom_size"></textarea>
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="short_description" class="col-sm-12 control-label">Short Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="short_description" name="short_description"></textarea>
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="additional_info" class="col-sm-12 control-label">Additional Info</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="additional_info" name="additional_info"></textarea>
                    </div>
                  </div>
                  <div class="form-group col-sm-12">
                    <label for="description" class="col-sm-12 control-label">Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control editor1" id="description" name="description"></textarea>
                    </div>
                  </div> 
                  <div class="form-group  col-sm-6">
                    <label for="photoadd" class="col-sm-12 control-label">Photo</label>
                    <div class="col-sm-12">
                      <input type="file" id="photoadd" name="photoadd" class="form-control">
                    </div>
                  </div>                        
                  <div class="form-group  col-sm-6">
                    <label for="alt" class="col-sm-12 control-label">Alt</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="alt" name="alt">
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_heading" class="col-sm-12 control-label">Banner Heading</label>
                      <div class="col-sm-12">
                        <input type="text" value="" class="form-control" id="banner_heading" name="banner_heading">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_description" class="col-sm-12 control-label">Banner Description</label>
                      <div class="col-sm-12">
                        <input type="text" value="" class="form-control" id="banner_description" name="banner_description">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_label" class="col-sm-12 control-label">Banner Label</label>
                      <div class="col-sm-12">
                        <input type="text" value="" class="form-control" id="banner_label" name="banner_label">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_url" class="col-sm-12 control-label">Banner URL</label>
                      <div class="col-sm-12">
                        <input type="text" value="" class="form-control" id="banner_url" name="banner_url">
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="fabric_id" class="col-sm-12 control-label">Fabric</label>
                    <div class="col-sm-12">
                      <select class="form-control select2" id="fabric_id" name="fabric_id[]" multiple>
                        <option value="0">Select</option>
                        <?php $fabrics=$SettingsData->selctDataOption('products_fabrics');
                        foreach($fabrics as $fabric){
                          echo '<option value="'.$fabric['id'].'">'.$fabric['name'].'</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>                  
                  <div class="form-group col-sm-6">
                      <label  class="col-sm-12 control-label">Product Type</label>
                      <div class="col-sm-12">
                        <div class="radio">
                          <label for="product_type1">
                            <input type="radio" name="product_type" class="product_type" id="product_type1" value="Simple" checked>Simple
                          </label>&nbsp;                      
                          <label for="product_type0">
                            <input type="radio" name="product_type" class="product_type" id="product_type0" value="Variation">Variation
                          </label>
                        </div>                      
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="meta_title" class="col-sm-12 control-label">Meta Title</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="meta_title" name="meta_title">
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="meta_keyword" class="col-sm-12 control-label">Meta Keywords</label>
                    <div class="col-sm-12">
                    <input type="text" class="form-control" id="meta_keyword" name="meta_keyword">
                    </div>
                  </div> 
                  <div class="form-group  col-sm-12">
                    <label for="meta_description" class="col-sm-12 control-label">Meta Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="meta_description" name="meta_description"></textarea>
                    </div>
                  </div>                 
                  <div class="form-group  col-sm-12">
                    <label for="gallery" class="col-sm-12 control-label">Gallery</label>
                    <div class="col-sm-12">
                    <input type="file" class="form-control" id="gallery" name="gallery" multiple>
                    </div>
                  </div>                    
              </div>
            </div>

            <div class="variation box">
              <div class="box-header variation-body">
                <h3>Product Variation</h3>
              </div>
              <div class="box-body variation-body">
                <?php $attributes=$SettingsData->getAttribute('products_attributes');?>
                  <div class="col-sm-12 form-group ">
                      <label  class="col-sm-2 control-label">Variation Type</label>
                      <div class="col-sm-8">
                        <?php $a=0;foreach($attributes as $attribute){ ?>
                          <label for="variation_type<?php echo $a;?>">
                            <input value="<?php echo $attribute['id'];?>" code="<?php echo $attribute['code'];?>" type="checkbox" name="variation_type[]" class="variation_type" id="variation_type<?php echo $a;?>"><?php echo $attribute['name'];?>
                            &nbsp;&nbsp;
                          </label>
                        <?php $a++; } ?> 
                      </div>
                  </div>
                <span class="v-row col-sm-12">
                  <div class="form-group col-sm-3 var_reg_prc_div">
                    <label for="variation_regular_price" class="col-sm-12 control-label">Regular Price</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control require" name="variation_regular_price[]" required>                     
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_sale_price" class="col-sm-12 control-label">Sale Price</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control" name="variation_sale_price[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_stock" class="col-sm-12 control-label">Stock</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control require" name="variation_stock[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_sku" class="col-sm-12 control-label">SKU</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control require" name="variation_sku[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_product_code" class="col-sm-12 control-label">Product Code</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control require" name="variation_product_code[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_fabric" class="col-sm-12 control-label">Fabric</label>
                    <div class="col-sm-12">
                      <select class="form-control select22 variation_fabric" id="variation_fabric" name="variation_fabric[]" multiple>
                        <option value="0">Select</option>
                        <?php $fabrics=$SettingsData->selctDataOption('products_fabrics');
                        foreach($fabrics as $fabric){
                          echo '<option value="'.$fabric['id'].'">'.$fabric['name'].'</option>';
                        }
                        ?>
                      </select>
                      <input type="text" class="form-control variation_fabric_value" name="variation_fabric_value[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_custom_size" class="col-sm-12 control-label">Custom Size</label>
                    <div class="col-sm-12">
                      <input value="" type="text"  class="form-control" name="variation_custom_size[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_description" class="col-sm-12 control-label">Description</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control" name="variation_description[]">
                    </div>
                  </div>
                  <div class="form-group col-sm-3">
                    <label for="variation_photo" class="col-sm-12 control-label">Image</label>
                    <div class="col-sm-12">
                      <input type="file" class="form-control variation_photo" name="variation_photo[]">
                    </div>
                  </div> 
                  <hr class="col-sm-12">            
                </span>
                
                <a class="btn btn-primary btn-flat add-more"><i class="fa fa-plus"></i> Add More</a>
                <a class="btn btn-danger btn-flat remove"><i class="fa fa-trash"></i> Remove</a>
              </div>
            </div>
            <div class="form-group col-sm-offset-11">
              <button type="submit" class="btn btn-success btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
            </div>
            <span class="msgadd"></span>
          </form>

        </div>
      </div>
    </section>
     
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

  $(document).ready(function(){
    $('.variation').addClass('hide');
    $('.variation .require').removeAttr('required','required');
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
            av='<div class="form-group customattr col-sm-3 '+code+'_'+id+'"><label for="'+code+'_'+id+'" class="col-sm-12 control-label">Attribute '+code+' Value</label><div class="col-sm-12"><select class="form-control require" name="attribute_'+id+'[]" required>'+formoption+'</select> </div></div>';
            $(av).insertBefore(".var_reg_prc_div");
          }
        });
      }else{
        $('.'+code+'_'+id).remove();
      }
    })  
  })

  $(".add-more").click(function(){   
    var html = $(".v-row:first").html();  
    $('.variation-body .v-row:last').after('<span class="v-row col-sm-12">'+html+'</span>');
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

$('#addForm').on('submit',function(e) {
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
        //const file = field.files[0];
        //console.log('sssssssss'+field);
        if(field.files[0]!=undefined){
          formData.append("variation_photo[]", field.files[0]);
        }else{
          formData.append("variation_photo[]",'');
        }
        //console.log('ttt'+field.files[0]);
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
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/products/products_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        //console.log(response);
        $('.msgadd').html(response.msg);
          setTimeout(function(){
            $('.msgadd').html('');
          },5000)
        if(response.sts==1){
          setTimeout(function(){
            window.location.href="products.php";
          },1500)          
        }
        
      }
    })
});


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'includes/products/products_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('.id').val(response.id);
           
      $('.fullname').html(response.name);
    }
  });
}
</script>
</body>
</html>





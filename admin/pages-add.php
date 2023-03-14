<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>
  <?php 
  $templates = array(
    'Default'=>'default.php',
    'Search'=>'search.php',
    'Home'=>'index.php',
    'About Us'=>'about-us.php',
    'Contact Us'=>'contact-us.php',
    'My Account'=>'my-account.php',
    'Cart'=>'cart.php',
    'Login'=>'login.php',
    'Register'=>'register.php',
    'Checkout'=>'checkout.php',
    'Wishlist'=>'wishlist.php',
    'Shop'=>'shop.php',
    'Customer Support'=>'customer-support.php',
    'Privacy Policy'=>'privacy-policy.php',
    'Refund Policy'=>'refund-policy.php',
    'Shipping Return Policy'=>'shipping-return-policy.php',
    'Terms Of Use'=>'terms-of-use.php',
    'Payment Method'=>'payment-method.php',
    'Faq'=>'faq.php',
    'Festive Offer'=>'festive-offer.php',
    'Site Map'=>'site-map.php',
    'Career'=>'career.php',
    'Payment'=>'payment.php',
    'New Password'=>'new-password.php',
    'Forget Password'=>'forget-password.php',
    'Request a Quote'=>'request-quote.php',
    'Order Success'=>'order-success.php',
    'Sitemap'=>'sitemap.php',
    'Blogs'=>'blogs.php',
    'Thank You'=>'thank-you.php'
    
    );
  ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Page Add</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Page Add</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <form class="form-inlinee" method="POST" id="addForm" enctype="multipart/form-data">
            <div class="box">
              <div class="box-header with-border">
                <a href="pages.php" class="btn btn-primary btn-sm btn-flat backto"><i class="fa fa-arrow-left"></i> Back</a>
              </div>
              <div class="box-body">
              
                  <div class="form-group col-sm-12">
                    <label for="templates" class="col-sm-12 control-label">Template</label>
                    <div class="col-sm-12">
                      <select name="templates" id="templates" class="form-control required">
                        <option value="">--Select Template--</option> 
                        <?php 
                        foreach($templates as $key=>$value){ 
                          $selected = '';
                          if($fld_page_template == $value)
                            $selected = 'Selected';
                          echo '<option value="'.$value.'" '.$selected.'>'.$key.'</option> ';
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
                    <label for="breadcrumb" class="col-sm-12 control-label">Breadcrumb</label>
                    <div class="col-sm-12">
                      <input type="text" class="form-control" id="breadcrumb" name="breadcrumb" >
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="parent" class="col-sm-12 control-label">Parent</label>
                    <div class="col-sm-12">                      
                      <select class="form-control select2" id="parent" name="parent">
                        <option value="0">Select</option>
                        <?php $SettingsData->pageTree();?>                        
                      </select>                      
                    </div>
                  </div> 
                  <div class="form-group col-sm-12">
                    <label for="description" class="col-sm-12 control-label">Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control editor1" id="description" name="description"></textarea>
                    </div>
                  </div> 
                  <div class="form-group col-sm-12">
                    <label for="additional_description" class="col-sm-12 control-label">Additional Description</label>
                    <div class="col-sm-12">
                    <textarea class="form-control" id="additional_description" name="additional_description"></textarea>
                    </div>
                  </div>
                  <div class="form-group  col-sm-6">
                    <label for="photoadd" class="col-sm-12 control-label">Banner</label>
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
    <?php include 'includes/pages/pages_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>

<script>
  $(function(){
    //Initialize Select2 Elements
    $('.select2').select2();
    //CK Editor
    CKEDITOR.replace('description')
    CKEDITOR.replace('additional_description')
    /* CKEDITOR.config.protectedSource.push(/\[\[[^\]]*?\]\]/g);

    CKEDITOR.replace( 'description', {
      allowedContent:
        'h1 h2 h3 p blockquote strong em;' +
        'a[!href];' +
        'img(left,right)[!src,alt,width,height];' +
        'table tr th td caption;' +
        'span{!font-family};' +'
        'span{!color};' +
        'span(!marker);' +
        'del ins'
    } );
    CKEDITOR.replace( 'additional_description', {
      allowedContent:
        'h1 h2 h3 p blockquote strong em;' +
        'a[!href];' +
        'img(left,right)[!src,alt,width,height];' +
        'table tr th td caption;' +
        'span{!font-family};' +'
        'span{!color};' +
        'span(!marker);' +
        'del ins'
    } ); */
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
    //let additional_description = CKEDITOR.instances.additional_description.getData();
    //let description = CKEDITOR.instances.description.getData();
    //formData.set("additional_description", additional_description);
   // formData.set("description", description);

    let photo=document.getElementById('photoadd').files[0];    
    
    if(photo!=undefined){
      formData.append("photo",photo);
    }else{
      formData.append("photo",'');
    }
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/pages/pages_ajax.php',
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
            window.location.href="pages.php";
          },1500)          
        }
        
      }
    })
});


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'includes/pages/pages_row.php',
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





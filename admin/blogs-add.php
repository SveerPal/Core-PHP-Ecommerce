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
      <h1>Blog Add</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Blog Add</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <form class="form-inlinee" method="POST" id="addForm" enctype="multipart/form-data">
            <div class="box">
              <div class="box-header with-border">
                <a href="blogs.php" class="btn btn-primary btn-sm btn-flat backto"><i class="fa fa-arrow-left"></i> Back</a>
              </div>
              <div class="box-body">
                  
                  <div class="form-group col-sm-12">
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
                    <label for="category_id" class="col-sm-12 control-label">Category</label>
                    <div class="col-sm-12">                      
                      <select class="form-control select2" id="category_id" name="category_id[]" multiple>
                        <option value="">Select Parent</option>
                        <?php $categories=$SettingsData->selctDataOption('blogs_categories');
                            foreach($categories as $category){
                              echo '<option value="'.$category['id'].'">'.$category['name'].'</option>';
                            }
                            ?>                        
                      </select>                      
                    </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label for="tag_id" class="col-sm-12 control-label">Tag</label>
                    <div class="col-sm-12">                      
                      <select class="form-control select2" id="tag_id" name="tag_id[]" multiple>
                        <option value="">Select Parent</option>
                          <?php $tags=$SettingsData->selctDataOption('blogs_tags');
                            foreach($tags as $tag){
                              echo '<option value="'.$tag['id'].'">'.$tag['name'].'</option>';
                            }
                            ?>                        
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
    <?php include 'includes/blogs/blogs_modal.php'; ?>

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
    let additional_description = CKEDITOR.instances.additional_description.getData();
    let description = CKEDITOR.instances.description.getData();
    formData.set("additional_description", additional_description);
    formData.set("description", description);

    let photo=document.getElementById('photoadd').files[0];    
    
    if(photo!=undefined){
      formData.append("photo",photo);
    }else{
      formData.append("photo",'');
    }
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/blogs/blogs_ajax.php',
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
            window.location.href="blogs.php";
          },1500)          
        }
        
      }
    })
});


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'includes/blogs/blogs_row.php',
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





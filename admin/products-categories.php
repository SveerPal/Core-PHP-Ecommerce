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
      <h1>Products Categories</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Products Categories</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> New</a>
            </div>
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
                  <th>Sr. No.</th>                  
                  <th>Photo</th>                  
                  <th>Name</th>
                  <th>Slug</th>
                  <th>Status</th>
                  <th>Create Date</th>
                  <th>Action</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();
                    $i=1;
                    try{
                      $stmt = $conn->prepare("SELECT * FROM products_categories");
                      $stmt->execute();
                      $prtncatlist="";
                      foreach($stmt as $row){
                        $prtncatlist.='<option value="'.$row['id'].'">'.$row['name'].'</option>';
                        $image="";
                        if(!empty($row['photo'])) {
                          $image="<img src='uploaded_files/products_categories/".$row['photo']."' height='30px' width='30px'>";
                          
                        }  
                        $status = ($row['status']) ? '<span class="label label-success">active</span>' : '<span class="label label-danger">not active</span>';
                        echo "
                          <tr>
                            <td>".$row['id']."</td>
                            <td>".$image."</td>                            
                            <td>".$row['name']."</td>
                            <td>".$row['cat_slug']."</td>
                            <td>
                              ".$status."
                              
                            </td>
                            <td>".date('d-m-Y', strtotime($row['createDate']))."</td>
                            <td>
                              <button class='btn btn-success btn-sm edit btn-flat' data-id='".$row['id']."'><i class='fa fa-edit'></i> Edit</button>
                              <button class='btn btn-danger btn-sm delete btn-flat' data-id='".$row['id']."'><i class='fa fa-trash'></i> Delete</button>
                            </td>
                          </tr>
                        ";
                        $i++;
                      }
                    }
                    catch(PDOException $e){
                      echo $e->getMessage();
                    }

                    $pdo->close();
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
     
  </div>
  	<?php include 'includes/footer.php'; ?>
    <?php include 'includes/products_categories/categories_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
    
    
     CKEDITOR.replace('description');
     CKEDITOR.replace('edit_description');

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
    
    let photo=document.getElementById('photoadd').files[0];
    
    let formData = new FormData(this);
    let description = CKEDITOR.instances.description.getData();
    formData.set("description", description);
    if(photo!=undefined){
      formData.append("photo",photo);
    }else{
      formData.append("photo",'');
    }
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/products_categories/categories_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        //console.log(response);
        $('.msgadd').html(response.msg);
          setTimeout(function(){
            $('.msgadd').html('');
          },1500)
        if(response.sts==1){
          setTimeout(function(){
            location.reload();
          },1500)          
        }
        
      }
    })
});

$('#editForm').on('submit',function(e) {
    e.preventDefault();        
    let photo=document.getElementById('edit_photo').files[0];    
    let formData = new FormData(this);
    let description = CKEDITOR.instances.edit_description.getData();
    //console.log(description);
    formData.set("description", description);
    if(photo!=undefined){
      formData.append("photo",photo);
    }else{
      formData.append("photo",'');
    }
    formData.append("edit",'edit');
    $.ajax({
      type: 'POST',
      url: 'includes/products_categories/categories_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        //console.log(response);
        $('.msgedit').html(response.msg);
          setTimeout(function(){
            $('.msgedit').html('');
          },1500)
        if(response.sts==1){
          setTimeout(function(){
            location.reload();
          },1500)
                      
        }
        
      }
    })
});

$('#deleteForm').on('submit',function(e) {
    e.preventDefault();        
    let formData = new FormData(this);
    formData.append("delete",'delete');
    $.ajax({
      type: 'POST',
      url: 'includes/products_categories/categories_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        $('.msgdelete').html(response.msg);
          setTimeout(function(){
            $('.msgdelete').html('');
          },3000)
        if(response.sts==1){
            location.reload();          
        }
        
      }
    })
});


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'includes/products_categories/categories_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('.id').val(response.id);
      $('.status').attr('checked',false);
      
      $('#edit_parent_category').html(response.parent_category_list)    
      $('#edit_parent_category option[value="'+response.parent_category+'"]').attr("selected", "selected");
      if(response.photo!=null && response.photo !=""){
        $('#edit_img').css('display','block');
        $('#edit_img').attr('src','uploaded_files/products_categories/'+response.photo);
      }else{
        $('#edit_img').css('display','none');
      }

      $('#edit_name').val(response.name);
      
      //$('#edit_description').val(response.description);
      //console.log('jjjj'+response.description);
      //CKEDITOR.instances['edit_description'].setData(response.description)

      CKEDITOR.instances.edit_description.setData(response.description);

      $('#edit_cat_slug').val(response.cat_slug);
      $('#edit_alt').val(response.alt);
      $('#edit_photo_old').val(response.photo);
      $('#edit_status'+response.status).attr('checked',true); 
      $('#edit_meta_title').val(response.meta_title);
      $('#edit_meta_description').val(response.meta_description);
      $('#edit_meta_keyword').val(response.meta_keyword); 
      $('#edit_banner_heading').val(response.banner_heading);
      $('#edit_banner_description').val(response.banner_description);
      $('#edit_banner_label').val(response.banner_label);
      $('#edit_banner_url').val(response.banner_url);      
      $('.fullname').html(response.name);
    }
  });
}
</script>
</body>
</html>

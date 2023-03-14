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
      <h1>Menus</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Menus</li>
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
                  <th>Menu Name</th>
                  <th>Name</th>
                  <th>Status</th>
                  <th>Create Date</th>
                  <th>Action</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();
                    $i=1;
                    try{
                      $stmt = $conn->prepare("SELECT * FROM menus");
                      $stmt->execute();
                      $prtncatlist="";
                      foreach($stmt as $row){
                        $prtncatlist .="<option value='".$row['id']."'>".$row['name']."</option>";
                         
                        $status = ($row['status']) ? '<span class="label label-success">active</span>' : '<span class="label label-danger">not active</span>';
                        echo "
                          <tr>
                            <td>".$row['id']."</td>                      
                            <td>".$row['menu_name']."</td>
                            <td>".$row['name']."</td>
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
    <?php include 'includes/menus/menus_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
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

$('.link_type').on('change ready click',function(){
  if ($('.link_type:checked').val()=='External') {
    $('.internal').addClass('hide');
    $('.slug').removeClass('hide');
  }else{
    $('.internal').removeClass('hide');
    $('.slug').addClass('hide');
  }
})

$('.menu_type').on('change ready click',function(){ 
  if($('.menu_type:checked').val()=='Page'){
    $('.category').addClass('hide');
    $('.page').removeClass('hide');
  }else{
    $('.category').removeClass('hide');
    $('.page').addClass('hide');
  }
})

$('#menu_name').change('change click',function(){
  let menu_name=$('#menu_name :selected').val();
  $('#parent_id').html('');
  if(menu_name!=''){
    $.ajax({
      type: 'POST',
      url: 'includes/menus/menus_row.php',
      data: {menu_name:menu_name,menu:'menu'},
      dataType: 'json',
      success: function(response){
        $('#parent_id').html(response.parent_id)    
      }
    });
  }
})
$('#edit_menu_name').change('change click',function(){
  let menu_name=$('#edit_menu_name :selected').val();
  $('#edit_parent_id').html('');
  if(menu_name!=''){
    $.ajax({
      type: 'POST',
      url: 'includes/menus/menus_row.php',
      data: {menu_name:menu_name,menu:'menu'},
      dataType: 'json',
      success: function(response){
        $('#edit_parent_id').html(response.parent_id)    
      }
    });
  }
})




$('#addForm').on('submit',function(e) {
    e.preventDefault();
    
    let formData = new FormData(this);
    
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/menus/menus_ajax.php',
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
    let formData = new FormData(this);
    formData.append("edit",'edit');
    $.ajax({
      type: 'POST',
      url: 'includes/menus/menus_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
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
      url: 'includes/menus/menus_ajax.php',
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
    url: 'includes/menus/menus_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      console.log(response)
      $('.id').val(response.id);
      $('.status').attr('checked',false);
      
      $('#edit_menu_name option[value="'+response.menu_name+'"]').attr("selected", "selected");
      $("body #edit_menu_name").val(response.menu_name).trigger('change');
       
      setTimeout(function(){
        $('#edit_parent_id option[value="'+response.id+'"]').remove();
        $('#edit_parent_id option[value="'+response.parent_id+'"]').attr("selected", "selected");
      },2000)
      
      $('input[name="link_type"][value="'+response.link_type+'"]').attr("checked", "checked");
      $('input[name="link_type"][value="'+response.link_type+'"]').trigger('change');
      $('input[name="menu_type"][value="'+response.menu_type+'"]').attr("checked", "checked");
      $('input[name="menu_type"][value="'+response.menu_type+'"]').trigger('change');
      
      if(response.menu_type=='Page'){
        $('#edit_page option[value="'+response.item_id+'"]').attr("selected", "selected");
      }
      if(response.menu_type=='Category'){
        $('#edit_category option[value="'+response.item_id+'"]').attr("selected", "selected");
      }
      

      $('#edit_name').val(response.name);
      $('#edit_slug').val(response.slug);
      $('#edit_item_target').val(response.item_target);
      $('#edit_class').val(response.class);

      $('#edit_status'+response.status).attr('checked',true); 
      $('#edit_meta_title').val(response.meta_title);
      $('#edit_meta_description').val(response.meta_description);
      $('#edit_meta_keyword').val(response.meta_keyword); 
      $('#edit_menu_order').val(response.menu_order);    
      $('.fullname').html(response.name);
    }
  });
}
</script>
</body>
</html>

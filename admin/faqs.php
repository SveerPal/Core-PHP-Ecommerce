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
      <h1>FAQ's</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">FAQ's</li>
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
                  <th>Title</th>                  
                  <th>Description</th>
                  <th>Status</th>
                  <th>Create Date</th>
                  <th>Action</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();
                    $i=1;
                    try{
                      $stmt = $conn->prepare("SELECT * FROM faqs order by id desc");
                      $stmt->execute();
                      foreach($stmt as $row){
                          $status = ($row['status']) ? '<span class="label label-success">active</span>' : '<span class="label label-danger">not active</span>';
                        echo "
                          <tr>
                            <td>".$i."</td>                                                      
                            <td>".$row['title']."</td>
                            <td>".$row['description']."</td>
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
    <?php include 'includes/faqs/faqs_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<script>
  $(function(){
    //Initialize Select2 Elements
    $('.select2').select2();
    //CK Editor
    CKEDITOR.replace('description')
    CKEDITOR.replace('edit_description')
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
    let description = CKEDITOR.instances.description.getData();
   
    formData.set("description", description);
    
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/faqs/faqs_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        console.log(response);
        $('.msgadd').html(response.msg);
          setTimeout(function(){
            $('.msgadd').html('');
          },1500)
        if(response.sts==1){
            $('#title').html(response.msg); 
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
    let description = CKEDITOR.instances.edit_description.getData();
   
    formData.set("description", description);
    formData.append("edit",'edit');
    $.ajax({
      type: 'POST',
      url: 'includes/faqs/faqs_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        console.log(response);
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
      url: 'includes/faqs/faqs_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        $('.msgdelete').html(response.msg);
          setTimeout(function(){
            $('.msgdelete').html('');
          },1500)
        if(response.sts==1){
          setTimeout(function(){
            location.reload();  
          },1500)          
        }
        
      }
    })
});


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'includes/faqs/faqs_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
        //ckeditor.replace('#edit_description');
        
        CKEDITOR.instances.edit_description.setData(response.description);
        
        console.log(response.description)
      $('.userid').val(response.id);
      $('.status').attr('checked',false);
      $('#edit_title').val(response.title);
      //$('#edit_description').val(response.description);
      $('#edit_status'+response.status).attr('checked',true);
      $('.fullname').html(response.title);
    }
  });
}
</script>
</body>
</html>

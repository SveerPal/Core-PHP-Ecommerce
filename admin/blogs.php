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
      <h1>Blogs</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Blogs</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              <a href="blogs-add.php" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> New</a>
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
                      $stmt = $conn->prepare("SELECT * FROM blogs");
                      $stmt->execute();
                      foreach($stmt as $row){
                        $image="";
                        if(!empty($row['photo'])) {
                          $image="<img src='uploaded_files/blogs/".$row['photo']."' height='30px' width='30px'>";
                          
                        }  
                        $status = ($row['status']) ? '<span class="label label-success">active</span>' : '<span class="label label-danger">not active</span>';
                        echo "
                          <tr>
                            <td>".$row['id']."</td>
                            <td>".$image."</td>                            
                            <td>".$row['name']."</td>
                            <td>".$row['slug']."</td>
                            <td>
                              ".$status."
                              
                            </td>
                            <td>".date('d-m-Y', strtotime($row['createDate']))."</td>
                            <td>
                              <a href='blogs-edit.php?blog-id=".$row['id']."' class='btn btn-success btn-sm btn-flat' data-id='".$row['id']."'><i class='fa fa-edit'></i> Edit</a>
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
    <?php include 'includes/blogs/blogs_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){


  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  
});



$('#deleteForm').on('submit',function(e) {
    e.preventDefault();        
    let formData = new FormData(this);
    formData.append("delete",'delete');
    $.ajax({
      type: 'POST',
      url: 'includes/blogs/blogs_ajax.php',
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

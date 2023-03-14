<?php include 'includes/session.php'; 
	
	if(isset($_REQUEST['action']) && $_REQUEST['action']=='status'){
		$status = isset($_REQUEST['status'])?$_REQUEST['status']:'';
		$conn = $pdo->open();
		$update = $conn->prepare("UPDATE product_review set fld_status =:status where fld_id=:id");
		$update_done = $update->execute(array(':status'=>$status,':id' => $_REQUEST['fld_id']));
		if($update_done==1){
			$message = 'Updated Successfully';
		} else {
			$message = 'Error in update ';
		}
	}
	
	if(isset($_REQUEST['delete']) && $_REQUEST['delete']!=''){
		$conn = $pdo->open();
		$delete = $conn->prepare("DELETE from product_review where fld_id=:id");
		$del_done = $delete->execute(array(':id' => $_REQUEST['fld_id']));
		if($del_done==1){
			$message = 'Deleted Successfully';
		} else {
			$message = 'Error in Delete ';
		}
	}
?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Product Review</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Review</li>
      </ol>
	<div><?php if(isset($_REQUEST['update']) && $_REQUEST['update']=="done") { ?>
	<span class="alertss" style="color:red;"><?php echo "Record updated successfully"; ?></span>
	<?php } else if(isset($_REQUEST['add']) && $_REQUEST['add']=="done") { ?>
	<span class="alertss" style="color:red;"><?php echo "Record inserted successfully"; ?></span>
	<?php } ?>
	</div>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              
            </div>
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
				    <th>Date</th>
					<th>Name</th>
					<th>Email</th>
					<th>Product</th>
					<th>Rating</th>
					<th>Comments</th>
					<th>Status</th>
					<th>Action</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();
                    $i=1;
                    try{
                      $stmt = $conn->prepare("SELECT * FROM product_review order by fld_id desc");
                      $stmt->execute();
                      $prtncatlist="";
                      foreach($stmt as $row){
                        $prtncatlist.='<option value="'.$row['fld_id'].'">'.$row['fld_name'].'</option>';
                         
                        if(isset($row['fld_status']) && $row['fld_status'] =='1'){
							$status = 'Active';
							$ap = "<a class='btn btn-success btn-sm' onClick='return confirm(\"Are you sure, You want to change the status\")' href='review.php?fld_id=".$row['fld_id']."&status=0&action=status'><i class='fa fa-edit'></i> Disapprove</a>";
						}else{
							$status = 'Inactive';
							$ap = "<a class='btn btn-warning btn-sm' onClick='return confirm(\"Are you sure, You want to change the status\")' href='review.php?fld_id=".$row['fld_id']."&status=1&action=status'><i class='fa fa-edit'></i> Approve</a>";
						}
						
						
                        echo "
                          <tr>
						    <td>".date("d-M-Y",strtotime($row['fld_upload_date']))."</td>
                            <td>".$row['fld_name']."</td>
                            <td>".$row['fld_email']."</td>
                            <td><a href='products-edit.php?product-id=".$row['fld_product_id']."' target='_blank'>".$row['fld_product_id']."</a></td>
							<td>".$row['fld_rating']."</td>
							<td>".$row['fld_comments']."</td>
                            <td>".$status."</td>
                            <td>
                              ".$ap."
                              <a class='btn btn-danger btn-sm' onClick='return confirm(\"Are you sure want to delete this record\")' href='review.php?fld_id=".$row['fld_id']."&delete=yes'><i class='fa fa-trash'></i> Delete</a>
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

$('#deleteForm').on('submit',function(e) {
    e.preventDefault();        
    let formData = new FormData(this);
    formData.append("delete",'delete');
    $.ajax({
      type: 'POST',
      url: 'includes/products_brands/brands_ajax.php',
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


</script>
</body>
</html>

<?php include 'includes/session.php'; 

if(isset($_REQUEST['delete']) && $_REQUEST['delete']!=''){
		$conn = $pdo->open();
		$delete = $conn->prepare("DELETE from products_coupon where fld_id=:id");
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
      <h1>Products Coupon</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Coupon</li>
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
              <a href="add-coupon.php" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> New</a>
            </div>
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
					<th>Sr. No.</th>                
					<th>Code</th>
					<th>Discount Type</th>
					<th>Amount</th>
					<th>Expiry Date</th>
					<th>Status</th>
					<th>Action</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();
                    $i=1;
                    try{
                      $stmt = $conn->prepare("SELECT * FROM products_coupon");
                      $stmt->execute();
                      $prtncatlist="";
                      foreach($stmt as $row){
                        $prtncatlist.='<option value="'.$row['fld_id'].'">'.$row['fld_code'].'</option>';
                         
                        if(isset($row['fld_status']) && $row['fld_status'] =='1'){
							$status = 'active';
						}else{
							$status = 'inactive';
						}
						
						if(isset($row['discount_type']) && $row['discount_type'] =='per'){
							$ctype = 'Percentage (%)';
						}else{
							$ctype = 'Flat';
						}
						
                        echo "
                          <tr>
                            <td>".$row['fld_id']."</td>                       
                            <td>".$row['fld_code']."</td>
                            <td>".$row['discount_amount']."</td>
                            <td>".$ctype."</td>
                            <td>".$row['fld_expiry_date']."</td>
                            <td>".$status."</td>
                            <td>
                              <a class='btn btn-success btn-sm' href='add-coupon.php?fld_id=".$row['fld_id']."'><i class='fa fa-edit'></i> Edit</a>
                              <a class='btn btn-danger btn-sm' onClick='return confirm(\"Are you sure want to delete this record\")' href='coupon.php?fld_id=".$row['fld_id']."&delete=yes'><i class='fa fa-trash'></i> Delete</a>
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

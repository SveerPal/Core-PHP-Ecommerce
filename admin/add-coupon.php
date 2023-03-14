<?php include 'includes/session.php'; ?>
<?php 
$conn = $pdo->open();
$date = date("Y-m-d");
    $table_name = 'products_coupon';
	//function for save client
	if(isset($_POST['action']) && $_POST['action']=='Save'){
		$fld_code = trim($_POST['fld_code']);
		$fld_discount_type = trim($_POST['fld_discount_type']);
		$fld_amount = trim($_POST['fld_amount']);
		$fld_status = trim($_POST['fld_status']);
		$fld_expiry_date = trim($_POST['fld_expiry_date']);
		
		$result = $conn->prepare("INSERT INTO ".$table_name." (fld_code,discount_type,discount_amount,fld_expiry_date,fld_status,fld_upload_date) VALUES (:fld_code,:discount_type,:discount_amount,:fld_expiry_date,:fld_status,:fld_upload_date)");
		
		$result->execute(['fld_code'=>$fld_code,'discount_type'=>$fld_discount_type,'discount_amount'=>$fld_amount,'fld_expiry_date'=>$fld_expiry_date,'fld_status'=>$fld_status,'fld_upload_date'=>$date]);
	
		if($result){
			$message = 'Inserted successfully';
			header("location: coupon.php?add=done");
		} else {
			$message = 'Error';
		}
	}

	//function for update client
	if(isset($_POST['action']) && $_POST['action']=='Update'){
		$fld_code = trim($_POST['fld_code']);
		$fld_discount_type = trim($_POST['fld_discount_type']);
		$fld_amount = trim($_POST['fld_amount']);
		$fld_status = trim($_POST['fld_status']);
		$fld_expiry_date = trim($_POST['fld_expiry_date']);
		
		$result = $conn->prepare("UPDATE ".$table_name." SET fld_code=:fld_code,discount_type=:discount_type,discount_amount=:discount_amount,fld_expiry_date=:fld_expiry_date,fld_status=:fld_status,fld_upload_date=:fld_upload_date WHERE fld_id=:fld_id");
		
		$result->execute(['fld_code'=>$fld_code,'discount_type'=>$fld_discount_type,'discount_amount'=>$fld_amount,'fld_expiry_date'=>$fld_expiry_date,'fld_status'=>$fld_status,'fld_upload_date'=>$date,'fld_id'=>$_REQUEST['fld_id']]);
		
		if($result){
			$message = 'Updated successfully';
			header("location: coupon.php?update=done");
		} else {
			$message = 'Error';
		}
	}


$fld_code = $fld_discount_type = $fld_amount = '';		
if(isset($_REQUEST['fld_id']) && $_REQUEST['fld_id']!='' && $_REQUEST['fld_id'] > 0){
		
	$stmt = $conn->prepare("SELECT * FROM ".$table_name." WHERE fld_id=:fld_id");
	$stmt->execute(['fld_id'=>$_REQUEST['fld_id']]);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
	//$result = $db->prepare("SELECT * FROM ".$table_name." where fld_id='".$_REQUEST['fld_id']."' ");
	//$result->execute();
	//$row=$result->fetch(PDO::FETCH_ASSOC);
	$fld_code = stripslashes($row['fld_code']);
	$fld_discount_type = stripslashes($row['discount_type']);
	$fld_amount = stripslashes($row['discount_amount']);
	$fld_status = stripslashes($row['fld_status']);
	$fld_expiry_date = date('Y-m-d',strtotime($row['fld_expiry_date']));
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
      <h1>Add Coupon Code</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Add Coupon Code</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-xs-12">
          <form class="form-inlinee" method="POST" id="addCoupon" enctype="multipart/form-data">
            <div class="box">
              <div class="box-header with-border">
                <a href="coupon.php" class="btn btn-primary btn-sm btn-flat backto"><i class="fa fa-arrow-left"></i> Back</a>
              </div>
              <div class="box-body">
              
						
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE FORM PORTLET-->
                                <div class="portlet light bordered">
                                    
                                    <div class="portlet-body form">
                                    <div class="form-body">
									<div class="col-md-6">
									  <div class="form-group">						 
                                     <label> Coupon Code <span class="required-form">*</span></label> 
                                     <input type="text" name="fld_code" id="fld_code" class="form-control required" required='' value="<?php echo $fld_code; ?>">
									 </div>
									</div>
									<div class="col-md-6">
									  <div class="form-group">						 
                                     <label>Discount Type <span class="required-form">*</span></label> 
                                     <select name="fld_discount_type" class="form-control required"  required='' >
                                         
                                         <option value='flat' <?php if($fld_discount_type == 'flat'){ echo 'selected'; } ?>>Flat</option>
                                         <option value='per' <?php if($fld_discount_type == 'per'){ echo 'selected'; } ?>>Percentage (%)</option>
                                     </select>
									 </div>
									</div>
									<div class="col-md-6">
									  <div class="form-group">						 
                                     <label>Amount <span class="required-form">*</span></label> 
                                     <input type="number" name="fld_amount" id="fld_amount" class="form-control required" value="<?php echo $fld_amount; ?>" required='' >
									 </div>
									</div>
									<div class="col-md-6">
									  <div class="form-group">						 
                                     <label>Expiry Date <span class="required-form">*</span></label> 
                                     <input type="date" name="fld_expiry_date" id="fld_expiry_date" class="form-control required" value="<?php echo $fld_expiry_date; ?>" required='' >
									 </div>
									</div>
									<div class="col-md-6">
									  <div class="form-group">						 
                                     <label>Status <span class="required-form">*</span></label> 
                                     <select name="fld_status" class="form-control required"  required='' >
                                         
                                         <option value='1' <?php if($fld_status == '1'){ echo 'selected'; } ?>>Active</option>
                                         <option value='0' <?php if($fld_status == '0'){ echo 'selected'; } ?>>Inactive</option>
                                     </select>
									 </div>
									</div>
									 </div>
									<div style="clear:both;"></div>
                                    </div>  
                                    
                          
              </div>
            </div>

            <div class="form-group col-sm-offset-11">
             <?php if(isset($_REQUEST['fld_id']) && $_REQUEST['fld_id'] > 0){ ?>
			 <input class="btn btn-success btn-flat" type="submit" name="action" value="Update" /> 
			 <?php }else{ ?>
			  <input class="btn btn-success btn-flat" type="submit" name="action" value="Save" />
             <?php } ?>
			</div>
            <span class="msgadd"><?php echo isset($message)?$message:'' ?></span>
          </form>

        </div>
      </div>
    </section>
     
  </div>
  	<?php include 'includes/footer.php'; ?>
</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
</body>
</html>





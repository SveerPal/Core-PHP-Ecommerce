<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="body">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>User Details</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">User Details</li>
      </ol>
    </section>
    <style>
        .cart__thumbnail {
            display: flex;
            align-items: flex-start;
            gap: 20px;
        }
        .colspancls{
            text-align: right;
            font-weight: 900;
            font-size: 15px;
        }
        .amountcls{
            font-weight: 800;
            font-size: 15px;
        }
        
        .invoice-address{
            text-align: right;
            margin-bottom:10px;
        }
        .invoice-address h3{
            padding:0px;
            margin:0px;
        }
        .social ul{
            display: flex;
            justify-content: end;
            gap: 20px;
            list-style:none;
        }
        a{
            color:#000;
        }
        .info{
            text-align:rightt;
        }
        .text-right{
            text-align:right;
        }
    </style>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
            <div class="box">
              <div class="box-header with-border">
                <a href="users.php" class="btn btn-primary btn-sm btn-flat backto"><i class="fa fa-arrow-left"></i> Back</a>
                <!--<button onclick="Convert_HTML_To_PDF();" class="btn btn-success btn-sm btn-flat backto"><i class="fa fa-file-pdf-o"></i> Invoice</button>-->
              </div>
              <div class="box-body">
                    <?php  
                    $user_id = $_GET['user'];
                    $userdetails=$SettingsData->userDetail($user_id);
                    $userdetailsaddress=$SettingsData->userDetailAddress($user_id,'billing');
                    
                    ?>
                    <div class="col-md-12">
                        <div class="right-box">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="bx1">
                                      <h3>Profile Information</h3>
                                      <p><label>Name:</label> <?php echo $userdetails['firstname']." ".$userdetails['lastname'];?></p>
                                      <p><label>User Name:</label> <?php echo $userdetails['username']." ".$userdetails['fld_last_name'];?></p>
                                      <p><label>Email:</label> <a href="mailto:<?php echo $userdetails['email'];?>"><?php echo $userdetails['email'];?></a></p>
                                      <p><label>Phone:</label> <a href="tel:<?php echo $userdetails['phone_no'];?>"><?php echo $userdetails['phone_no'];?></a></p>
                                      
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="bx1">
                                        <h3>Billing Address</h3>
                                        <p><?php echo $userdetailsaddress['fld_first_name']." ".$userdetailsaddress['fld_last_name'];?></p>
                                        <p><?php echo $userdetailsaddress['fld_email_id'];?></p>
                                        <p><?php echo $userdetailsaddress['fld_phone_no'];?></p>
                                        <p><?php echo $userdetailsaddress['fld_address'];?>, <?php echo $userdetailsaddress['fld_address2'];?></p>
                                        <p></p>
                                        <p><?php echo $userdetailsaddress['fld_city'];?>, <?php echo $userdetailsaddress['fld_zip_code'];?></p>
                                        <!--<p><?php //echo $orderdetails['fld_state'];?></p>-->
                                        <!--<p><?php //echo $orderdetails['fld_zip_code'];?></p>-->
                                        <p><?php echo $userdetailsaddress['fld_country'];?></p>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="bx1">
                                        <h3>Shipping Address</h3>
                                        <?php $userdetailsaddress=$SettingsData->userDetailAddress($user_id,'shipping'); ?>
                                        <p><?php echo $userdetailsaddress['fld_first_name']." ".$userdetailsaddress['fld_last_name'];?></p>
                                        <p><?php echo $userdetailsaddress['fld_email_id'];?></p>
                                        <p><?php echo $userdetailsaddress['fld_phone_no'];?></p>
                                        <p><?php echo $userdetailsaddress['fld_address'];?>, <?php echo $userdetailsaddress['fld_address2'];?></p>
                                        <p></p>
                                        <p><?php echo $userdetailsaddress['fld_city'];?>, <?php echo $userdetailsaddress['fld_zip_code'];?></p>
                                        <!--<p><?php //echo $orderdetails['fld_shipping_state'];?></p>-->
                                        <!--<p><?php //echo $orderdetails['fld_shipping_zip_code'];?></p>-->
                                        <p><?php echo $userdetailsaddress['fld_country'];?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                    
                    <div class="box-body">
                        <center><h2><?php/// echo $userdetails['firstname']." ".$userdetails['lastname'];?> Order History</h2></center>    
                      <table id="example1" class="table table-bordered">
                        <thead>
                          <th class="hidden"></th>
                          <th>Order No</th>
                          <th>Name</th>
                          <th>Transaction#</th>
                          <th>Amount</th>
                          <th>Date</th>
                          <th>Payment Type</th>
                          <th>Status</th>
                          <th>Full Details</th>
                        </thead>
                        <tbody>
                          <?php
                            $rows=$SettingsData->getOrderListByUser($user_id);
                            if($rows){
                                foreach($rows as $row){
                                    $orderid=$row['fld_order_id'];
                                    $pscls="";
                                    if($row['fld_payment_status']=='confirmed'){
                                        $pscls='btn-sm btn btn-success';
                                    }elseif($row['fld_payment_status']=='pending'){
                                        $pscls='btn-sm btn btn-warning';
                                    }elseif($row['fld_payment_status']=='cancel'){
                                        $pscls='btn-sm btn btn-danger';
                                    }
                                    //<td class='d-none'><button type='button' class='btn btn-info btn-sm btn-flat transact' data-id='".$row['salesid']."'><i class='fa fa-search'></i> View</button></td>
                                    echo "
                                      <tr>
                                        <td class='hidden'></td>
                                        <td>#".$row['fld_order_id']."</td>
                                        <td>".$row['fld_first_name'].' '.$row['fld_last_name']."</td>
                                        <td>".$row['fld_transaction_id']."</td>
                                        <td> ".CURRENCY.' '.number_format($row['fld_amount'], 2)."</td>
                                        <td>".date('M d, Y', strtotime($row['fld_modified_date']))."</td>
                                        <td>".$row['fld_payment_type']."</td>
                                        <td><span class='$pscls'>".ucwords($row['fld_payment_status'])."</span></td>
                                        
                                        <td>
                                            <a href='order_details.php?order_id=".$row['fld_order_id']."' class='btn btn-info btn-sm btn-flat'>
                                                <i class='fa fa-eye'></i> 
                                                View
                                            </a>
                                            <a onclick='cancelOrder(".$orderid.")' class='btn btn-danger btn-sm btn-flat'>
                                                <i class='fa fa-trash'></i> 
                                                Cancel Order
                                            </a>
                                        </td>
                                      </tr>
                                    ";
                                }
                            }else{
                            ?>
                            <tr>
                                <td colspan="8">No order found</td>
                            </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                      </table>
                    </div>
                    
              </div>
            </div>
        </div>
      </div>
    </section>
    
    
    
    
    
     
     
     
  </div>
  	<?php include 'includes/footer.php'; ?>
    <?php include 'includes/products/products_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>



</body>
</html>





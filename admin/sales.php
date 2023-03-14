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
      <h1>
        Sales History
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Sales</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              <div class="pull-right">
                <!--<form method="POST" class="form-inline" action="sales_print.php">-->
                <!--  <div class="input-group">-->
                <!--    <div class="input-group-addon">-->
                <!--      <i class="fa fa-calendar"></i>-->
                <!--    </div>-->
                <!--    <input type="text" class="form-control pull-right col-sm-8" id="reservation" name="date_range">-->
                <!--  </div>-->
                <!--  <button type="submit" class="btn btn-success btn-sm btn-flat" name="print"><span class="glyphicon glyphicon-print"></span> Print</button>-->
                <!--</form>-->
              </div>
            </div>
            <div class="box-body">
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
                    $rows=$SettingsData->getOrderList();
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
    </section>
     
  </div>
  	<?php include 'includes/footer.php'; ?>
    <?php include '../includes/profile_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<!-- Date Picker -->
<script>
$(function(){
  //Date picker
  $('#datepicker_add').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd'
  })
  $('#datepicker_edit').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd'
  })

  //Timepicker
  $('.timepicker').timepicker({
    showInputs: false
  })

  //Date range picker
  $('#reservation').daterangepicker()
  //Date range picker with time picker
  $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
  //Date range as a button
  $('#daterange-btn').daterangepicker(
    {
      ranges   : {
        'Today'       : [moment(), moment()],
        'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month'  : [moment().startOf('month'), moment().endOf('month')],
        'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      },
      startDate: moment().subtract(29, 'days'),
      endDate  : moment()
    },
    function (start, end) {
      $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
    }
  )
  
});
</script>
<script>
$(function(){
  $(document).on('click', '.transact', function(e){
    e.preventDefault();
    $('#transaction').modal('show');
    var id = $(this).data('id');
    $.ajax({
      type: 'POST',
      url: 'transact.php',
      data: {id:id},
      dataType: 'json',
      success:function(response){
        $('#date').html(response.date);
        $('#transid').html(response.transaction);
        $('#detail').prepend(response.list);
        $('#total').html(response.total);
      }
    });
  });

  $("#transaction").on("hidden.bs.modal", function () {
      $('.prepend_items').remove();
  });
});


function cancelOrder(orderid){
    
    if (confirm("Are you sure you want to cancel this order? ") == true) {
        $.ajax({
          type: 'POST',
          url: '<?php echo SITE_URL;?>admin/ajax/order-update.php',
          data: {orderid:orderid},
          dataType: 'json',
          success:function(response){
              if(response.status==1){
                  alert("Order #"+orderid+" Canceled")
                  location.reload();
              }else{
                  alert(response.msg)
              }
            
          }
        });
    } 
}
</script>
</body>
</html>

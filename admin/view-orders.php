<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; 

      $getorderlists= $SettingsData->getOrderList(); 
  ?>
  <style>
    td.warning {
    text-transform: capitalize;
    }
    td.green {
        text-transform: capitalize;
    }
  </style>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>View Orders</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">View Orders</li>
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
            <?php //print_r($getorderlists); ?>
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
                  <!-- <th>Sr. No.</th> -->               
                  <th>Order ID</th>
                  <th>Date</th>
                  <th>Payment Status</th>
                  <th>Total</th>
                  <th>Action</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();
                    $i=1;
                    try{
                      $stmt = $conn->prepare("SELECT * FROM order_detials");
                      $stmt->execute();
                      $prtncatlist="";
                      foreach($stmt as $row){
                        //echo $row['fld_user_id'];
                        $class="";
                          if($row['fld_payment_status']=='confirmed'){
                              $class="green";
                          }elseif($row['fld_payment_status']=='cancel'  || $row['fld_payment_status']=='failed'){
                              $class="red";
                          }else{
                              $class="warning";
                          }
                        $status = ($row['fld_payment_status']) ? '<span class="label label-success">active</span>' : '<span class="label label-danger">not active</span>';
                        echo "
                          <tr>
                            <td>".$row['fld_order_id']."</td>                       
                            <td>".date('d-m-Y', strtotime($row['fld_payment_date']))."</td>
                            <td class='".$class."'>".$row['fld_payment_status']."</td>
                           
                            <td>".number_format((float)$row['fld_amount'], 2, '.', '')."</td>
                            <td>
                              <a href='order_details.php?order_id=".$row['fld_order_id']."&discount_amount=".$row['discount_amount']."&user_id=".$row['fld_user_id']."' class='btn btn-info btn-sm btn-flat'><i class='fa fa-search'></i> Order Details</a>
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
    <!-- 
       <button class='btn btn-danger btn-sm delete btn-flat' data-id='".$row['fld_order_id']."'><i class='fa fa-trash'></i> Delete</button> 
                                    <button class='btn btn-success btn-sm edit btn-flat' value='".$row['discount_amount']."' data-id='".$row['fld_order_id']."'><i class='fa fa-edit'></i> View Order</button>
-->
  </div>
  	<?php include 'includes/footer.php'; ?>
    <?php include 'includes/order-list/order_list_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){

  $(document).on('click', '.edit', function(e){
    e.preventDefault();
    $('#edit').modal('show');
    var discount_amount = this.value;
    var id = $(this).data('id');
    
    getRow(id,discount_amount);
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
    formData.append("add",'add');
    $.ajax({
      type: 'POST',
      url: 'includes/blogs-categories/categories_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        //console.log(response);
        $('.msgadd').html(response.msg);
          setTimeout(function(){
            $('.msgadd').html('');
          },2500)
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
      url: 'includes/blogs-categories/categories_ajax.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        //console.log(response);
        $('.msgedit').html(response.msg);
          setTimeout(function(){
            $('.msgedit').html('');
          },2500)
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
      url: 'includes/blogs-categories/categories_ajax.php',
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


function getRow(id,discount_amount){
  $.ajax({
    type: 'POST',
    url: 'includes/order-list/order_row.php',
    data: {id:id,discount_amount:discount_amount},
    success: function(response){
      //alert(response);
      $('.order-listing').html(response);
    }
  });
}
</script>
</body>
</html>

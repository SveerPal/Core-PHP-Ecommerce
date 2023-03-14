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
      <h1>Order Details</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Order Details</li>
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
                <a href="sales.php" class="btn btn-primary btn-sm btn-flat backto"><i class="fa fa-arrow-left"></i> Back</a>
                <button onclick="Convert_HTML_To_PDF();" class="btn btn-success btn-sm btn-flat backto"><i class="fa fa-file-pdf-o"></i> Invoice</button>
              </div>
              <div class="box-body">
                    <?php  
                    $orderid = $_GET['order_id'];
                    $discount_amount =$discount_code= '';
                    $user_id = '';
                    $sub_total=0;
                    $items_name=0;
                    $orderdetails=$SettingsData->orderDetail($orderid);
                    $discount_amount=$orderdetails['discount_amount'];
                    $discount_code=$orderdetails['discount_code'];
                    $user_id=$orderdetails['fld_user_id'];
                    ?>
                    <table class="table table-bordered table-stripedd"> 
                        <thead>
                            <th>Sr. No.</th>
                            <th>Items</th>
                            <th>HSN CODE</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Sub Total</th>
                        </thead>
                        <tbody>
                            <tr>
                            <?php 
                            $sub_total=0;
                            $items_name=$sub_total_product=0;
                            $i=1;
                            $orderproductdetails=$SettingsData->orderDetailProduct($orderid);
                            if($orderproductdetails){
                               
                                foreach($orderproductdetails as $orderproductdetail){
                                    $productvar_name='';
                                    $sub_total_product='';
                                    if($orderproductdetail['fld_product_variation_id'] > 0){
                                      $productvar_name=$SettingsData->getProductVariationAttributeValue($orderproductdetail['fld_product_id'],$orderproductdetail['fld_product_variation_id']);
                                  
                                    }
                                    $sub_total += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
                                    $sub_total_product += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
                                    // $sub_total += (int)$orderproductdetail['fld_amount'];
                                    $items_name .= $orderproductdetail['fld_product_name'].' '.$productvar_name.' (QNT-'.$orderproductdetail["fld_quantity"].')';
                                    $productDetails=$SettingsData->getProductDetail($orderproductdetail['fld_product_id']);
                                    //print_r($productDetails);
                            ?>
                                <td><?php echo $i; ?></td>
                                <td>
                                    <div class="cart__thumbnail ">
                                        <a href="<?php echo SITE_URL?>product/<?php echo $productDetails[0]['slug'] ?>.html">
                                            <img class="border-radius-5" style="width:50px; height:60px" src="<?php echo UPLOADS ?>products/<?php echo $productDetails[0]['photo'] ?>" alt="<?php echo $orderproductdetail['fld_product_name']; ?>">
                                        </a>
                                        <div >
                                            <h4 class="cart__content--title"> 
                                                <a href="<?php echo SITE_URL?>product/<?php echo $productDetails[0]['slug'] ?>.html">
                                                    <?php echo $orderproductdetail['fld_product_name']; ?>
                                                </a>    
                                            </h4>
                                            <span class="cart__content--variant"><?php echo $productvar_name; ?></span>
                                        </div>    
                                    </div>
                                </td>
                                <td><span class="in__stock text__secondary"><?php echo $productDetails[0]['hsn_code'] ?></span></td>
                                <td><span class="in__stock text__secondary"><?php echo $orderproductdetail['fld_quantity']; ?></span></td>
                                <td><?php echo CURRENCY.number_format((float)$orderproductdetail['fld_amount'], 2, '.', ''); ?></td>
                                <td><?php echo CURRENCY.number_format((float)$sub_total_product, 2, '.', ''); ?></td>
                            </tr>
                            <?php $i++;} } 
                            
                            $vat=0;
                            $vat = ceil(($sub_total*GST)/100);
                            $total_amount =  (($sub_total)-$discount_amount);
                            $amount = (int) $total_amount;
                            echo $getorderlist['discount_code'];
                            ?>
                            <tr>
                                <td colspan="5" class="colspancls">Sub Total</td>
                                <td class="amountcls"><?php echo CURRENCY.number_format((float)($sub_total-$vat), 2, '.', ''); ?></td>
                            </tr>
                            <tr>
                                <td colspan="5" class="colspancls">GST (<?php echo GST; ?>%)</td>
                                <td class="amountcls"><?php echo CURRENCY.number_format((float)$vat, 2, '.', ''); ?></td>
                            </tr>
                            <?php if($discount_amount){ ?>
                            <tr>
                                <td colspan="5" class="colspancls">Coupon</td>
                                <td class="amountcls">- <?php echo CURRENCY.number_format((float)$discount_amount, 2, '.', ''); ?></td>
                            </tr>
                            <?php } ?>
                            <?php $shippingcharge = 0; ?>
                            <tr>
                                <td colspan="5" class="colspancls">Shipping Charges</td>
                                <td class="amountcls"><?php echo CURRENCY.number_format((float)$shippingcharge, 2, '.', ''); ?></td>
                            </tr>
                           
                            <tr>
                                <td colspan="5" class="colspancls">Total</td>
                                <td class="amountcls"><?php echo CURRENCY.number_format((float)$amount, 2, '.', ''); ?></td>
                            </tr>
                        </tbody>
                    </table> 
                    
                    <div class="col-md-12">
                        <div class="right-box">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="bx1">
                                      <h3>Other Information</h3>
                                      <p><label>Order ID:</label> <?php echo $orderid;?></p>
                                      <p><label>Order Status:</label> <?php echo ucwords($orderdetails['fld_payment_status']);?></p>
                                      <p><label>Order Date:</label> <?php echo date('M d, Y', strtotime($orderdetails['fld_modified_date']));?></p>
                                      <p><label>Payment Type:</label> <?php echo $orderdetails['fld_payment_type'];?></p>
                                      <p><label>Shipping Method:</label> <?php echo 'N/A';?></p>
                                      <p><label>Email:</label> <a href="mailto:<?php echo $orderdetails['fld_email_id'];?>"><?php echo $orderdetails['fld_email_id'];?></a></p>
                                      <p><label>Phone:</label> <a href="tel:<?php echo $orderdetails['fld_phone_no'];?>"><?php echo $orderdetails['fld_phone_no'];?></a></p>
                                      
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="bx1">
                                        <h3>Billing Address</h3>
                                        <p><?php echo $orderdetails['fld_first_name']." ".$orderdetails['fld_last_name'];?></p>
                                        <p><?php echo $orderdetails['fld_email_id'];?></p>
                                        <p><?php echo $orderdetails['fld_phone_no'];?></p>
                                        <p><?php echo $orderdetails['fld_address'];?>, <?php echo $orderdetails['fld_address2'];?></p>
                                        <p></p>
                                        <p><?php echo $orderdetails['fld_city'];?>, <?php echo $orderdetails['fld_zip_code'];?></p>
                                        <!--<p><?php //echo $orderdetails['fld_state'];?></p>-->
                                        <!--<p><?php //echo $orderdetails['fld_zip_code'];?></p>-->
                                        <p><?php echo $orderdetails['fld_country'];?></p>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="bx1">
                                        <h3>Shipping Address</h3>
                                        <p><?php echo $orderdetails['fld_shipping_first_name']." ".$orderdetails['fld_shipping_last_name'];?></p>
                                        <p><?php echo $orderdetails['fld_shipping_email_id'];?></p>
                                        <p><?php echo $orderdetails['fld_shipping_phone_no'];?></p>
                                        <p><?php echo $orderdetails['fld_shipping_address'];?>, <?php echo $orderdetails['fld_shipping_address2'];?></p>
                                        <p></p>
                                        <p><?php echo $orderdetails['fld_shipping_city'];?>, <?php echo $orderdetails['fld_shipping_zip_code'];?></p>
                                        <!--<p><?php //echo $orderdetails['fld_shipping_state'];?></p>-->
                                        <!--<p><?php //echo $orderdetails['fld_shipping_zip_code'];?></p>-->
                                        <p><?php echo $orderdetails['fld_shipping_country'];?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                    
              </div>
            </div>
        </div>
      </div>
    </section>
    
    
    
    
    <section class="content" id="contentToPrint" style="display:none">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body">
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
                        <link rel="stylesheet" href="https://alpasban.com/admin/bower_components/font-awesome/css/font-awesome.min.css">
                        <div class="col-md-6">
                            <a href="<?php echo SITE_URL;?>" target="_blank" ><img width="250" src="<?php echo SITE_URL;?>admin/uploaded_files/119052dfd38f843460bca510126f2baa.png"/></a>
                        </div>
                        <div class="col-md-2">
                            <p class="info"><label>Order ID:&nbsp;&nbsp; </label> <?php echo $orderid;?></p>
                            <p class="info"><label>Date:&nbsp;&nbsp; </label> <?php echo date('M d, Y', strtotime($orderdetails['fld_modified_date']));?></p>
                            <p class="info"><label>Invoice No.&nbsp; :&nbsp;&nbsp; </label><?php echo $_GET['order_id']; ?></p>
                        </div>
                        <div class="col-md-4 invoice-address">
                            <h3 class="">Address</h3>
                            <h5 class="h5"><?php echo str_replace(' ','&nbsp;&nbsp;&nbsp;&nbsp;',$SettingsData->getSettingsData('address')); ?></h5>
                            <h5 class="h5"><a href="tel:<?php echo $SettingsData->getSettingsData('phone'); ?>"><?php echo $SettingsData->getSettingsData('phone'); ?></a></h5>
                            <h5 class="h5"><a href="mailto:<?php echo $SettingsData->getSettingsData('email'); ?>"><?php echo $SettingsData->getSettingsData('email'); ?></a></h5>
                           
                            <div class="social " style="display:none">
                                
                                <ul class="d-inline">
                                    <li class="">
                                        <a class="" target="_blank" href="<?php echo $SettingsData->getSettingsData('facebook'); ?>">
                                            <i class="fa fa-facebook-f"></i>
                                        </a>
                                    </li>
                                    <?php 
                                        $twitter = $SettingsData->getSettingsData('twitter');
                                        if(isset($twitter) && !empty($twitter)){ 
                                    ?>
                                    <li class="">
                                        <a class="" target="_blank" href="<?php echo $SettingsData->getSettingsData('twitter'); ?>">
                                             <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <?php } ?>
                                    <li class="">
                                        <a class="" target="_blank" href="<?php echo $SettingsData->getSettingsData('instagram'); ?>">
                                             <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                    <?php 
                                        $youtube = $SettingsData->getSettingsData('youtube');
                                        if(isset($youtube) && !empty($youtube)){ 
                                    ?>
                                    <li class="">
                                        <a class="" target="_blank" href="<?php echo $SettingsData->getSettingsData('youtube'); ?>">
                                             <i class="fa fa-youtube"></i>
                                        </a>
                                    </li>
                                    <?php } ?>
                                </ul>
                            </div>
                            
                            
                        </div>
                        <?php  
                        $orderid = $_GET['order_id'];
                        $discount_amount =$discount_code= '';
                        $user_id = '';
                        $sub_total=0;
                        $items_name=0;
                        $orderdetails=$SettingsData->orderDetail($orderid);
                        $discount_amount=$orderdetails['discount_amount'];
                        $discount_code=$orderdetails['discount_code'];
                        $user_id=$orderdetails['fld_user_id'];
                        ?>
                        <table class="table table-bordered table-stripedd"> 
                            <thead>
                                <th>Sr. No.</th>
                                <th>Items</th>
                                <th>HSN CODE</th>
                                <th class="text-right">Quantity</th>
                                <th class="text-right">Price</th>
                                <th class="text-right">Sub Total</th>
                            </thead>
                            <tbody>
                                <tr>
                                <?php 
                                $sub_total=0;
                                $items_name=$sub_total_product=0;
                                $i=1;
                                $orderproductdetails=$SettingsData->orderDetailProduct($orderid);
                                if($orderproductdetails){
                                   
                                    foreach($orderproductdetails as $orderproductdetail){
                                        $productvar_name='';
                                        $sub_total_product='';
                                        if($orderproductdetail['fld_product_variation_id'] > 0){
                                          $productvar_name=$SettingsData->getProductVariationAttributeValue($orderproductdetail['fld_product_id'],$orderproductdetail['fld_product_variation_id']);
                                      
                                        }
                                        $sub_total += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
                                        $sub_total_product += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
                                        // $sub_total += (int)$orderproductdetail['fld_amount'];
                                        $items_name .= $orderproductdetail['fld_product_name'].'&nbsp;&nbsp;'.$productvar_name.' (QNT-'.$orderproductdetail["fld_quantity"].')';
                                        $productDetails=$SettingsData->getProductDetail($orderproductdetail['fld_product_id']);
                                        //print_r($productDetails);
                                ?>
                                    <td><?php echo $i; ?></td>
                                    <td widthh="70%">
                                        <div class="cart__thumbnail ">
                                            <a href="<?php echo SITE_URL?>product/<?php echo $productDetails[0]['slug'] ?>.html">
                                                <img class="border-radius-5" style="width:50px; height:60px" src="<?php echo UPLOADS ?>products/<?php echo $productDetails[0]['photo'] ?>" alt="<?php echo $orderproductdetail['fld_product_name']; ?>">
                                            </a>
                                            <div >
                                                <h4 class="cart__content--title"> 
                                                    <a href="<?php echo SITE_URL?>product/<?php echo $productDetails[0]['slug'] ?>.html">
                                                        <?php echo str_replace(' ','&nbsp;&nbsp;&nbsp;&nbsp;',$orderproductdetail['fld_product_name']); ?>
                                                    </a>    
                                                </h4>
                                                <span class="cart__content--variant"><?php echo str_replace(' ','&nbsp;&nbsp;&nbsp;&nbsp;',$productvar_name); ?></span>
                                            </div>    
                                        </div>
                                    </td>
                                    <td><span class="in__stock text__secondary"><?php echo $productDetails[0]['hsn_code'] ?></span></td>
                                    <td class="text-right"><span class="in__stock text__secondary"><?php echo $orderproductdetail['fld_quantity']; ?></span></td>
                                    <td class="text-right"><?php echo 'INR&nbsp;&nbsp; '.number_format((float)$orderproductdetail['fld_amount'], 2, '.', ''); ?></td>
                                    <td class="text-right"><?php echo 'INR&nbsp;&nbsp; '.number_format((float)$sub_total_product, 2, '.', ''); ?></td>
                                </tr>
                                <?php $i++;} } 
                                
                                $vat=0;
                                $vat = ceil(($sub_total*GST)/100);
                                $total_amount =  (($sub_total)-$discount_amount);
                                $amount = (int) $total_amount;
                                echo $getorderlist['discount_code'];
                                ?>
                                <tr>
                                    <td colspan="5" class="colspancls">Sub Total</td>
                                    <td class="amountcls text-right"><?php echo 'INR&nbsp;&nbsp; '.number_format((float)($sub_total-$vat), 2, '.', ''); ?></td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="colspancls">GST&nbsp;&nbsp; (<?php echo GST; ?>%)</td>
                                    <td class="amountcls text-right"><?php echo 'INR&nbsp;&nbsp; '.number_format((float)$vat, 2, '.', ''); ?></td>
                                </tr>
                                <?php if($discount_amount){ ?>
                                <tr>
                                    <td colspan="5" class="colspancls">Coupon</td>
                                    <td class="amountcls text-right">- <?php echo 'INR&nbsp;&nbsp; '.number_format((float)$discount_amount, 2, '.', ''); ?></td>
                                </tr>
                                <?php } ?>
                                <?php $shippingcharge = 0; ?>
                                <tr>
                                    <td colspan="5" class="colspancls">Shipping &nbsp;Charges</td>
                                    <td class="amountcls text-right"><?php echo 'INR&nbsp;&nbsp; '.number_format((float)$shippingcharge, 2, '.', ''); ?></td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="colspancls">Total</td>
                                    <td class="amountcls text-right"> <?php echo 'INR&nbsp;&nbsp; '.number_format((float)$amount, 2, '.', ''); ?></td>
                                </tr>
                            </tbody>
                        </table> 
                        
                        <div class="col-md-12">
                            <div class="right-box">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="bx1">
                                          <h3>Other Information</h3>
                                          <p><label>Order &nbsp; Status:</label> <?php echo ucwords($orderdetails['fld_payment_status']);?></p>
                                          <p><label>Order &nbsp; Date:</label> <?php echo date('M d, Y', strtotime($orderdetails['fld_modified_date']));?></p>
                                          <p><label>Payment &nbsp; Type:</label> <?php echo $orderdetails['fld_payment_type'];?></p>
                                          <p><label>Shipping &nbsp; Method:</label> <?php echo 'N/A';?></p>
                                          <!--<p><label>Email:</label> <a href="mailto:<?php //echo $orderdetails['fld_email_id'];?>"><?php //echo $orderdetails['fld_email_id'];?></a></p>
                                          <p><label>Phone:</label> <a href="tel:<?php //echo $orderdetails['fld_phone_no'];?>"><?php //echo $orderdetails['fld_phone_no'];?></a></p>-->
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="bx1">
                                            <h3>Billing Address</h3>
                                            <p><?php echo $orderdetails['fld_first_name']."&nbsp; &nbsp;".$orderdetails['fld_last_name'];?></p>
                                            <p><?php echo $orderdetails['fld_email_id'];?></p>
                                            <p><?php echo $orderdetails['fld_phone_no'];?></p>
                                            <p><?php echo $orderdetails['fld_address'];?>, <?php echo $orderdetails['fld_address2'];?></p>
                                            <p></p>
                                            <p><?php echo $orderdetails['fld_city'];?>, <?php echo $orderdetails['fld_zip_code'];?></p>
                                            <!--<p><?php //echo $orderdetails['fld_state'];?></p>-->
                                            <!--<p><?php //echo $orderdetails['fld_zip_code'];?></p>-->
                                            <p><?php echo $orderdetails['fld_country'];?></p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="bx1">
                                            <h3>Shipping Address</h3>
                                            <p><?php echo $orderdetails['fld_shipping_first_name']."&nbsp;&nbsp; ".$orderdetails['fld_shipping_last_name'];?></p>
                                            <p><?php echo $orderdetails['fld_shipping_email_id'];?></p>
                                            <p><?php echo $orderdetails['fld_shipping_phone_no'];?></p>
                                            <p><?php echo $orderdetails['fld_shipping_address'];?>, <?php echo $orderdetails['fld_shipping_address2'];?></p>
                                            <p></p>
                                            <p><?php echo $orderdetails['fld_shipping_city'];?>, <?php echo $orderdetails['fld_shipping_zip_code'];?></p>
                                            <!--<p><?php //echo $orderdetails['fld_shipping_state'];?></p>-->
                                            <!--<p><?php //echo $orderdetails['fld_shipping_zip_code'];?></p>-->
                                            <p><?php echo $orderdetails['fld_shipping_country'];?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
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


<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

 <script>
        window.jsPDF = window.jspdf.jsPDF;
        // Convert HTML content to PDF
        function Convert_HTML_To_PDF2() {
            var doc = new jsPDF();
            // Source HTMLElement or a string containing HTML.
            var elementHTML = document.querySelector("#contentToPrint");
            doc.html(elementHTML, {
                callback: function(doc) {
                    // Save the PDF
                    doc.save('document-html.pdf');
                },
                margin: [10, 10, 10, 10],
                autoPaging: 'text',
                x: 0,
                y: 0,
                width: 200, //target width in the PDF document
                windowWidth: 1500 //window width in CSS pixels
            });
        }
        function Convert_HTML_To_PDF() {
            document.getElementById("contentToPrint").style.display='block'; 
            document.getElementById("body").style.opacity = 0.5;
            var doc = new jsPDF();
        	
            // Source HTMLElement or a string containing HTML.
            var elementHTML = document.querySelector("#contentToPrint");
           
            
            doc.html(elementHTML, {
                callback: function(doc) {
                    // Save the PDF
                    doc.save('<?php echo $orderdetails['fld_first_name']." ".$orderdetails['fld_last_name']."__".$orderid;?>_.pdf');
                },
                margin: [3,3, 3, 3],
                autoPaging: 'text',
                x: 0,
                y: 0,
                width: 200, //target width in the PDF document
                windowWidth: 1100 //window width in CSS pixels
            });
            setTimeout(function(){
                document.getElementById("contentToPrint").style.display='none'; 
                document.getElementById("body").style.opacity = 1;
            },3000)
            
        }
    /* Place custom JavaScript code here */
</script>


</body>
</html>





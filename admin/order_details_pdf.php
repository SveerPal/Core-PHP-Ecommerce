<?php include 'includes/session.php'; ?>
<?php
  if(!isset($_GET['order_id'])){
    header('location: view-orders.php');
    exit();
  }
  else{
      }
$orderid = $_GET['order_id'];
$discount_amount = $_GET['discount_amount'];
$user_id = $_GET['user_id'];
?>

<?php //include 'includes/header.php'; ?>
     <?php include 'includes/function.php'; ?>
  <?php // include 'includes/navbar.php'; ?>

<?php 
require_once 'dompdf/autoload.inc.php'; 
use Dompdf\Dompdf; 
$options = new \Dompdf\Options;
header('Content-Type: application/pdf; charset=utf-8');
$options->set('isRemoteEnabled', true);
$dompdf = new \Dompdf\Dompdf($options);
$dompdf->set_option('defaultFont', 'droidsansfallback');
$dompdf->set_option('isFontSubsettingEnabled', true);
$dompdf = new Dompdf();
?>
  <?php //include 'includes/menubar.php'; ?>
    <?php $html=''; 
          $html = "
          
          
          <table border='0' width='100%' style='border-collapse: collapse; margin-bottom:10px;'>
              <tr>
                  <td ><img style='width:140px; height:80px' src='https://alpasban.com/assets/img/logo/nav-log2.png'></td>
             
                  </tr>
                  </table>
                  <table border='1' width='100%' style='border-collapse: collapse;'>
                        ";
                     $sub_total=0;
                     $items_name=0;
                     $orderproductdetails=$SettingsData->orderDetailProduct($orderid);
                      $sub_total=0;
                      $items_name=0;
                      $orderproductdetails=$SettingsData->orderDetailProduct($orderid);
                      if($orderproductdetails){
                          foreach($orderproductdetails as $orderproductdetail){
                              $productvar_name='';
                              if($orderproductdetail['fld_product_variation_id'] > 0){
                                  $productvar_name=$SettingsData->getProductVariationAttributeValue($orderproductdetail['fld_product_id'],$orderproductdetail['fld_product_variation_id']);
                              
                              }
                             $sub_total += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
                              $items_name .= $orderproductdetail['fld_product_name'].' '.$productvar_name.' (QNT-'.$orderproductdetail["fld_quantity"].')';
                              $productDetails=$SettingsData->getProductDetail($orderproductdetail['fld_product_id']);
                             $html.="<tr style='padding:10px'>
                                  <td style='padding:10px'>
                                  <img class='border-radius-5' style='width:80%; height:80px' src='". UPLOADS."products/". $productDetails[0]['photo']."'>
                                  </td>
                                  <td style='padding:10px'>
                                      ".$orderproductdetail['fld_product_name']."
                                     
                                     ". $productvar_name."
                                      ". $orderproductdetail['fld_quantity']."
                                  </td>
                                  <td style='padding:10px'>
                                      ". "<span style='font-family: DejaVu Sans;''>&#x20B9;</span>".number_format((float)$orderproductdetail['fld_amount'], 2, '.', '')."
                                  </td>
                              </tr>";
                           } } 
                        $html .=  "</table>";  
                        $discount_amount= $discount_amount;
                        $vat=0;
                        $total_amount =  (($sub_total+$vat)-$discount_amount);
                        $amount = (int) $total_amount;
                        $gst_amt = $sub_total +($sub_total*12)/100;
                        $gst_amt_minus = $sub_total - ($sub_total*12)/100;
                        $gst_amt_of_total = ($sub_total*12)/100;
                        $html.="<table border='1' width='100%' style='border-collapse: collapse; margin:20px 0px'>";
                        $html.="tr
                        <td style='padding:10px; background: #f39c1236;'>Sub Total:"."<span style='font-family: DejaVu Sans;''>&#x20B9;</span>" .number_format((float)$gst_amt_minus, 2, '.', '') ."</td>";
                           if($discount_amount){ 
                          $html.="<td style='padding:10px; background: #f39c1236; '>GST: 12% ( $gst_amt_of_total )</td>     
                        <td style='padding:10px; background: #f39c1236; '>Coupon: Applied: ". "<span style='font-family: DejaVu Sans;''>&#x20B9;</span>".' - '.number_format((float)$discount_amount, 2, '.', ''). "</td>";
                         } 
                        $html.="<td style='padding:10px; background: #f39c1236;'>Total: ". "<span style='font-family: DejaVu Sans;''>&#x20B9;</span>".number_format((float)$amount, 2, '.', '')."</td>
                      </tr>
                   </table> ";
           $conn = $pdo->open(); 
           $stmt = $conn->prepare("SELECT * FROM order_detials WHERE fld_user_id= $user_id");
           $stmt->execute();
           $result = $stmt->fetchAll();
        
        $html.="<table border='1' width='100%' style='border-collapse: collapse; '>
             <tr >
                <td style='padding:10px; '>
                       <div class='bx1' style='background: #fff;
                       padding: 10px;
                       margin-bottom: 10px;'>
                      <h2>Customer Name</h2>
                      <p>".$result[0]['fld_first_name']." ".$result[0]['fld_last_name']."<br>
                      <a href=''>1 order</a></p>
                    </div>
                 </td>
                 <td style='padding:10px'> 
                    <div class='bx1' style='background: #fff;
                    padding: 10px;
                    margin-bottom: 10px;'>
                      <h2>Contact Information</h2>
                      <p>Email: ". $result[0]['fld_email_id']."</p>
                      <p>Phone: ". $result[0]['fld_phone_no']."</p>
                    </div>
                 </td>
                 <td style='padding:10px'>
                 <div class='bx1' style='background: #fff;
                 padding: 10px;
                 margin-bottom: 10px;'>
                  <h2>Shipping Address</h2>
                  <p>". $result[0]['fld_shipping_first_name']." ".$result[0]['fld_shipping_last_name']."</p>
                  <p>". $result[0]['fld_shipping_email_id']."</p>
                  <p>". $result[0]['fld_shipping_phone_no']."</p>
                  <p>". $result[0]['fld_shipping_address']."</p>
                  <p>". $result[0]['fld_shipping_address2']."</p>
                  <p>". $result[0]['fld_shipping_city']."</p>
                  <p>". $result[0]['fld_shipping_state']."</p>
                  <p>". $result[0]['fld_shipping_zip_code']."</p>
                  <p>". $result[0]['fld_shipping_country']."</p>
                  </div>
                
                 </td>
            </tr>
          </table>";
      $dompdf = new Dompdf(array('enable_remote' => true));
        $filename = 'pdf-download';
        $dompdf->loadHtml($html ); 
        // (Optional) Setup the paper size and orientation 
        $dompdf->setPaper('A4', 'landscape'); 
        $dompdf->set_base_path('/home/jm0r42w2l0ww/public_html/admin/dist/css/pdf_style.css');
        // Render the HTML as PDF 
        $dompdf->render(); 
        // Output the generated PDF to Browser 
        //$dompdf->stream();
        
        //header('Content-disposition: inline; filename="' .  $filename . '.pdf"', true);

        // 直接印出來瀏覽器就可以讀取
        //echo $dompdf->output();
        $dompdf->stream("$orderid", array("Attachment" => 1));
       // echo $html;
        die('HIii');
      ?>
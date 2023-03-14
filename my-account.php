<?php
error_reporting(0);
include_once 'admin/includes/conn.php';
$siteurl=SITE_URL;
if($_SESSION['useremail']==""){ ?>
<script>
window.location.replace("<?php echo $siteurl; ?>/login.html");
</script>
<?php	
}
?>
<?php
$pdo = new Database();
$db = $pdo->open();	
$conn = $pdo->open();
if($_POST['action']=='update'){
	
	    
		$result_update_pass =$conn->prepare("UPDATE users SET firstname='".$_REQUEST['firstname']."',lastname='".$_REQUEST['lastname']."',address='".$_REQUEST['address_first']."',address_second='".$_REQUEST['address_second']."',city='".$_REQUEST['city']."',country='".$_REQUEST['country']."',zipcode='".$_REQUEST['zipcode']."' where id='".$_SESSION['userid']."'");
	
		$result_update_pass->execute();
		if($result_update_pass->rowCount() > 0 ) 
		{
			$message_profile="<p style='color:red;text-align:center;'>Profile Updated successfully</p>";
		}
	else 
	{
	 //$message_profile="<p style='color:red;text-align:center;'>Error In Profile Update</p>"; 
	}
}

if($_POST['action']=='changepass'){
	$check="0";
	
		$result_user_pass =$db->prepare("select email,password,id from users where email='".$_SESSION['useremail']."'  && password='".md5($_REQUEST['idold_password'])."' order by id asc");
		$result_user_pass->execute();
		$check="3";

	if($result_user_pass->rowCount() > 0 ) 
	{
		

		$result_update_pass =$db->prepare("UPDATE users SET password='".md5($_REQUEST['idnew_password'])."' where id='".$_SESSION['userid']."'");
	
		$result_update_pass->execute();
		if($result_update_pass->rowCount() > 0 ) 
		{
			$message_change="<p style='color:red;text-align:center;'>Password Updated successfully</p>";
		}
	}
		else 
		{
		 $message_change="<p style='color:red;text-align:center;'>Old Password do not match</p>"; 
		}
}

//print_r($_SESSION);
$result_user_data =$conn->prepare("select * from users where id='".$_SESSION['userid']."' order by id asc");
$result_user_data->execute();
$row_customer = $result_user_data->fetch();
$loginstatus=$row_customer['status'];
$firstname=$row_customer['firstname'];
$lastname=$row_customer['lastname'];
$email=$row_customer['email'];
$address=$row_customer['address'];
$contact_info=$row_customer['contact_info'];
$phone_no=$row_customer['phone_no'];
$city=$row_customer['city'];
$address_second=$row_customer['address_second'];
$zipcode=$row_customer['zipcode'];
$country=$row_customer['country'];

$getorderlists= $FontEndData->getOrderListByUser($_SESSION['userid']); 
$shippingAddress= $FontEndData->getAddress($_SESSION['userid'],'shipping');
$billingAddress= $FontEndData->getAddress($_SESSION['userid'],'billing');
?>
<style>
#pass-status {float: right;top: -48px !important;position: relative;}
#pass-status1 {float: right;top: -48px !important;position: relative;}
#pass-status-login {float: right;top: -48px !important;position: relative;}
.strong-password {color: green;}
</style>
<main>
    
<section id="profile-sec">
    <div class="container">
        <div class="profile">
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">My Profile</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">Order</button>
                <button class="tablinks" onclick="openCity(event, 'Tokyo')">Address</button>
                <button class="tablinks" onclick="openCity(event, 'India')">Change Password</button>
                <a href="logout.php"> <button class="tablinks" onclick="#" >Logout</button></a>
            </div>
            <div class="profile-content">
                <div id="London" class="tabcontent">
				 <?php echo $message_profile; ?>
				 <?php echo $message_change; ?>
                    <div class="user-detail">
                        <div class="profile-head">
                            <h3>My Profile</h3>
                            <a href="javascript:void(0)" class="edit">Edit Profile</a>
                        </div>
                        <div class="user-content">
                            <ul>
                                <li>Full Name: <?php echo $firstname; ?> <?php echo $lastname; ?></li>
                                <li>City: <?php echo $city; ?></li>
                                <li>Mobile Number: <?php echo $phone_no; ?></li>
                            </ul>
                            <ul>
                                <li>Address: <?php echo $address; ?></li>
                                <li>Email Id: <?php echo $email; ?></li>
                            
                            </ul>
                        </div>
                    </div>
                    
                    <div class="user-detail edit-profile">
                        <div class="profile-head">
                        <h3>Edit Profile</h3>
                    </div>
                    <div class="">
					<form class="" id="storagelocationfrm" name="storagelocationfrm" method="post" enctype="multipart/form-data">
					  <br/>
                        <div class="row">
						
                            <div class="col-lg-6 mb-12">
                                <div class="checkout__input--list ">
                                    <label>
                                        <input class="checkout__input--field border-radius-5" placeholder="First name" required  type="text" name="firstname" value="<?php echo $firstname; ?>">
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-12">
                                <div class="checkout__input--list">
                                    <label>
                                        <input class="checkout__input--field border-radius-5" placeholder="Last name"  type="text" name="lastname" required value="<?php echo $lastname; ?>">
                                    </label>
                                </div>
                            </div>
                            <div class="col-12 mb-12">
                                <div class="checkout__input--list">
                                    <label>
                                        <input class="checkout__input--field border-radius-5" placeholder="Address1" value="<?php echo $address; ?>" name="address_first"  type="text">
                                    </label>
                                </div>
                            </div>
                            <div class="col-12 mb-12">
                                <div class="checkout__input--list">
                                    <label>
                                        <input class="checkout__input--field border-radius-5" placeholder="Apartment, suite, etc. (optional)" name="address_second" value="<?php echo $address_second; ?>"  type="text">
                                    </label>
                                </div>
                            </div>
                            <div class="col-12 mb-12">
                                <div class="checkout__input--list">
                                    <label>
                                        <input class="checkout__input--field border-radius-5" placeholder="City" value="<?php echo $city; ?>" name="city"  type="text">
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-12">
                                <div class="checkout__input--list checkout__input--select select">
                                    <label class="checkout__select--label" for="country">Country/region</label>
                                    <select class="checkout__input--select__field border-radius-5" name="country" id="country">
                                            <option value="">Select Country</option>
                                        <option value="1" <?php if($country == '1') echo"selected"; ?>>India</option>
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-12">
                                <div class="checkout__input--list">
                                    <label>
                                        <input class="checkout__input--field border-radius-5" placeholder="Postal code" value="<?php echo $zipcode; ?>" name="zipcode"  type="text">
                                    </label>
                                </div>
                            </div>
                            <div class="checkout__content--step__footer d-flex align-items-center">
								<button type="submit" class="continue__shipping--btn primary__btn border-radius-5" tabindex="0" aria-controls="sample_1" title="Update">Update</button>
						 <input type="hidden" name="action" value="update" />
                                <a class="previous__link--content" href="#">Cancel</a>
                            </div>
						
                        </div>
						 </form>
                    </div>
                </div>
            </div>
            <div id="Paris" class="tabcontent">
                <div class="account__table--area">
                    <div class="profile-head">
                        <h3>Order History</h3>
                    </div>
                    <table class="account__table">
                        <thead class="account__table--header">
                            <tr class="account__table--header__child">
                                <th class="account__table--header__child--items">Order</th>
                                <th class="account__table--header__child--items">Date</th>
                                <th class="account__table--header__child--items">Payment Status</th>
                                <th class="account__table--header__child--items">Total</th>	 
                                <th class="account__table--header__child--items">Payment Type</th>
                            </tr>
                        </thead>
                        <tbody class="account__table--body mobile__none">
                            <?php 
                                
                        
                                if($getorderlists ){
                                    foreach($getorderlists as $getorderlist){
                                        $class="";
                                        
                                        if($getorderlist['fld_payment_status']=='confirmed'){
                                            $class="green";
                                        }elseif($getorderlist['fld_payment_status']=='cancel'  || $getorderlist['fld_payment_status']=='failed'){
                                            $class="red";
                                        }else{
                                            $class="warning";
                                        }
                            ?>     
                                        <tr class="account__table--body__child">
                                            <td id="<?php echo $getorderlist['fld_order_id'];?>" class="order-id account__table--body__child--items">#<?php echo $getorderlist['fld_order_id'];?></td>
                                            <td class="account__table--body__child--items"><?php echo date("F d, Y",strtotime($getorderlist['fld_payment_date']));?></td>
                                            <td class="account__table--body__child--items <?php echo $class; ?>"><span><?php echo ucfirst($getorderlist['fld_payment_status']);?></span></td>
                                            <td class="account__table--body__child--items"><?php echo CURRENCY.number_format((float)$getorderlist['fld_amount'], 2, '.', '');?></td>
                                            <td class="account__table--body__child--items"><?php echo $getorderlist['fld_payment_type'];?></td>
                                        </tr> 
                                        <tr> 
                                            <td colspan="6">
                                                <div class="order-detail orderno<?php echo $getorderlist['fld_order_id'];?>">
                                                    <?php 
                                                    $sub_total=0;
                                                    $orderproductdetails=$FontEndData->orderDetailProduct($getorderlist['fld_order_id']);
                                                    if($orderproductdetails){
                                                        foreach($orderproductdetails as $orderproductdetail){
                                                            $productvar_name='';
                                                            if($orderproductdetail['fld_product_variation_id'] > 0){
                                                                $productvar_name=$FontEndData->getProductVariationAttributeValue($orderproductdetail['fld_product_id'],$orderproductdetail['fld_product_variation_id']);
                                                            
                                                            }
                                                           $sub_total += ((int)$orderproductdetail['fld_quantity']*(int)$orderproductdetail['fld_amount']);
                                                           // $sub_total += (int)$orderproductdetail['fld_amount'];
                                                            $items_name .= $orderproductdetail['fld_product_name'].' '.$productvar_name.' (QNT-'.$orderproductdetail["quantity"].')';
                                                            $productDetails=$FontEndData->getProductDetail($orderproductdetail['fld_product_id']);
                                                            //print_r($productDetails);
                                                    ?>
                                                            <div class="first-row">
                                                                <div class="cart__thumbnail">
                                                                    <a href="<?php echo SITE_URL?>product/<?php echo $productDetails['slug'] ?>.html">
                                                                        <img class="border-radius-5" src="<?php echo UPLOADS ?>products/<?php echo $productDetails['photo'] ?>" alt="<?php echo $orderproductdetail['fld_product_name']; ?>">
                                                                    </a>
                                                                </div>
                                                                <div class="cart-content">
                                                                    <h4 class="cart__content--title">  
                                                                        <a href="<?php echo SITE_URL?>product/<?php echo $productDetails['slug'] ?>.html"><?php echo $orderproductdetail['fld_product_name']; ?></a>
                                                                    </h4>
                                                                    <span class="cart__content--variant"><?php echo $productvar_name; ?></span>
                                                                    <span class="in__stock text__secondary">Qty: <?php echo $orderproductdetail['fld_quantity']; ?></span>
                                                                </div>
                                                                <div class="sub-total text-center">
                                                                    <span class="cart__price"><?php echo CURRENCY.number_format((float)$orderproductdetail['fld_amount'], 2, '.', ''); ?></span>
                                                                </div>
                                                            </div>
                                                    <?php } }
                                                     $getorderlist['discount_code'];
                                                     $discount_amount=$getorderlist['discount_amount'];
                                                     $vat = ceil(($sub_total*GST)/100);
                                                      //  echo $discount_amount = ($sub_total*$['discount_amount'])/100;
                                                        $total_amount =  (($sub_total)-$discount_amount);
                                                        $amount = (int) $total_amount;
                                                    ?>
                                                    <div class="second-row">
                                                        <span class="cart__price h5">Sub Total: <?php echo CURRENCY.number_format((float)$sub_total, 2, '.', ''); ?></span>
                                                        <?php if($discount_amount){ ?>
                                                        <span class=" in__stock text__secondary text-left">Coupon: Applied: <?php echo CURRENCY.' - '.number_format((float)$discount_amount, 2, '.', ''); ?></span>
                                                        <?php } ?>
                                                        <?php if($vat){ ?>
                                                        <span class=" in__stock text__secondary text-left">GST (<?php echo GST; ?>%): <?php echo CURRENCY.number_format((float)$vat, 2, '.', ''); ?></span>
                                                        <?php } ?>
                                                        <span class="cart__price h4">Total: <?php echo CURRENCY.number_format((float)$amount, 2, '.', ''); ?></span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>  
                            <?php 
                                    }
                                }else{
                            ?>
                                <tr class="account__table--body__child">
                                    <td colspan="6">
                                        <div class="alert alert-danger" role="alert">No Order Found!</div>
                                    </td>
                                </tr> 
                            <?php
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="Tokyo" class="tabcontent">
                <div class="user-detail">
                    <div class="profile-head">
                        <h3>Saved Address</h3>
                        <a href="javascript:void(0)" class="myAddressUpdate">Edit Address </a>
                    </div>
                    <div class="plans">
                        <label class="plan basic-plan" for="billing">
                            <input onclick="myAddressUpdateData(this)" value="billing" class="myaddress"  type="radio" name="plan" id="billing" 
                                
                             
                            fld_address="<?php echo $billingAddress['fld_address']; ?>" 
                            fld_address2="<?php echo $billingAddress['fld_address2']; ?>" 
                            fld_city="<?php echo $billingAddress['fld_city']; ?>" 
                            fld_country="<?php echo $billingAddress['fld_country']; ?>" 
                            fld_zip_code="<?php echo $billingAddress['fld_zip_code']; ?>" 
                            checked />
                            <div class="plan-content">
                            <div class="plan-details">
                                <span>Billing</span>
                                <p>
                                    <?php 
                                        // $billingAddress['fld_first_name'];
                                        // $billingAddress['fld_last_name'];
                                        // $billingAddress['fld_company_name'];
                                        // $billingAddress['fld_address'];
                                        // $billingAddress['fld_address2'];
                                        // $billingAddress['fld_city'];
                                        // $billingAddress['fld_state'];
                                        // $billingAddress['fld_zip_code'];
                                        // $billingAddress['fld_country'];
                                        // $billingAddress['fld_phone_no'];

                                      echo   $billingAddress['fld_address'].' '.$billingAddress['fld_address2'].', ';
                                      echo   $billingAddress['fld_city'].' '.$billingAddress['fld_state'].', ';
                                      echo   $billingAddress['fld_country'].' '.$billingAddress['fld_zip_code'];
                                      echo ' Mobile: '. $billingAddress['fld_phone_no'];
                                    
                                    ?>
                                    

                                </p>
                            </div>
                            </div>
                        </label>

                        <label class="plan complete-plan" for="complete">
                            <input onclick="myAddressUpdateData(this)" class="myaddress" type="radio" id="complete" name="plan" value="shipping" 
                            
                            fld_address="<?php echo $shippingAddress['fld_address']; ?>" 
                            fld_address2="<?php echo $shippingAddress['fld_address2']; ?>" 
                            fld_city="<?php echo $shippingAddress['fld_city']; ?>" 
                            fld_country="<?php echo $shippingAddress['fld_country']; ?>" 
                            fld_zip_code="<?php echo $shippingAddress['fld_zip_code']; ?>" 
                            />
                            <div class="plan-content">
                            <div class="plan-details">
                                <span>Shipping</span>
                                <p>
                                <?php 
                                        
                                      echo   $shippingAddress['fld_address'].' '.$shippingAddress['fld_address2'].', ';
                                      echo   $shippingAddress['fld_city'].' '.$shippingAddress['fld_state'].', ';
                                      echo   $shippingAddress['fld_country'].' '.$shippingAddress['fld_zip_code'];
                                      echo ' Mobile: '. $shippingAddress['fld_phone_no'];
                                    
                                    ?>
                                </p>
                            </div>
                            </div>
                        </label>
                    </div>
                </div>
                
                <div class="user-detail edit-profile myaddreessupdate">
                    <div class="profile-head">
                    <h3>Update Address</h3>
                </div>
                <div style="margin-top:30px;">
                    <div class="row">
                        <div class="col-12 mb-12">
                            <div class="checkout__input--list">
                                <label>
                                    <input name="fld_address" value="<?php echo $billingAddress['fld_address']; ?>" class="checkout__input--field border-radius-5" placeholder="Address1"  type="text">
                                </label>
                            </div>
                        </div>
                        <div class="col-12 mb-12">
                            <div class="checkout__input--list">
                                <label>
                                    <input name="fld_address2" value="<?php echo $billingAddress['fld_address2']; ?>" class="checkout__input--field border-radius-5" placeholder="Apartment, suite, etc. (optional)"  type="text">
                                </label>
                            </div>
                        </div>
                        <div class="col-12 mb-12">
                            <div class="checkout__input--list">
                                <label>
                                    <input name="fld_city" value="<?php echo $billingAddress['fld_city']; ?>" class="checkout__input--field border-radius-5" placeholder="City"  type="text">
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-12">
                            <div class="checkout__input--list checkout__input--select select">
                                <label class="checkout__select--label" for="country">Country/region</label>
                                <select name="fld_country" class="checkout__input--select__field border-radius-5" id="country">
                                    <option value="India">India</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-12">
                            <div class="checkout__input--list">
                                <label>
                                    <input name="fld_zip_code" value="<?php echo $billingAddress['fld_zip_code']; ?>" class="checkout__input--field border-radius-5" placeholder="Postal code"  type="text">
                                </label>
                            </div>
                        </div>
                        <div class="checkout__content--step__footer d-flex align-items-center">
                            <a class="continue__shipping--btn primary__btn border-radius-5" href="javascript:void(0)" onclick="updatemyaddresses()">Update</a>
                            
                            
                        </div>
                        <span class="addressmsg mt-4"></span>
                    </div>
                </div>
            </div>
            </div>
            
            <div id="India" class="tabcontent">
                <div class="user-detail">
                    <div class="profile-head">
                        <h3>Change Password</h3>
                    </div>
                    <div class="col-md-12">
                        <div class="chng-pass">
                           <form class="form-horizontal row-border" id="storagelocationfrm" name="storagelocationfrm" method="post" enctype="multipart/form-data">
						    
                            <input class="account__login--input" name="idold_password" placeholder="Previous Password" type="password">
                                    <input class="account__login--input pass-input" name="idnew_password" placeholder="New Password" type="password" id="fld_emp_pass">
									 <i id="pass-status" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPassword()"></i> 
                                    <input class="account__login--input pass-input1" name="idconfirm_password" placeholder="Confirm Password" type="password" id="fld_emp_conpass">
									<i id="pass-status1" class="fa fa-eye-slash" aria-hidden="true" onClick="viewPassword1()"></i>
									 <div class="col-md-12">
										   
										     <p id="password-strength-status"></p>
											 <p id="message"></p>
							 </div>
                                    <div class="checkout__content--step__footer d-flex align-items-center">
									<button type="submit" class="continue__shipping--btn primary__btn border-radius-5" tabindex="0" aria-controls="sample_1" id="reg_submit" title="Update">Change Password</button>
						             <input type="hidden" name="action" value="changepass" />
                                        <a class="previous__link--content" href="#">Cancel</a>
                                    </div>
                           </form>
                        </div>
                    </div>
                </div>
                
                
            </div>
            </div>
        </div>
    </div>
</section>
    
   
</main>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
<script>
    $(document).ready(function(){
        $(".edit").click(function(){            
            $(".edit-profile").slideToggle("slow");
        });
        
        $(".myAddressUpdate").click(function(){            
           // $(".myaddreessupdate").slideToggle("slow");
           $(".myaddreessupdate").show();
           $("#billing").trigger('click');
        });
        
    });
</script>

<script>
    function myAddressUpdateData(ele) {   
       // $(".myaddreessupdate").slideToggle("slow");
        $(".myaddreessupdate").show();
        //alert("Fff")
        let fld_address=fld_address2=fld_city=fld_country=fld_zip_code="";
        
            fld_address=$(ele).attr('fld_address');
            fld_address2=$(ele).attr('fld_address2');
            fld_city=$(ele).attr('fld_city');
            fld_zip_code=$(ele).attr('fld_zip_code');
            //alert(fld_address);
            $('input[name="fld_address"]').val(fld_address);
            $('input[name="fld_address2"]').val(fld_address2);
            $('input[name="fld_city"]').val(fld_city);
            $('input[name="fld_zip_code"]').val(fld_zip_code);
    }
    
    function updatemyaddresses(){
        var fld_address=$('input[name="fld_address"]').val();
        var fld_address2=$('input[name="fld_address2"]').val();
        var fld_city=$('input[name="fld_city"]').val();
        var fld_zip_code=$('input[name="fld_zip_code"]').val();
        var addressType=$('input[name="plan"]:checked').val();
        
        if(fld_address!="" && fld_address2!="" && fld_city!="" && fld_zip_code!="" && fld_address!=undefined && fld_address2!=undefined && fld_city!=undefined && fld_zip_code!=undefined){
            
            jQuery.ajax({
                url: "../includes/billing-shipping-address-update.php",
                data:{fld_address:fld_address,fld_address2:fld_address2,fld_city:fld_city,fld_zip_code:fld_zip_code,addressType:addressType},
                dataType: "json",
                type: "POST",
                success:function(response){
                   // alert(response);
                    console.log(response);
                    if(response.sts==1){
                        $('.addressmsg').html('<div class="alert alert-success" role="alert">Addres Updated Succesfully</div>');
                        setTimeout(function(){
                            location.reload(); 
                        },3000)
                        
                        //openCity(event, 'Tokyo');
                    }else{
                        $('.addressmsg').html('<div class="alert alert-danger" role="alert">Oops! something went wrong. Please try again</div>');
                    }
                }
            });
            
        }else{
            $('.addressmsg').html('<div class="alert alert-danger" role="alert">All field required*</div>');
        }
        setTimeout(function(){
            $('.addressmsg').html('');
        },5000)
    }
</script>

<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();
</script>

<script>
    $(document).ready(function(){
        $(".order-id").click(function(){
            let orderno=$(this).attr('id');
            $(".orderno"+orderno).slideToggle("slow");
        });
    });
</script>
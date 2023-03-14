<?php 
$pdo = new Database();
$db = $pdo->open();	
$email="";
$billing_first_name=$billing_last_name =$billing_company =$billing_address ="";
$billing_address2 =$billing_city =$billing_zip_code ="";
$billing_country =$default_address = $billing_phone_no  ="";

$shipping_first_name=$shipping_last_name =$shipping_company =$shipping_address ="";
$shipping_address2 =$shipping_city =$shipping_zip_code ="";
$shipping_country =$default_address = $shipping_phone_no  ="";
?>
 <?php if(isset($_SESSION["cart_item"])){ 
    if(isset($_SESSION['userid']) && $_SESSION['userid'] > 0){
        if(isset($_SESSION['useremail']) && $_SESSION['useremail']!=''){
            $email=$_SESSION['useremail'];
        }
        
        //print_r($_SESSION['useremail']);
        $result_address_data = $db->prepare("SELECT * FROM users_address  WHERE fld_user_id = '".$_SESSION['userid']."' AND 
                                              fld_status = 'active' AND fld_type='billing' 
                                              limit 1 "); 
        $result_address_data->execute();
        if($result_address_data->rowCount() > 0){
           
            $row_address = $result_address_data->fetch();
            $billing_first_name = isset($row_address['fld_first_name'])?$row_address['fld_first_name']:'';
            $billing_last_name = isset($row_address['fld_last_name'])?$row_address['fld_last_name']:'';
            $billing_company = isset($row_address['fld_company_name'])?$row_address['fld_company_name']:'';
            $billing_address = isset($row_address['fld_address'])?$row_address['fld_address']:'';
            $billing_address2 = isset($row_address['fld_address2'])?$row_address['fld_address2']:'';
            $billing_city = isset($row_address['fld_city'])?$row_address['fld_city']:'';
        // 		$billing_state = isset($row_address['fld_state'])?$row_address['fld_state']:'';
            $billing_zip_code = isset($row_address['fld_zip_code'])?$row_address['fld_zip_code']:'';
            $billing_country = isset($row_address['fld_country'])?$row_address['fld_country']:'';
            $default_address = isset($row_address['fld_default_address'])?$row_address['fld_default_address']:'';
            $billing_phone_no = isset($row_address['fld_phone_no'])?$row_address['fld_phone_no']:'';
            $billing_email_id = isset($row_address['fld_email_id'])?$row_address['fld_email_id']:'';
        }
        $result_shipping_address_data = $db->prepare("SELECT * FROM users_address  WHERE fld_user_id = '".$_SESSION['userid']."' 
                                                  AND fld_status = 'active' AND fld_type='shipping' 
                                                   limit 1 "); 
        $result_shipping_address_data->execute();
        if($result_shipping_address_data->rowCount() > 0){
            $row_shipping_address = $result_shipping_address_data->fetch();
            $shipping_first_name = isset($row_shipping_address['fld_first_name'])?$row_shipping_address['fld_first_name']:'';
            $shipping_last_name = isset($row_shipping_address['fld_last_name'])?$row_shipping_address['fld_last_name']:'';
            $shipping_company = isset($row_shipping_address['fld_company_name'])?$row_shipping_address['fld_company_name']:'';
            $shipping_address = isset($row_shipping_address['fld_address'])?$row_shipping_address['fld_address']:'';
            $shipping_address2 = isset($row_shipping_address['fld_address2'])?$row_shipping_address['fld_address2']:'';
            $shipping_city = isset($row_shipping_address['fld_city'])?$row_shipping_address['fld_city']:'';
        // 		$shipping_state = isset($row_shipping_address['fld_state'])?$row_shipping_address['fld_state']:'';
            $shipping_zip_code = isset($row_shipping_address['fld_zip_code'])?$row_shipping_address['fld_zip_code']:'';
            $shipping_country = isset($row_shipping_address['fld_country'])?$row_shipping_address['fld_country']:'';
            $shipping_phone_no = isset($row_shipping_address['fld_phone_no'])?$row_shipping_address['fld_phone_no']:'';
            $shipping_email_id = isset($row_shipping_address['fld_email_id'])?$row_shipping_address['fld_email_id']:'';
        }
    }
    ?>
    <main class="main__content_wrapper">
        <section id="checkout-page">
            <div class="container">
                <div class="track-orderss">
                    <div class="cart-section">
                        <a href="<?php echo  SITE_URL;?>cart.html"><i class="far fa-shopping-cart"></i> <span>Cart</span></a>
                    </div>
                    <div class="ship-section">
                        <a href="<?php echo SITE_URL; ?>cart.html"><i class="far fa-shipping-fast"></i> <span>Shipping</span></a>
                    </div>
                    <div class="payment-section">
                        <a href="javascript:void(0)"><i class="far fa-money-bill-wave"></i> <span>Payment</span></a>
                    </div>
                    <div class="confirm-section">
                        <a href="javascript:void(0)"><i class="far fa-box-check"></i> </a>
                        <span>Confirmation</span>
                    </div>
                </div>
            </div>
        </section>
        <div class="checkout__page--area">
            <div class="container">
                <div class="checkout__page--inner d-flex">
                    <div class="main checkout__mian">
                        <main class="main__content_wrapper" id="checkout-form">
                            <form action="<?php echo SITE_URL; ?>payment.html" id="frmPayment" method="post">
                                
                                <div class="checkout__content--step section__contact--information">
                                    <div class="section__header checkout__section--header d-flex align-items-center justify-content-between mb-25">
                                        <h2 class="section__header--title h3">Contact information</h2>
                                        <?php if(!isset($_SESSION['userid']) && $_SESSION['userid'] <= 0){ ?>
                                        <p class="layout__flex--item">
                                            Already have an account?
                                            <a class="layout__flex--item__link" href="<?php echo  SITE_URL;?>login.html">Log in</a>  
                                        </p>
                                        <?php } ?>
                                    </div>
                                    <div class="customer__information">
                                        <div class="checkout__email--phone mb-12">
                                        <label>
                                            <input id="email" name="email" value="<?php echo $email; ?>" class="checkout__input--field border-radius-5" placeholder="Email"  type="email" required>
                                            <span class="email-check text-danger"></span>
                                          </label>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="checkout__content--step section__shipping--address">
                                    <div class="section__header mb-25">
                                        <h3 class="section__header--title">Billing address</h3>
                                    </div>
                                    <div class="section__shipping--address__content">
                                        <div class="row">
                                            <div class="col-lg-6 mb-12">
                                                <div class="checkout__input--list ">
                                                    <label>
                                                        <input id="firstName" name="firstname" value="<?php echo $billing_first_name; ?>" class="checkout__input--field border-radius-5" placeholder="First name"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input id="lastName" name="lastname" value="<?php echo $billing_last_name; ?>" class="checkout__input--field border-radius-5" placeholder="Last name"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input id="phone" name="phone" value="<?php echo $billing_phone_no; ?>" class="checkout__input--field border-radius-5" placeholder="Phone"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input name="company" value="<?php echo $billing_company; ?>" class="checkout__input--field border-radius-5" placeholder="Company (optional)"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input id="address" name="address" value="<?php echo $billing_address; ?>" class="checkout__input--field border-radius-5" placeholder="Address1"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input id="address2" name="address2" value="<?php echo $billing_address2; ?>" class="checkout__input--field border-radius-5" placeholder="Apartment, suite, etc. (optional)"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input id="city" name="city" value="<?php echo $billing_city; ?>" class="checkout__input--field border-radius-5" placeholder="City"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-12">
                                                <div class="checkout__input--list checkout__input--select select">
                                                    <label class="checkout__select--label" for="country">Country/region</label>
                                                    <select class="checkout__input--select__field border-radius-5" id="country" name="country">
                                                        <option value="India" <?php if($shipping_country=='India'){ echo 'selected'; } ?>>India</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-12">
                                                <div class="checkout__input--list">
                                                    <label>
                                                        <input id="zip" name="zip" value="<?php echo $billing_zip_code; ?>" class="checkout__input--field border-radius-5" placeholder="Postal code"  type="text">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="checkout__checkbox">
                                            <input class="checkout__checkbox--input" name="is_save_info" id="check2" type="checkbox" value="1">
                                            <span class="checkout__checkbox--checkmark"></span>
                                            <label class="checkout__checkbox--label" for="check2">
                                                Save this information for next time</label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="checkout__content--step section__shipping--address pt-10">
                                    <div class="section__header mb-25">
                                        <h3 class="section__header--title">Shipping address</h3>
                                        <p class="section__header--desc">Select the address that matches your card or payment method.</p>
                                    </div>
                                    <div class="checkout__content--step__inner3 border-radius-5">
                                        <div class="checkout__address--content__header">
                                            <div class="shipping__contact--box__list">
                                                <div class="shipping__radio--input">
                                                    <input value="1" class="shipping__radio--input__field" id="shipp" name="is_shipping_same" type="radio" checked>
                                                </div>
                                                <label class="shipping__radio--label" for="shipp" >
                                                    <span class="shipping__radio--label__primary">Same as billing address</span>
                                                </label>
                                            </div>
                                            <div class="shipping__contact--box__list">
                                                <div class="shipping__radio--input">
                                                    <input value="2" class="shipping__radio--input__field" id="billing" name="is_shipping_same" type="radio">
                                                </div>
                                                <label class="shipping__radio--label" for="billing" >
                                                    <span class="shipping__radio--label__primary">Use a different shipping address</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="checkout__content--input__box--wrapper " id="bil-add">
                                            <div class="row">
                                              <input id="shipping_email" type="hidden" name="shipping_email" value="<?php echo $email; ?>" >
                                                <div class="col-lg-6 mb-12">
                                                    <div class="checkout__input--list ">
                                                        <label>
                                                            <input id="shipping_firstName" name="shipping_firstname" value="<?php echo $shipping_first_name; ?>" class="checkout__input--field border-radius-5" placeholder="First name"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <div class="checkout__input--list">
                                                        <label>
                                                            <input id="shipping_lastName" name="shipping_lastname" value="<?php echo $shipping_last_name; ?>" class="checkout__input--field border-radius-5" placeholder="Last name"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-12">
                                                    <div class="checkout__input--list">
                                                        <label>
                                                            <input id="shipping_phone" name="shipping_phone" value="<?php echo $shipping_phone_no; ?>" class="checkout__input--field border-radius-5" placeholder="Phone"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-12">
                                                    <div class="checkout__input--list">
                                                        <label>
                                                            <input id="shipping_address" name="shipping_address" value="<?php echo $shipping_address; ?>" class="checkout__input--field border-radius-5" placeholder="Address1"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-12">
                                                    <div class="checkout__input--list">
                                                        <label>
                                                            <input id="shipping_address2" name="shipping_address2" value="<?php echo $shipping_address2; ?>" class="checkout__input--field border-radius-5" placeholder="Apartment, suite, etc. (optional)"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-12">
                                                    <div class="checkout__input--list">
                                                        <label>
                                                            <input id="shipping_city" name="shipping_city" value="<?php echo $shipping_city; ?>" class="checkout__input--field border-radius-5" placeholder="City"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <div class="checkout__input--list checkout__input--select select">
                                                        <label class="checkout__select--label" for="country">Country/region</label>
                                                        <select id="shipping_country" name="shipping_country" class="checkout__input--select__field border-radius-5">
                                                            <option value="India" <?php if($shipping_country=='India'){ echo 'selected'; } ?>>India</option>                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <div class="checkout__input--list">
                                                        <label>
                                                            <input id="shipping_zip" name="shipping_zip" value="<?php echo $shipping_zip_code; ?>" class="checkout__input--field border-radius-5" placeholder="Postal code"  type="text">
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <span class="text-danger mb-1 mt-1" id="error-message"></span>
                                <div class="checkout__content--step__footer d-flex align-items-center">
                                    <button type="button" onclick="return checkoutValidation()" class="continue__shipping--btn primary__btn border-radius-5">Next</button>                                    
                                </div>
                                
                            </form>
                        </main>
                    </div>
                    <?php include('lib/templates/checkout-subtotal.php')?>
                </div>
            </div>
        </div>
        <!-- End checkout page area -->
    </main>
<?php }else{ ?>
  <main class="main__content_wrapper">
    <div class="checkout__page--area">
      <div class="container">
        <div class="checkout__page--inner d-flex">
            <div class="main checkout__mian w-100">
              <main class="main__content_wrapper" id="checkout-form w-100 mb-5">
                  <div class="checkout__content--step__footer d-flex align-items-center">
                    <a class="continue__shipping--btn primary__btn border-radius-5 mb-5" href="<?php echo SITE_URL; ?>shop.html">Return To Shop</a>
                  </div>
              </main>
            </div>
          </div>
        </div>
      </div>
    </div>                          
  </main>
<?php } ?>       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    let category_id=urlAjax ='';
    jQuery(document).ready(function(){
        $("#billing").click(function(){
            $("#bil-add").show("slow");
        });
    });

    jQuery(document).ready(function(){
        $('#shipp').click(function(){
            $("#bil-add").hide("slow");
        });
    });

    jQuery(document).ready(function(){
        $('#email').on('change',function(){
          jQuery.ajax({
            url: "https://alpasban.com/includes/ajax_user_email_check.php",
            data:{email:this.value},
            type: "POST",
            dataType: "json",
            success:function(data){
              jQuery('.email-check').text('');
              //console.log(data);
              if(data.sts==1){
                jQuery('#email').val('');
                jQuery('.email-check').html(data.msg);
              }
              
            }
          });           
        });
    });



    function validatePhone(e) {
      return !!/^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/.test(e)
    }

	function validateEmail(sEmail) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(sEmail)) {
			return true;
		}
		else {
			return false;
		}
	}
    function checkoutValidation(){
        $("#error-message").html("").hide();
        
        var firstName = jQuery("#firstName").val();
        var lastName = jQuery("#lastName").val();
        var phone = jQuery("#phone").val();
        var email = jQuery("#email").val();
        var address = jQuery("#address").val();
        var city = jQuery("#city").val();
        var state = jQuery("#state").val();
        var zip = jQuery("#zip").val();
        var country = jQuery("#country").val();
        if($("#shipp").prop('checked') == true){
            //no action required
            var same_address = 2;
        }else{
            var shipping_firstName = jQuery("#shipping_firstName").val();
            var shipping_lastName = jQuery("#shipping_lastName").val();
            var shipping_phone = jQuery("#shipping_phone").val();
            //var shipping_email = jQuery("#shipping_email").val();
            var shipping_address = jQuery("#shipping_address").val();
            var shipping_city = jQuery("#shipping_city").val();
            var shipping_state = jQuery("#shipping_state").val();
            var shipping_zip = jQuery("#shipping_zip").val();
            var shipping_country = jQuery("#shipping_country").val();
            var same_address = 1;
        }
        
        if(email.trim() == ''){
            jQuery("#error-message").html('Please Enter Email Address').show();
            jQuery("#email").focus();
            return false;
        }else if(email.trim()!='' &&  !validateEmail( email )){
          jQuery("#error-message").html('Please enter valid email address').show();
          jQuery("#email").focus();
          return false;
        }else if(firstName.trim() == ''){
            jQuery("#error-message").html('Please Enter First Name').show();
            jQuery("#firstName").focus();
            return false;
        }else if(lastName.trim() == ''){
            jQuery("#error-message").html('Please Enter Last Name').show();
            jQuery("#lastName").focus();
            return false;
        }else if(phone.trim() == ''){
            jQuery("#error-message").html('Please Enter Phone No.').show();
            jQuery("#phone").focus();
            return false;
        }else if(address.trim() == ''){
            jQuery("#error-message").html('Please Enter Address').show();
            jQuery("#address").focus();
            return false;
        }else if(city.trim() == ''){
            jQuery("#error-message").html('Please Enter City').show();
            jQuery("#city").focus();
            return false;
        }else if(country.trim() == ''){
            jQuery("#error-message").html('Please Select Country').show();
            jQuery("#country").focus();
            return false;
        }else if(zip.trim() == ''){
            jQuery("#error-message").html('Please Enter Zip Code').show();
            jQuery("#zip").focus();
            return false;
        }else if(zip.trim()!='' &&  !isValidPinCode( zip )){
          jQuery("#error-message").html('Please enter valid zip code').show();
          jQuery("#zip").focus();
          return false;
        }else if(same_address ==1 && shipping_firstName.trim() == ''){
            jQuery("#error-message").html('Please Enter Shipping First Name').show();
            jQuery("#shipping_firstName").focus();
            return false;
        }else if(same_address ==1 && shipping_lastName.trim() == ''){
            jQuery("#error-message").html('Please Enter Shipping Last Name').show();
            jQuery("#shipping_lastName").focus();
            return false;
        }else if(same_address ==1 && shipping_phone.trim() == ''){
            jQuery("#error-message").html('Please Enter Shipping Phone No.').show();
            jQuery("#shipping_phone").focus();
            return false;
        }
        // else if(same_address ==1 && shipping_email.trim() == ''){
        //     jQuery("#error-message").html('Please Enter Shipping Email Address').show();
        //     jQuery("#shipping_email").focus();
        //     return false;
        // }
        else if(same_address ==1 && shipping_address.trim() == ''){
            jQuery("#error-message").html('Please Enter Shipping Address').show();
            jQuery("#shipping_address").focus();
            return false;
        }else if(same_address ==1 && shipping_city.trim() == ''){
            jQuery("#error-message").html('Please Enter Shipping City').show();
            jQuery("#shipping_city").focus();
            return false;
        }else if(same_address ==1 && shipping_country.trim() == ''){
            jQuery("#error-message").html('Please Select Shipping Country').show();
            jQuery("#shipping_country").focus();
            return false;
        }else if(same_address ==1 && shipping_zip.trim() == ''){
            jQuery("#error-message").html('Please Enter shipping zip Code').show();
            jQuery("#shipping_zip").focus();
            return false;
        }else if(same_address ==1 && shipping_zip.trim()!='' &&  !isValidPinCode( shipping_zip )){
          jQuery("#error-message").html('Please enter valid shipping zip code').show();
          jQuery("#shipping_zip").focus();
          return false;
        }else{
          //  alert('www')
            jQuery('#frmPayment').submit();            
            return true;
        }
    }
    
    function isValidPinCode(str) {
        // Regex to check valid
        // Pincode of India
        let regex = new RegExp(/^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$/);
        var datareturn='';
       
        
        if (regex.test(str)) {
            return datareturn= true;
        }else {
           return  datareturn =false;
        }
        console.log('datareturn'+datareturn);
    }
</script>

    

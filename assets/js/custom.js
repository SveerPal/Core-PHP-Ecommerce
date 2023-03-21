$(document).ready(function(){
  $("#reset").click(function(){
    $(".reset-pass").slideToggle("slow");
  });
  $("#reset").click(function(){
    $(".verify-acc").hide("slow");
  });
  viewCartItems();
});       
function closeShoppingPopup (){
	jQuery('.offCanvas__minicart').removeClass('active');
	jQuery('body').removeClass('offCanvas__minicart_active');
}
function wishListAction(product_code) {
	queryString = 'action=add&code='+ product_code;
	jQuery.ajax({
		url: "http://localhost/alpasban/includes/ajax_wish_list.php",
		data:queryString,
		type: "POST",
		dataType: "json",
		success:function(data){
			jQuery('#wishListCount').html(data.message);
			jQuery('#mobWishListCount').html(data.message);
		}
	});
	
}
function wishListActionRemove(product_code) {
	queryString = 'action=remove&code='+ product_code;
	jQuery.ajax({
		url: "http://localhost/alpasban/includes/ajax_wish_list.php",
		data:queryString,
		type: "POST",
		dataType: "json",
		success:function(data){
			jQuery('#wishListCount').html(data.message);
			jQuery('#mobWishListCount').html(data.message);
			location.reload();
		}
	});
	
}
function updatecartQty(){
	
	var dataarray = jQuery('#product_ids').val().split(",");
	var dataarray = jQuery('#product_var_ids').val().split(",");
	//alert(dataarray);
	var alldata = [];
	$i = 0;
	jQuery.each(dataarray, function(i, dataarray){
	   var qnt1 = document.getElementById("productqty"+dataarray).value;
	   
	  dataarray1=dataarray;
	  dataarray2 = dataarray1.split("-");
	    alldata.push({
            qnt: qnt1, 
            prod_id:  dataarray2[0],
            var_id:  dataarray2[1]
        });
        
	  $i++;
	});
	
	var queryString = alldata;
	//console.log(queryString);
	//alert(queryString);
	//return false;
	jQuery.ajax({
	url: "http://localhost/alpasban/includes/ajax_action_update.php",
	data:{productData:queryString},
	type: "POST",
	success:function(data){
		console.log(data);
		if(data=='nostock'){
			Lobibox.notify('warning', {
                    msg: 'This product is out of stock',
                    position: "bottom right1"
                });
	    }else{
			Lobibox.notify('success', {
				msg: 'Product has been updated successfully...',
				position: "bottom right1"
			});
			viewCartItems();
		}
	}
	});
}
function cartAction(action,product_code,variationId='',quantity='') {
	
	
	var queryString = "";
	if(action != "") {
		switch(action) {
      case "buy_detail":
			    queryString = 'action='+action+'&code='+ product_code+'&quantity='+ quantity;
			break;
      case "add_detail":
			    queryString = 'action='+action+'&code='+ product_code+'&quantity='+ quantity;
			break;
      case "var_buy_detail":
          queryString = 'action='+action+'&code='+ product_code+'&productVariationId='+ variationId+'&quantity='+quantity;
			break;
      case "var_add_detail":
          queryString = 'action='+action+'&code='+ product_code+'&productVariationId='+ variationId+'&quantity='+quantity;			
			break;


			case "add":
			    queryString = 'action='+action+'&code='+ product_code+'&quantity=1';
			break;
			case "addcat":
			    var quantity = document.getElementById("quantity"+product_code).value;
			    queryString = 'action='+action+'&code='+ product_code+'&quantity='+quantity;
			break;
			case "remove":
				queryString = 'action='+action+'&code='+ product_code+'&variationId='+ variationId;
			break;
			case "update":
				queryString = 'action='+action+'&code='+ product_code+'&productVariationId='+ variationId+'&quantity='+ document.getElementById("qtycart_"+product_code+variationId).value;
			break;
			case "VariationProduct":
				var quantity = document.getElementById("quantity").value;
				var productVariationId = document.getElementById("productVariationId").value;
			    queryString = 'action='+action+'&code='+ product_code+'&quantity='+quantity+'&productVariationId='+productVariationId;
			break;
			case "empty":
				queryString = 'action='+action;
			break;
		}
	}
  jQuery('.msg').text('');
	jQuery.ajax({
	url: "http://localhost/alpasban/includes/ajax_action.php",
	data:queryString,
	type: "POST",
	success:function(data){
	    console.log(data);
	    if(data=='Please Select Variation'){
	        jQuery('.msg').html('<div class="alert alert-danger p-1" role="alert">'+data+'</div>');
	    }else if(data=='nostock'){
			Lobibox.notify('warning', {
                    msg: 'This product is out of stock',
                    position: "bottom right1"
                });
	    }else{
            if(action == 'remove'){
                Lobibox.notify('success', {
                    msg: 'Product has been removed from cart.',
                    position: "bottom right1"
                });
            }else if(action == 'update'){
                Lobibox.notify('success', {
                    msg: 'Product has been updated successfully. <a style="color:#fff;" href="http://localhost/alpasban/cart.html">View Cart</a>',
                    position: "bottom right1"
                });
            }else if(action == 'var_buy_detail' || action == 'buy_detail'){
              Lobibox.notify('success', {
                  msg: 'Product has been added to cart. <a style="color:#fff;" href="http://localhost/alpasban/cart.html">View Cart</a>',
                  position: "bottom right1"
              });
              window.location.href='http://localhost/alpasban/checkout.html';
            }else{
            	Lobibox.notify('success', {
                    msg: 'Product has been added to cart. <a style="color:#fff;" href="http://localhost/alpasban/cart.html">View Cart</a>',
                    position: "bottom right1"
                });
            }
	    	viewCartItems();
	    }
	},
	error:function (){}
	});
}

function apply_coupon(){
    jQuery('.message').html('');
    var coupon_code = document.getElementById("coupon_code").value;
    var queryString = 'action=coupon_code&code='+ coupon_code;
    if(coupon_code == ''){
        jQuery('.message').html("Please enter coupon code");
    }else{
       jQuery.ajax({
    	url: "http://localhost/alpasban/includes/ajax_action_coupon.php",
    	data:queryString,
    	type: "POST",
    	success:function(data){
    	    jQuery('.message').html(data);
    	    if(data=='Coupon code applied sucessfully.'){
				viewCartItems();
    	    }
    	},
    	error:function (){}
    	});
    }
    return false;
}

function removePromoCode(){
    var queryString = 'action=remove&code=';
    jQuery.ajax({
		url: "http://localhost/alpasban/includes/ajax_coupon_remove.php",
		data:queryString,
		type: "POST",
		success:function(data){
			viewCartItems();
		},
		error:function (){
        //alert("HI");
		}
    });
}


function validate_review(e){
	 var product_id = $("form#" + e + " input[name=product_id]").val();
     var name = $("form#" + e + " input[name=full_name]").val();
     var email = $("form#" + e + " input[name=email_id]").val();
     var message = $("form#" + e + " textarea[name=review_notes]").val();
     var rating = $("form#" + e + " input[name=rating]:checked").val();
     var emailReg = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 if(typeof rating	=== "undefined"){
	    $("form#" + e + "  .message").text("Please Select Your Rating(s)");
	    $("form#" + e + "  textarea[name=rating]").focus();
	    return false;
	} else if (message.trim()==''){
	    $("form#" + e + "  .message").text("Please Enter Your Reviews");
	    $("form#" + e + "  textarea[name=review_notes]").focus();
	    return false;
	}else if(name.trim()==''){
     	$("form#" + e + "  .message").text("Please Enter Full Name");
	    $("form#" + e + "  input[name=full_name]").focus();
    	return false;
    }  else if(email.trim()==''){
	    $("form#" + e + "  .message").text("Please Enter Your Email");
	    $("form#" + e + "  input[name=email_id]").focus();
	    return false;
	}else if(email.trim()!='' &&  !emailReg.test( email )){
	    $("form#" + e + "  .message").text("Please Enter Your Valid Email");
	    $("form#" + e + "  input[name=email_id]").focus();
	    return false;
	}else{
	    $('input[type="submit"]').attr('disabled','disabled');
	    $("form#" + e + "  .message").text("Please wait...");
	    $.ajax({
            type: "POST",
            url: "http://localhost/alpasban/includes/ajax_review.php",
            data: "product_id=" + product_id + "&name=" + name + "&email=" + email + "&message=" + message + "&rating=" + rating + "&form_type=review",
            success: function(html) {
                $("form#" + e + "  .message").text("Thank you for submitting  you review.");
                $("form#" + e + " input[name=full_name]").val('');
                $("form#" + e + " input[name=email_id]").val('');
                $("form#" + e + " textarea[name=review_notes]").val('');
                $("form#" + e + " input[name=rating]").val(''); 
                $('input[type="submit"]').removeAttr('disabled');
                return false;
            }
        });
        return false;
	}
}

function newsletter_validation(e){
	var emailReg = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	var email = $("form#" + e + " input[name=email]").val();
	if(email.trim()==''){
	    $("form#" + e + "  .message").text("Please Enter Your Email");
	    $("form#" + e + "  input[name=email]").focus();
	    return false;
	}else if(email.trim()!='' &&  !emailReg.test( email )){
	    $("form#" + e + "  .message").text("Please Enter Your Valid Email");
	    $("form#" + e + "  input[name=email]").focus();
	    return false;
	}else{
	    $('input[type="submit"]').attr('disabled','disabled');
	    $("form#" + e + "  .message").text("Please wait...");
		$.ajax({
            type: "POST",
            url: "http://localhost/alpasban/includes/form-process.php",
            data: "email=" + email + "&form_type=newsletter",
            success: function(html) {
				if(html == 'success'){
                    $("form#" + e + " .newsletter__subscribe").html("<p class='text-success'>Thank you for your Subscription to Al Pasban newsletter!</p>");
                    $("form#" + e + " input[name=email]").val('');
                    $("form#" + e + "  .message").text("");
                    $('input[type="submit"]').removeAttr('disabled');
				}else{
					$("form#" + e + "  .message").text("Technical Issue, Please try after some time.");
				}
				
                return false;
            }
        });
        return false;
	}
}
function validation_v1(e){
     var name = $("form#" + e + " input[name=name]").val();
	 var lname = $("form#" + e + " input[name=lname]").val();
     var email = $("form#" + e + " input[name=email]").val();
     var phone = $("form#" + e + " input[name=phone]").val();
     var message = $("form#" + e + " textarea[name=message]").val();
     var emailReg = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if(typeof phone	=== "undefined"){
	  var phone = '';
	}
	if(typeof lname	=== "undefined"){
	  var lname = '';
	}
    if(name.trim()==''){
     	$("form#" + e + "  .message").text("Please Enter Name");
	    $("form#" + e + "  input[name=name]").focus();
    	return false;
    }  else if(email.trim()==''){
	    $("form#" + e + "  .message").text("Please Enter Your Email");
	    $("form#" + e + "  input[name=email]").focus();
	    return false;
	}else if(email.trim()!='' &&  !emailReg.test( email )){
	    $("form#" + e + "  .message").text("Please Enter Your Valid Email");
	    $("form#" + e + "  input[name=email]").focus();
	    return false;
	}else if (message.trim()==''){
	    $("form#" + e + "  .message").text("Please Enter Your Message");
	    $("form#" + e + "  textarea[name=message]").focus();
	    return false;
	} else{
	    $('input[type="submit"]').attr('disabled','disabled');
	    $("form#" + e + "  .message").text("Please wait...");
	    $.ajax({
            type: "POST",
            url: "http://localhost/alpasban/includes/form-process.php",
            data: "name=" + name + "&lname=" + lname + "&email=" + email + "&phone=" + phone + "&message=" + message + "&form_type=contactus",
            success: function(html) {
                $("form#" + e + "  .message").text("Thank you for contacting us.");
                $("form#" + e + " input[name=name]").val('');
				$("form#" + e + " input[name=lname]").val('');
                $("form#" + e + " input[name=email]").val('');
                $("form#" + e + " input[name=phone]").val('');
                $("form#" + e + " textarea[name=message]").val('');
                $('input[type="submit"]').removeAttr('disabled');
                window.location.href='http://localhost/alpasban/thank-you.html';
                return false;
            }
        });
        return false;
	}
}


function viewCartItems() {
    var queryString = "";
	jQuery('#cartpageItems').html(
	"Loading..."
	);
    jQuery.ajax({
		url: "http://localhost/alpasban/includes/ajax_cart_items.php",
		data:queryString,
		dataType: "json",
		type: "POST",
		success:function(data){
			//alert(data.cart_message);
			jQuery('#cartItemCount').html(data.totalIteminCart);
			jQuery('#mobCartItemCount').html(data.totalIteminCart);
			jQuery('#showCartList').html(data.message);
			jQuery('#cartpageItems').html(data.cart_message);
		}
	});
}


//Filter Shop and category Page
var toggleDataAttr = function (iconElem, opt1, opt2, dataAttr) {

  // ** Would like to DRY this up **
  var toggleParent = iconElem.parentElement.parentElement;
  var toggleContent = toggleParent.querySelector('.toggleContent');

  iconElem.setAttribute(dataAttr,iconElem.getAttribute(dataAttr) === opt1 ? opt2 : opt1);
  toggleContent.setAttribute(dataAttr,toggleContent.getAttribute(dataAttr) === opt1 ? opt2 : opt1);
};

// declare toggle onclick element
var toggler = document.querySelectorAll('.toggleIcon');

// iterate query and listen for clicks
for (var i = 0; i < toggler.length; i++) {
  toggler[i].onclick = function() {
  // set elements for data attribute toggle
  toggleDataAttr(this, 'closed', 'open', 'data-state');
  };
} 

[].forEach.call(document.querySelectorAll('input[name="color[]"]:checked'), function(cb) {
  console.log(cb.value); 
});

//Product Detail
var data = 1;

//printing default value of data that is 0 in h2 tag
//document.getElementById("counting").innerText = data;

//creation of increment function
function increment() {
    data = data + 1;
    document.getElementById("counting").innerText = data;
    document.getElementById("productqty").value = data;
}
//creation of decrement function
function decrement() {
  if(data>1){
    data = data - 1;
    document.getElementById("counting").innerText = data;
    document.getElementById("productqty").value = data;
  }  
}


function incrementCart(str='',variationid='') {
	
  var data =parseInt(document.getElementById("productqty"+str+"-"+variationid).value);
  
  data = data + 1;
 // alert(data);
  document.getElementById("counting"+str+"-"+variationid).innerText = data;
  document.getElementById("productqty"+str+"-"+variationid).value = data;
}
//creation of decrement function
function decrementCart(str='',variationid='') {
  var data =parseInt(document.getElementById("productqty"+str+"-"+variationid).value);
  if(data>1){
    data = data - 1;
    document.getElementById("counting"+str+"-"+variationid).innerText = data;
    document.getElementById("productqty"+str+"-"+variationid).value = data;
  }  
}


// Filter
var currentscrollHeight = 0;

jQuery(document).ready(function($) {
  function getProductsAjax(page,category_id,myscroll=''){
    let products_categories=[];
    let price='';
    let size=[];
    let color=[];
    let fabric=[];
    let style=[];
    let orderby='';
    $('input[name="products_categories[]"]').each(function () {
      if($(this).is(':checked'))
      products_categories.push($(this).val());      
    });
    products_categories=products_categories.toString();
    //console.log (products_categories);

    
    if($('input[name="price[]"]').is(":checked")){      
      //price=$(this).val();
      price=$('input[name="price[]"]:checked').val();
    }
    //console.log (price);

    $('input[name="size[]"]').each(function () {
      if($(this).is(':checked'))
      size.push($(this).val());
    });
    size=size.toString();
    //console.log (size);

    $('input[name="color[]"]').each(function () {
      if($(this).is(':checked'))
      color.push($(this).val());
    });
    color=color.toString();
    //console.log (color);

    $('input[name="fabric[]"]').each(function () {
      if($(this).is(':checked'))
      fabric.push($(this).val());      
    });
    fabric=fabric.toString();
    //console.log (fabric);

    $('input[name="style[]"]').each(function () {
      if($(this).is(':checked'))
      style.push($(this).val());      
    });
    style=style.toString();
    //console.log (style);
    orderby = $('.orderby option:selected').val();

    $.ajax({
      url: urlAjax,
      type: "POST",
      data:  {
                page:page,
                category_id:category_id,
                price:price,
                products_categories:products_categories,
                size:size,
                color:color,
                fabric:fabric,
                style:style,
                orderby:orderby
              },
      // dataType:'json',
      beforeSend: function(){
        //$("#overlay").show();
      },
      success: function(data){
          
            if(myscroll==1){
                //alert("ccc");
                $(".product-list").append(data);
            }else{
                currentscrollHeight = 0;
                // alert("eee");
                $(".product-list").html(data);
            }
       
       
        //setInterval(function() {$("#overlay").hide(); },500);
			let cntprdct=$('body').find('.cvf-pagination-nav').attr('count');
			if(cntprdct== undefined){
				$('.product__showing--count').text('0'+ ' Items');
			}else{
				$('.product__showing--count').text(cntprdct+ ' Items');
			}
			//$('.product__showing--count').text(cntprdct+ ' Items');
		  
      },
      error: function() 
      {} 	        
    });


  }
 
  // Load page 1 as the default
  getProductsAjax(1,category_id);

  // Handle the clicks
  $('body').on('click','.cvf-pagination-nav li.active',function(){
      var page = $(this).attr('p');
      var category_id = $(this).attr('cat');
      getProductsAjax(page,category_id);
  });
  
    
  	$(window).on("scroll", function () {
		const scrollHeight = $(document).height();
		console.log('scrollHeight'+scrollHeight);
		const scrollPos = Math.floor($(window).height() + $(window).scrollTop());
		console.log('scrollPos'+scrollPos);
		const isBottom = scrollHeight - parseInt($('#ship').height()+$('#foot').height()) < scrollPos; 
		console.log('isBottom'+isBottom);
		console.log('currentscrollHeight'+currentscrollHeight);
		if (isBottom && currentscrollHeight < scrollHeight) {

		   var page= $('.post-id:last').attr('p');
		   //alert(page);
		   var category_id= $('.post-id:last').attr('cat');
		   //alert(a);
		   // var page = $(this).attr('p');
           // var category_id = $(this).attr('cat');
           if(page!=undefined){
                getProductsAjax(page,category_id,1);
           }
           
				currentscrollHeight = scrollHeight;
           
		}
  	});
  
  
  //Filter
  
  $('.filterajax,.orderby').click(function(){
     
        var myappenhtml=[];
        $(".filterajax").each(function() {
            if($(this).is(':checked')) {
              myappenhtml.push($(this).val());
            }
        });
        if(typeof myappenhtml !== 'undefined' && myappenhtml.length > 0){
            
             currentscrollHeight = 0;
            
            
            $('.append-or-html').val(1);
            $('.append-or-html').attr('checkboxlength',myappenhtml.length);
        }else{
            $('.append-or-html').val(0);
            $('.append-or-html').attr('checkboxlength',0);
        }
          
              
    //console.log (orderby);
    if($(this).attr('name')=='price[]'){
      $('input[name="price[]"]').prop('checked', false);
      $(this).prop('checked', true);
    }
    getProductsAjax(1,category_id);
  })
  

}); 
/* ================== Search Page  =================*/
jQuery(document).ready(function($) {
	function getProductsSearchAjax(page,search){
	  
	  $.ajax({
		url: urlAjax,
		type: "POST",
		data:  {
				  page:page,
				  search:search
				},
		// dataType:'json',
		beforeSend: function(){
		  //$("#overlay").show();
		},
		success: function(data){
		  $(".product-list-search").html(data);
		  
		  
		},
		error: function() 
		{} 	        
	  });
  
  
	}
   //alert(search);
	// Load page 1 as the default
	getProductsSearchAjax(1,search);
  
	// Handle the clicks
	$('body').on('click','.cvf-pagination-nav li.active',function(){
		var page = $(this).attr('p');
		var search = $(this).attr('search');
		getProductsSearchAjax(page,search);
	});	
  
  }); 
  
  
/* ===================  Registration Ajax written by rajnish  ==============================*/
   $(document).ready(function()
   {  
	$("#reg_submit").click(function(){
	//$("#loaderIcon").show();
    //$('#reg_submit').attr("disabled", true);	
      
	  if($("#firsts").val()==''){
 	alert("Enter First Name");
	$("#firsts").focus();
	return false;
    }
	
	if($("#lasts").val()==''){
 	alert("Enter Last Name");
	$("#lasts").focus();
	return false;
    }
	  
	
	if($("#emails").val()==''){
 	alert("Enter the email");
	$("#emails").focus();
	return false;
    }
		 var chkemail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,5})+$/.test(document.reglogin.emails.value);
	 if (!chkemail){
	  alert("Invalid E-mail Address! Please re-enter.")
	  document.reglogin.emails.focus();
	  return false;
	 }
    
     if($("#phones").val()==''){
 	alert("Enter Phone No.");
	$("#phones").focus();
	return false;
    }
	var phoneno = /^\d{10}$/;
    if (phoneno.test($("#phones").val()) == false) {
        alert("Invalid Phone! Please re-enter.");
        return false;
    }
	
	if($("#fld_emp_pass").val()==''){
 	alert("Enter Password.");
	$("#fld_emp_pass").focus();
	return false;
    }
	
	 checked = $("#check2:checked").length;

      if(!checked) {
        alert("Please accept term and conditions.");
        return false;
      }

	
	 var firsts = document.getElementById('firsts').value;
	 var lasts = document.getElementById('lasts').value;
	 var emailid = document.getElementById('emails').value;
	 var phone_reg = document.getElementById('phones').value;
	 var pass_reg = document.getElementById('fld_emp_pass').value;
	  
	  //alert(emailid);
	 
      $.get("http://localhost/alpasban/includes/ajax_register.php?firsts=" + firsts+"&lasts=" + lasts+"&id_email=" + emailid+"&phone_reg=" + phone_reg+"&pass_reg=" + pass_reg,
		function(data) { 
		 //alert(data);
		   
            $('#div_reglogin').html(data);
			if(data=="2"){
			$('#reg_submit').attr("disabled", false);
			$("#firsts").val('');
			$("#lasts").val('');
			$("#emails").val('');
			$("#phones").val('');
		    $("#fld_emp_pass").val('');
			$("#output").text("Thanks for registering with us.");
			}
			if(data=="1"){
			$("#output").text("This Email id  already exist, try another Email Id.");
			}
      
			//$('#loaderIcon').hide(); 
		}
		
	);
});
});

/* ===================  Login Ajax written by rajnish  ==============================*/

 $(document).ready(function()
   {
	$("#lgoin_submit").click(function(){
	//$("#loaderIcon").show();
	if($("#loginemail").val()==''){
 	alert("Please Enter Username ");
	$("#loginemail").focus();
	return false;
    }
	
	  if($("#loginpassword").val()==''){
		alert("Please Enter Password ");
		$("#loginpassword").focus();
		return false;
	 }
	var emailid = document.getElementById('loginemail').value;
	var passwords = document.getElementById('loginpassword').value;
	
	$.get("http://localhost/alpasban/includes/ajax_login.php?id_email=" + emailid+"&id_password=" + passwords,
		function(data) { 
		    //alert(data);
		    $('#loginpopup').hide();
			//$('#loaderIcon').hide();
			$('#div_logins').html(data);
			//$("#headermenu2").addClass("importantmenu2");
			 //$("#headermenu1").addClass("importantmenu1");
			
			 
           
			 
		}
		
	);
});
});

// jQuery("[data-autoscroll]").autoscroll({
//   interval: 100
// });
// jQuery("[data-autoscroll]").autoscroll({
//   hideScrollbar: false
// });
// jQuery("[data-autoscroll]").autoscroll({
//   handlerIn: null,
//   handlerOut: null
// });


$('#fld_emp_pass, #fld_emp_conpass').on('keyup', function () {

		  var password = $('#fld_emp_pass').val();

		  if (password == $('#fld_emp_conpass').val()) {

		   $('#message').html('');	

		  } else{

			$('#message').html('Confirm Password Not Matching').css('color', 'red');

			

		  }

		  var number = /([0-9])/;

	var alphabets = /([a-zA-Z])/;

	var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;

	

	if(jQuery('#fld_emp_pass').val().match(number) && jQuery('#fld_emp_pass').val().match(alphabets) && jQuery('#fld_emp_pass').val().match(special_characters) && password == $('#fld_emp_conpass').val()) {

	$('#reg_submit').prop('disabled', false);

	}

	else{

	$('#reg_submit').prop('disabled', true);

	}



	if(jQuery('#fld_emp_pass').val().length<8) {

		jQuery('#password-strength-status').removeClass();

		jQuery('#password-strength-status').addClass('weak-password');

		jQuery('#password-strength-status').html("Weak (should be atleast 8 characters.)");
		jQuery('.weak-password').css('color','red');

	} else {

	    if(jQuery('#fld_emp_pass').val().match(number) && jQuery('#fld_emp_pass').val().match(alphabets) && jQuery('#fld_emp_pass').val().match(special_characters)) {

			jQuery('#password-strength-status').removeClass();

			jQuery('#password-strength-status').addClass('strong-password');

			jQuery('#password-strength-status').html("Strong");
			jQuery('.strong-password').css('color','green');

        } else {

			jQuery('#password-strength-status').removeClass();

			jQuery('#password-strength-status').addClass('medium-password');

			jQuery('#password-strength-status').html("Medium (should include alphabets, numbers and special characters.)");
			jQuery('.medium-password').css('color','red');

        }

	}

  });
  
  function viewPassword(){
	  
	var passwordInput = $(".pass-input");
	var passStatus = document.getElementById('pass-status');
	if (passwordInput.attr('type') == 'password')
	  {
		passwordInput.prop('type', 'text');
		passStatus.className='fa fa-eye';
		
	  }
	  else
	  {
		passwordInput.prop('type', 'password');
		passStatus.className='fa fa-eye-slash';
	  }
 }
 
 
 function viewPassword1(){
	var passwordInput = $(".pass-input1");
	var passStatus = document.getElementById('pass-status1');
	if (passwordInput.attr('type') == 'password')
	  {
		passwordInput.prop('type', 'text');
		passStatus.className='fa fa-eye';
	  }
	  else
	  {
		passwordInput.prop('type', 'password');
		passStatus.className='fa fa-eye-slash';
	  }
 }
 
 function viewPasswordlog(){
	var passwordInput = $(".pass-input-login");
	var passStatus = document.getElementById('pass-input-login');
	if (passwordInput.attr('type') == 'password')
	  {
		passwordInput.prop('type', 'text');
		passStatus.className='fa fa-eye';
	  }
	  else
	  {
		passwordInput.prop('type', 'password');
		passStatus.className='fa fa-eye-slash';
	  }
 }
 
 /* ===================  Forget Pass Ajax written by rajnish  ==============================*/

$(document).ready(function(){
$("#forget_submit").click(function(){
	
			var formtype = $('#formtype').val();
			if($("#restemail").val()==''){
			alert("Enter the email on the account -  will be emailed to you shortly to help you recover your password");
			$("#restemail").focus();
			return false;
			}
			
			var emailid = document.getElementById('restemail').value;
			if(emailid!=""){
			//$("#loaderIcon").show();
			}
		   $.get("http://localhost/alpasban/includes/ajax_forget.php?id_email=" + emailid+"&formtype=" + formtype,
		   function(data) { 
		   alert(data);
			$('#div_forgetlogin').html(data);
			//$('#loaderIcon').hide();
			$("#restemail").val('');
            
		}
		
			);
		});
  });









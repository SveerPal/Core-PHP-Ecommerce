<?php ob_start();
 
    //error_reporting(E_ALL);
   // ini_set('display_errors', TRUE);
include('includes/header.php'); 
 $category = isset($_REQUEST['fld_category'])?$_REQUEST['fld_category']:'';
 $subcategory = isset($_REQUEST['fld_sub_category'])?$_REQUEST['fld_sub_category']:'';
 $slug = isset($_REQUEST['fld_product'])?$_REQUEST['fld_product']:'';
 $slug = htmlspecialchars($slug, ENT_QUOTES, 'UTF-8');
if($slug == 'index'){
	header("HTTP/1.1 301 Moved Permanently"); 
	header("Location: /"); 
	exit();
}
// print_r($_REQUEST);
 //die;
if($category == 'category'){
    
    $pageDetails = $FontEndData->getProductCategory($slug); //pass slug name
   //var_dump($pageDetails);
    if($pageDetails==NULL){
    	header("location: ".SITE_URL."404.html");
    	 ob_end_flush();
    	 exit;
    }
    $page_template = 'product-category.php';
}else if($category == 'product'){
    $pageDetails = $FontEndData->getProductDetail($slug); //pass slug name
    if($pageDetails==NULL){
    	header("location: ".SITE_URL."404.html");
    	 ob_end_flush();
    	 exit;
    }
    $page_template = 'product-details.php';
}else if($category == 'blog'){
    $pageDetails = $FontEndData->getBlogDetail($slug); //pass slug name
    if($pageDetails==NULL){
    	header("location: ".SITE_URL."404.html");
    	 ob_end_flush();
    	 exit;
    }
    $page_template = 'blog-details.php';
}else if($category == 'blog-categories'){
    $pageDetails = $FontEndData->getBlogCategoryDetail($slug); //pass slug name
    if($pageDetails==NULL){
    	header("location: ".SITE_URL."404.html");
    	 ob_end_flush();
    	 exit;
    }
    $page_template = 'blog-categories.php';
}else if($category == 'blog-tag'){
    $pageDetails = $FontEndData->getBlogTagDetail($slug); //pass slug name
    if($pageDetails==NULL){
    	header("location: ".SITE_URL."404.html");
    	 ob_end_flush();
    	 exit;
    }
    $page_template = 'blog-tags.php';
}else{
    
    $page_template = '404.php';
}

include_once($page_template);
include('includes/footer.php'); 
?>

<script>
    function varationproducts(ele){
        let attrval=[];
        let attrname=[];
        let productId=$('#product_id_detail').val();
        var eleradio = document.getElementsByClassName('prodductvari');
        for(i = 0; i < eleradio.length; i++) {
            if(eleradio[i].type="radio") {
                if(eleradio[i].checked){
                    attrval.push(eleradio[i].value);
                }
                attrname.push(eleradio[i].name);
            }
        }
        attrname = attrname.filter((v, i, a) => a.indexOf(v) === i);

        
        if(attrval=='' || attrval.length!=attrname.length){
            $('.msgvar').text('Please Select Attributes');
            return false;
        }
        //console.log(attrval);
        //$('.variation-product-price').text('');
     //   $('.variation_product_code').text('');
     //   $('.variation_sku').text('');
        jQuery.ajax({
            url: "../includes/get-variation-detail.php",
            data:{variation_value:attrval,product_id:productId},
            dataType: "json",
            type: "POST",
            success:function(response){
               // alert(response);
                console.log(response);
				//alert(response.data.variation_regular_price);
                $('.msgvar').text('');
                $('#variation_id').val('');
                if(response.sts==1){
                    //console.log(response.data);
                    if(response.data.variation_sale_price!=0){
                        $('.variation-product-price').text(response.data.variation_sale_price);
                    }else{
                     $('.variation-product-price').text('<?php echo CURRENCY; ?>'+response.data.variation_regular_price);
                    }
                    $('.variation_product_code').text(response.data.variation_product_code);
                    $('.variation_sku').text(response.data.variation_sku);
                    $('#variation_id').val(response.data.id);
                    $('.custom_size').text(response.data.variation_custom_size);
					
                    if(response.stock > 0){
						Lobibox.notify('warning', {
							msg: 'You can not order more then '+response.stock+' products',
							position: "bottom right1"
						});
					}
                }else{
                    $('.msgvar').text('Product is not availble in this combination');
                    $('#variation_id').val('');
                }
            }
        });
    }

    //Simple Product Add Cart
    $('.buynow,.addtocart').click(function(){
        let productidcart=$('#product_id_detail').val();
        let productqty=$('#productqty').val();
        let btnid=$(this).attr('id');
    
        if(productidcart!=null && productidcart!=undefined && productidcart!="" && productqty!=null && productqty!=undefined && productqty!=""){
        
            if(btnid=='buynow'){
                cartAction('buy_detail',productidcart,0,productqty)
            }else{
                cartAction('add_detail',productidcart,0,productqty)
            }
        }
    
    })
    //Variation Product Add Cart
    $('.varbuynow,.varaddtocart').click(function(){    
        let attrval=[];
        let attrname=[];
        var eleradio = document.getElementsByClassName('prodductvari');
        for(i = 0; i < eleradio.length; i++) {
            if(eleradio[i].type="radio") {
                if(eleradio[i].checked){
                    attrval.push(eleradio[i].value);
                }
                attrname.push(eleradio[i].name);
            }
        }
        attrname = attrname.filter((v, i, a) => a.indexOf(v) === i);

        
        if(attrval=='' || attrval.length!=attrname.length){
            $('.msgvar').text('Please Select Attributes');
            return false;
        }
        $('.msgvar').text('');
        let productidcart=$('#product_id_detail').val();
        let productqty=$('#productqty').val();
        let variation_id=$('#variation_id').val();
        //alert(variation_id+'--'+productqty+'--'+productidcart);
        let btnid=$(this).attr('id');
        //alert(btnid)
        if(variation_id!=null && variation_id!=undefined && variation_id!="" && productidcart!=null && productidcart!=undefined && productidcart!="" && productqty!=null && productqty!=undefined && productqty!=""){
            
            if(btnid=='varbuynow'){
                cartAction('var_buy_detail',productidcart,variation_id,productqty)
            }else{
                cartAction('var_add_detail',productidcart,variation_id,productqty)
            }
        }
    })
</script>  
<?php //print_r($_REQUEST);

if($_REQUEST['slug']=='blogs' || $_REQUEST['fld_category']=='blog-categories' || $_REQUEST['fld_category']=='blog-tag'){
    if($_REQUEST['slug']=='blogs'){
        $type='blogs';
    }
    if($_REQUEST['fld_category']=='blog-categories'){
        $type='blog-categories';
    }
    if($_REQUEST['fld_category']=='blog-tag'){
        $type='blog-tag';
    }
 
?>
<script>
var urlAjax="<?php echo SITE_URL;?>/lib/templates/blog-search-ajax.php";
var cattag_idd="<?php echo stripslashes($pageDetails['id']);?>";
//alert(cattag_idd)
var typeList="<?php echo $type; ?>";
jQuery(document).ready(function($) {
	function getBlogSearchAjax(page,typeList,cattag_id=''){
	  
	  $.ajax({
		url: urlAjax,
		type: "POST",
		data:  {
				  page:page,
				  cattag_id:cattag_id,
				  typeList:typeList
				},
		// dataType:'json',
		beforeSend: function(){
		  //$("#overlay").show();
		},
		success: function(data){
		  $(".blog-list").html(data);
		  
		  
		},
		error: function() 
		{} 	        
	  });
  
  
	}
   //alert(search);
	// Load page 1 as the default
	getBlogSearchAjax(1,typeList,cattag_idd);
	
  
	// Handle the clicks
	$('body').on('click','.cvf-pagination-nav li.active',function(){
		var page = $(this).attr('p');
		//var search = $(this).attr('search');
		getBlogSearchAjax(page,typeList,cattag_idd);
	});	
  
}); 
</script>
<?php } ?>
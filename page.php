<?php 
include('includes/header.php'); 
//print_r($_REQUEST);
//die;
$slug = isset($_REQUEST['slug'])?$_REQUEST['slug']:'';
$slug = htmlspecialchars($slug, ENT_QUOTES, 'UTF-8');
if($slug == 'index'){
	header("HTTP/1.1 301 Moved Permanently"); 
	header("Location: /"); 
	exit();
}
$pageDetails = $FontEndData->getPageDetails($slug); //pass slug name

if(!$pageDetails){
	http_response_code(404);
	$pageDetails = $FontEndData->getPageDetails('404'); //pass slug name	
}
$page_template = isset($pageDetails['templates'])?$pageDetails['templates']:'404.php';
if($page_template=='404.php'){
	include_once($page_template);
}else{
	include_once($page_template);
?>
<?php
}
include('includes/footer.php'); 
?>

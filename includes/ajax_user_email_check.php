<?php
error_reporting(0);
include_once '../admin/includes/conn.php';
include_once '../lib/function.php';
function html_escape($html_escape)
{
    $html_escape =  stripslashes(strip_tags(htmlspecialchars($html_escape, ENT_QUOTES | ENT_HTML5, 'UTF-8')));
    return $html_escape;
}
     
     
    $conn = $pdo->open();
    $result_user_data =$conn->prepare("select email from users where email='".html_escape($_REQUEST['email'])."'");
	$result_user_data->execute();
	$row_customer = $result_user_data->fetch();
	
	
	$numrow = $result_user_data->rowCount();
    if($numrow>0){
        echo json_encode(array('sts'=>1,'msg'=>'Email Already Exist!'));
    }else{
        echo json_encode(array('sts'=>0));
    } 
?>
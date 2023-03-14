<?php 
include_once('../lib/function.php');
$message = '';
if(!empty($_POST["action"]))
{ 
$itemArray = array();
switch($_POST["action"]) {
	case "add":
		if(!empty($_POST["code"]))
		{
			$itemArray[$_POST["code"]] = array('code'=>$_POST["code"]);
			if(!empty($_SESSION["wish_list"])) {
			    if(array_search($_POST["code"], array_column($_SESSION["wish_list"], 'code')) !== false) {
				    //same value not added
				} else {
				   $_SESSION["wish_list"] = array_merge($_SESSION["wish_list"],$itemArray);
				}
			} else {
			    $_SESSION["wish_list"] = $itemArray;
			}
		}
	break;
	case "remove":
		if(!empty($_POST["code"]))
		{
			if(!empty($_SESSION["wish_list"])) {
				if(count($_SESSION["wish_list"]) == 1){
					$_SESSION["wish_list"] = array();
					unset($_SESSION["wish_list"]);
				}else{
					foreach ($_SESSION["wish_list"] as $select => $val) {
						if($val["code"] == $_POST["code"])
						{   
							unset($_SESSION["wish_list"][$select]);
						}
					}
				}
			}else{
				unset($_SESSION["wish_list"]);
			}
		}
	break;
}
}
$wishcount = isset($_SESSION["wish_list"])?count($_SESSION["wish_list"]):0;
echo json_encode(array("success"=>true,"message"=>$wishcount));
die();
?>
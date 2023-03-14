<?php
	include '../includes/function.php';
	
	if (isset($_POST['orderid'])) {
		$orderid=$_POST['orderid'];
		
		
		
		try{
		 	$updateOrder=$SettingsData->updateOrder($orderid);	
		 	if($updateOrder){
    			echo json_encode(array('status'=>1,'msg'=>"<div class='alert alert-success alert-dismissible'>
    			<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
    			<h4><i class='icon fa fa-check'></i> Success! </h4>Settings updated successfully</div>"));
		 	}else{
        		echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
        				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
        				<h4><i class='icon fa fa-warning'></i> Error! </h4>Oops! Somthing Went Wrong Please Try Again</div>"));
        	}
		}
		catch(PDOException $e){
			echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error!</h4>".$e->getMessage()."</div>"));
		}		
	}else{
		echo json_encode(array('status'=>0,'msg'=>"<div class='alert alert-danger alert-dismissible'>
				<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				<h4><i class='icon fa fa-warning'></i> Error! </h4>Oops! Somthing Went Wrong Please Try Again</div>"));
	}
die;
	
		
?>
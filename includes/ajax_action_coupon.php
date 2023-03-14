<?php
include_once '../admin/includes/conn.php';
include_once('../lib/function.php');
if(!empty($_POST["action"]))
{
    if(!empty($_POST["code"]) && isset($_POST["code"]))
	{
	    if(isset($_SESSION['coupon']['code']) && $_SESSION['coupon']['code'] == $_POST["code"]){
	        $message = '<span class="text-danger">'.$_POST["code"]. ' coupon code already applied.</span>';
	    }else{
			$db = $pdo->open();
            $couponByCode =$db->prepare("SELECT * from products_coupon WHERE fld_code='".$_POST["code"]."' group by fld_id");
            $couponByCode->execute();
            $couponCodes=$couponByCode->fetch(PDO::FETCH_ASSOC);
    		if(isset($couponCodes['discount_amount']) && $couponCodes['discount_amount']!='')	{
    		    $curdate=strtotime("now");
                $mydate=strtotime($couponCodes['fld_expiry_date']);
                if($curdate > $mydate){
    		        $message = '<span class="text-danger">The coupon code has already expired.</span>'; 
    		    }else{
    		        unset($_SESSION['coupon']);
    		        $_SESSION['coupon'] = array('code'=>$couponCodes['fld_code'],'discount_amount'=>$couponCodes['discount_amount'],'discount_type'=>$couponCodes['discount_type']);
    		        $message = 'Coupon code applied sucessfully.';
    		    }
    		}else{
    		   $message = '<span class="text-danger">Invalid coupon code</span>';  
    		}
	    }
	}else{
	   $message = '<span class="text-danger">Please enter coupon code</span>'; 
	}
}
echo $message;
die;
?>
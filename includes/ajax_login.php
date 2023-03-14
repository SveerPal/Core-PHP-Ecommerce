<?php
error_reporting(1);
include_once '../admin/includes/conn.php';
include_once '../lib/function.php';
		function html_escape($html_escape)
		{
				$html_escape =  stripslashes(strip_tags(htmlspecialchars($html_escape, ENT_QUOTES | ENT_HTML5, 'UTF-8')));
				return $html_escape;
		}
     $ip=$_SERVER['REMOTE_ADDR'];
     $date = date('Y-m-d H:i:s');
	 $conn = $pdo->open();
	 $result_user_data =$conn->prepare("select email,status,password,id from users where email='".html_escape($_REQUEST['id_email'])."' && password='".html_escape(md5($_REQUEST['id_password']))."' order by id asc");
	$result_user_data->execute();
	$row_customer = $result_user_data->fetch();
	$loginstatus=$row_customer['fld_status'];
	
	$numrow = $result_user_data->rowCount();
     if($numrow=="")
	  {
		  
	  ?>
	  <script>
    setTimeout(function(){ alert("We do not recognize the login name you entered.Please re-enter your information or create a new account."); }, 1000);
</script>
	 
			<?php 
	   
		}
		elseif($loginstatus=='inactive')
		{
		?>
		 <script>
    setTimeout(function(){ alert("your account has been disabled please contact  administrator or verify email if not."); }, 1000);
</script>
		<?php
		}
		else
	  {
		   $_SESSION['userid'] = $row_customer['id'];
		   //$_SESSION['username'] = $row_customer['username'];
		   $_SESSION['useremail'] = $row_customer['email'];
		?>
		
		 <script type="text/javascript">
			 window.location="https://www.alpasban.com/my-account.html";
			
			 </script>
<?php		
	    
	  } 
?>
<?php 
    include 'includes/conn.php';
	session_start();
	if(isset($_SESSION['admin'])){
		
		$conn = $pdo->open();
		$stmt = $conn->prepare("SELECT * FROM admins WHERE id=:id");
		$stmt->execute(['id'=>$_SESSION['admin']]);
		$admin = $stmt->fetch();

		$pdo->close();

		header('location: '.ADMIN_URL.'home.php');
	} 
?>

<?php include 'includes/header.php'; ?>
<body class="hold-transition login-page">
<div class="login-box">
  	<?php
      if(isset($_SESSION['error'])){
        echo "
          <div class='callout callout-danger text-center'>
            <p>".$_SESSION['error']."</p> 
          </div>
        ";
        unset($_SESSION['error']);
      }
      if(isset($_SESSION['success'])){
        echo "
          <div class='callout callout-success text-center'>
            <p>".$_SESSION['success']."</p> 
          </div>
        ";
        unset($_SESSION['success']);
      }
    ?>
  	<div class="login-box-body">
      <img src="assets/logo/nav-log2.png" width="300"/>
    	<h2 class="login-box-msg">Admin Login</h2>

    	<form action="verify.php" method="POST">
      		<div class="form-group has-feedback">
              <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        		  <input type="email" class="form-control" name="email" placeholder="Email" required>        		
      		</div>
          <div class="form-group has-feedback">
              <span class="glyphicon glyphicon-lock form-control-feedback"></span>
              <input type="password" class="form-control" name="password" placeholder="Password" required>            
          </div>
      		<div class="row">
    			  <div class="col-xs-4 col-md-offset-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat" name="login"><i class="fa fa-sign-in"></i> Sign In</button>
        		</div>
      		</div>
    	</form>
      <!-- <br>
      <a href="password_forgot.php">I forgot my password</a><br>
      <a href="signup.php" class="text-center">Register a new membership</a><br>
      <a href="index.php"><i class="fa fa-home"></i> Home</a> -->
  	</div>
</div>
	
<?php include 'includes/scripts.php' ?>
</body>
</html>
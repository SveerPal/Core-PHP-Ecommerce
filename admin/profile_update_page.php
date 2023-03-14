<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      	<h1><i class="fa fa-user"></i> Profile</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <?php
        if(isset($_SESSION['error'])){
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              ".$_SESSION['error']."
            </div>
          ";
          unset($_SESSION['error']);
        }
        if(isset($_SESSION['success'])){
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i> Success!</h4>
              ".$_SESSION['success']."
            </div>
          ";
          unset($_SESSION['success']);
        }
      ?>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            	<form class="form-horizontal p-10" method="POST" action="profile_update.php?return=<?php echo basename($_SERVER['PHP_SELF']); ?>" enctype="multipart/form-data"> 	
              <div class="form-group "></div>
                <div class="form-group ">
                  <label for="firstname" class="col-sm-4 control-label">Firstname</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="firstname" name="firstname" value="<?php echo $admin['firstname']; ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="lastname" class="col-sm-4 control-label">Lastname</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="lastname" name="lastname" value="<?php echo $admin['lastname']; ?>">
                  </div>
                </div>
                <div class="form-group">
                            <label for="email" class="col-sm-4 control-label">Email</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="email" name="email" value="<?php echo $admin['email']; ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="password" class="col-sm-4 control-label">Password</label>
                  <div class="col-sm-4"> 
                    <input type="password" class="form-control" id="password" name="password" value="<?php echo $admin['password']; ?>">
                  </div>
                </div>
                <!-- <div class="form-group">
                  <label for="photo" class="col-sm-4 control-label">Photo:</label>
                  <div class="col-sm-4">
                    <input type="file" id="photo" name="photo">
                    <?php 
                    if($admin['photo']){
                    ?>
                    <img src="../images/<?php echo $admin['photo']; ?>" height="100" width="100">
                    <?php
                    }
                    ?>
                  </div>
                  
                </div>                 -->
                <div class="form-group">
                  <label for="curr_password" class="col-sm-4 control-label">Current Password:</label>
                  <div class="col-sm-4">
                  <input type="password" class="form-control" id="curr_password" name="curr_password" placeholder="input current password to save changes" required>
                  </div>
                </div>
                <div class="form-group">
                  <label for="curr_password" class="col-sm-4 control-label"></label>
                  <div class="col-sm-4">
                    <button type="submit" class="btn btn-success btn-flat" name="save"><i class="fa fa-check-square-o"></i> Update</button>
                  </div>
                </div>
                
              </form>
              <hr>
          </div>
        </div>
      </div>
    </section>
     
  </div>
  	<?php include 'includes/footer.php'; ?>
    <?php include 'includes/users_modal.php'; ?>

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<script>


function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'users_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('.userid').val(response.id);
      $('#edit_email').val(response.email);
      $('#edit_password').val(response.password);
      $('#edit_firstname').val(response.firstname);
      $('#edit_lastname').val(response.lastname);
      $('#edit_address').val(response.address);
      $('#edit_contact').val(response.contact_info);
      $('.fullname').html(response.firstname+' '+response.lastname);
    }
  });
}
</script>
</body>
</html>

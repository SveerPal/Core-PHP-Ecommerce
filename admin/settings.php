<?php include 'includes/session.php'; ?>
<?php //include 'includes/function.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      	<h1><i class="fa fa-cogs"></i> Global Configuration</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Global Configuration</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">    
      <span class="msg"></span>      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-headerr">
              
            </div>
            <div class="box-body">
            	<form class="form-horizontal" id="updateForm" method="POST" enctype="multipart/form-data"> 	
                <div class="col-md-12">
                  <h3 class="box-title">Info</h3>
                  <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="email" name="email" value="<?php echo $SettingsData->getSettingsData('email'); ?>" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="phone" class="col-sm-2 control-label">Phone</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="phone" name="phone" value="<?php echo $SettingsData->getSettingsData('phone'); ?>" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="address" class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" id="address" name="address"><?php echo $SettingsData->getSettingsData('address'); ?></textarea>                      
                    </div>
                  </div>                                            
                  <div class="form-group">
                    <label for="copyright" class="col-sm-2 control-label">Copyright</label>
                    <div class="col-sm-10">
                    <textarea class="form-control" id="copyright" name="copyright" ><?php echo $SettingsData->getSettingsData('copyright'); ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="footerText" class="col-sm-2 control-label">Footer Text</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" id="footerText" name="footerText" ><?php echo $SettingsData->getSettingsData('footerText'); ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="map" class="col-sm-2 control-label">Map</label>
                    <div class="col-sm-10"> 
                      <textarea class="form-control" id="map" name="map"><?php echo $SettingsData->getSettingsData('map'); ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="logo" class="col-sm-2 control-label">Logo</label>
                    <div class="col-sm-10"> 
                    <input type="file" class="form-control" id="logo" name="logo" value="">
                      <?php 
                        if($SettingsData->getSettingsData('logo')){
                      ?>
                      <img src="uploaded_files/<?php echo $SettingsData->getSettingsData('logo'); ?>" height="100px">
                      <?php
                        }
                      ?>
                      <input type="hidden" id="logo_old" name="logo_old" value="<?php echo $SettingsData->getSettingsData('logo'); ?>">
                      
                    </div>
                  </div>  
                  <div class="form-group">
                    <label for="map" class="col-sm-2 control-label">Header shipping </label>
                    <div class="col-sm-10"> 
                      <textarea class="form-control" id="header_shipping" name="header_shipping"><?php echo $SettingsData->getSettingsData('header_shipping'); ?></textarea>
                    </div>
                  </div>
                </div>
                <div class="col-md-12">
                  <h3 class="box-title">Social Media</h3>
                  <div class="form-group">
                    <label for="facebook" class="col-sm-2 control-label">Facebook</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="facebook" name="facebook" value="<?php echo $SettingsData->getSettingsData('facebook'); ?>" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="instagram" class="col-sm-2 control-label">Instagram</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="instagram" name="instagram" value="<?php echo $SettingsData->getSettingsData('instagram'); ?>" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="twitter" class="col-sm-2 control-label">Twitter</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="twitter" name="twitter" value="<?php echo $SettingsData->getSettingsData('twitter'); ?>" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="pintrest" class="col-sm-2 control-label">Pintrest</label>
                    <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="pintrest" name="pintrest" value="<?php echo $SettingsData->getSettingsData('pintrest'); ?>" >
                    </div>
                  </div>                            
                  <div class="form-group">
                    <label for="youtube" class="col-sm-2 control-label">Youtube</label>
                    <div class="col-sm-10">
                    <input type="text" class="form-control" id="youtube" name="youtube" value="<?php echo $SettingsData->getSettingsData('youtube'); ?>">
                    </div>
                  </div>                  
                </div>
                <div class="col-md-12">
                  <h3 class="box-title">Scripts</h3>
                  <div class="form-group">
                    <label for="headScript" class="col-sm-2 control-label">Head Script</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" id="headScript" name="headScript" ><?php echo $SettingsData->getSettingsData('headScript'); ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="bodyScript" class="col-sm-2 control-label">Body Script</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" id="bodyScript" name="bodyScript" ><?php echo $SettingsData->getSettingsData('bodyScript'); ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="footerScript" class="col-sm-2 control-label">Footer Script</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" id="footerScript" name="footerScript" ><?php echo $SettingsData->getSettingsData('footerScript'); ?></textarea>
                    </div>
                  </div>                  
                </div>
                <div class="box-footer">
                  <div class="form-group">
                    <label for="curr_password" class="col-sm-2 control-label"></label>
                    <div class="col-sm-2">
                      <button type="submit" class="btn btn-success btn-flat"  name="update"><i class="fa fa-check-square-o"></i> Update</button>
                    </div>
                  </div>
                </div>
              </form>
            </div> 
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


$('#updateForm').on('submit',function(e) {
    e.preventDefault();
    let logo=document.getElementById('logo').files[0];
    let formData = new FormData(this);
    formData.append("logo",logo);
    //formData.append('logo', $('#logo')[0].files[0]);
    $.ajax({
      type: 'POST',
      url: 'ajax/settings_update.php',
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false,
      success: function(response){
        $('.msg').html(response.msg);
        setTimeout(function(){
          $('.msg').html('');
        },5000)
      }
    })
});
</script>
<script>
  $(function(){
    CKEDITOR.replace('copyright')
  });
</script>
</body>
</html>

<header class="main-header">
    <a href="http://codenskills.com/"></a>
  <!-- Logo -->
  <?php include 'includes/function.php'; ?>
  <a href="#" class="logo">
    <?php 
      if($SettingsData->getSettingsData('logo')){
    ?>
    <img src="uploaded_files/<?php echo $SettingsData->getSettingsData('logo'); ?>" height="50px">
    <?php
      }
    ?>
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b><?php echo substr($admin['firstname'], 0, 1); ?></b><?php echo substr($admin['lastname'], 0, 1); ?></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b><?php echo $admin['firstname'].' '.$admin['lastname']; ?></b></span>
  </a>
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>

    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- User Account: style can be found in dropdown.less -->
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="<?php echo (!empty($admin['photo'])) ? 'images/'.$admin['photo'] : 'images/profile.jpg'; ?>" class="user-image" alt="User Image">
            <span class="hidden-xs"><?php echo $admin['firstname'].' '.$admin['lastname']; ?></span>
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header">
              <img src="<?php echo (!empty($admin['photo'])) ? 'images/'.$admin['photo'] : 'images/profile.jpg'; ?>" class="img-circle" alt="User Image">

              <p>
                <?php echo $admin['firstname'].' '.$admin['lastname']; ?>
                <small>Member since <?php echo date('M. Y', strtotime($admin['created_on'])); ?></small>
              </p>
            </li>
            <li class="user-footer">
              <div class="pull-left">
                <a href="#profile" data-toggle="modal" class="btn btn-info btn-flat" id="admin_profile">Update</a>
              </div>
              <div class="pull-right">
                <a href="logout.php" class="btn btn-danger btn-flat">Sign out</a>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header>
<?php include 'includes/profile_modal.php'; ?>
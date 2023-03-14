<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="<?php echo (!empty($admin['photo'])) ? 'images/'.$admin['photo'] : 'images/profile.jpg'; ?>" class="img-circle" alt="User Image">
      </div>
      <div class="pull-left info">
        <p><?php echo $admin['firstname'].' '.$admin['lastname']; ?></p>
        <a><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header"></li>
      <li><a href="home.php"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
      <li class="header"></li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-shopping-cart"></i>
          <span>Ecommerce </span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li><a href="products-styles.php"><i class="fa fa-paint-brush" aria-hidden="true"></i> Style/Type</a></li>
          <li><a href="products-brands.php"><i class="fa fa-building-o" aria-hidden="true"></i> Brands</a></li>
          <li><a href="products-tags.php"><i class="fa fa-tags" aria-hidden="true"></i> Tags</a></li>
          <li><a href="products-fabrics.php"><i class="fa fa-outdent" aria-hidden="true"></i> Fabrics</a></li>
          <li><a href="products-colors.php"><i class="fa fa-outdent" aria-hidden="true"></i> Color</a></li>
          <li><a href="products-categories.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Categories</a></li>
          <li><a href="products-attributes.php"><i class="fa fa-puzzle-piece" aria-hidden="true"></i> Attributes</a></li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-product-hunt"></i>
              <span>Products </span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="products.php"><i class="fa fa-list" aria-hidden="true"></i> Products List </a></li>
              <li><a href="products-add.php"><i class="fa fa-plus" aria-hidden="true"></i> Add New Product </a></li>
              <?php if(isset($_GET['product-id']) && !empty($_GET['product-id'])){ ?>
              <li><a href="products-edit.php?product-id=<?php echo $_GET['product-id']; ?>"><i class="fa fa-pencil" aria-hidden="true"></i> Product Edit </a></li>
              <?php } ?>
            </ul>
          </li>

          <li><a href="sales.php"><i class="fa fa-money"></i> <span>Sales</span></a></li>
		  <li><a href="coupon.php"><i class="fa fa-money"></i> <span>Coupon</span></a></li>
		  <li><a href="review.php"><i class="fa fa-money"></i> <span>Review</span></a></li>
        </ul>
      </li>
      <li class="header"></li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-folder"></i>
          <span>CMS</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li class="treeview">
            <a href="#">
              <i class="fa fa-file"></i>
              <span>Pages </span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="pages.php"><i class="fa fa-list" aria-hidden="true"></i> Pages List </a></li>
              <li><a href="pages-add.php"><i class="fa fa-plus" aria-hidden="true"></i> Add New Page </a></li>
              <?php if(isset($_GET['page-id']) && !empty($_GET['page-id'])){ ?>
              <li><a href="pages-edit.php?page-id=<?php echo $_GET['page-id']; ?>"><i class="fa fa-pencil" aria-hidden="true"></i> Page Edit </a></li>
              <?php } ?>
            </ul>
          </li>
          <li><a href="menus.php"><i class="fa fa-bars"></i> Menus</a></li>
          <li><a href="sliders.php"><i class="fa fa-sliders"></i> Sliders</a></li>
          <li><a href="galleries.php"><i class="fa fa-image"></i> Galleries</a></li>
          <li><a href="faqs.php"><i class="fa fa-question"></i> Faqs</a></li>
          <li><a href="testimonials.php"><i class="fa fa-id-card"></i> Testimonials</a></li>
        </ul>
      </li>
      <li class="header"></li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-newspaper-o"></i>
          <span>Blogs</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li class="treeview">
            <a href="#">
              <i class="fa fa-newspaper-o"></i>
              <span>Blogs </span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="blogs.php"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Blogs List </a></li>
              <li><a href="blogs-add.php"><i class="fa fa-plus" aria-hidden="true"></i> Add New Blog </a></li>
              <?php if(isset($_GET['blog-id']) && !empty($_GET['blog-id'])){ ?>
              <li><a href="blogs-edit.php?blog-id=<?php echo $_GET['blog-id']; ?>"><i class="fa fa-pencil" aria-hidden="true"></i> Blog Edit </a></li>
              <?php } ?>
            </ul>
          </li>
          <!-- <li><a href="blogs.php"><i class="fa fa-newspaper-o"></i> Blogs List</a></li> -->
          <li><a href="blogs-categories.php"><i class="fa fa-list-alt"></i> Blog Categories</a></li>
          <li><a href="blogs-tags.php"><i class="fa fa-tags"></i> Blog Tags</a></li>
        </ul>
      </li>
      <!-- 29-11-22  Start -->
      <li class="header"></li>
      <!--<li class="treeview">-->
      <!--  <a href="#">-->
      <!--    <i class="fa fa-newspaper-o"></i>-->
      <!--    <span>Order Management</span>-->
      <!--    <span class="pull-right-container">-->
      <!--      <i class="fa fa-angle-left pull-right"></i>-->
      <!--    </span>-->
      <!--  </a>-->
      <!--  <ul class="treeview-menu">-->
      <!--    <li><a href="view-orders.php"><i class="fa fa-list-alt"></i>View Order</a></li>-->
      <!--  </ul>-->
      <!--</li>-->
      <!-- 29-11-22 -->
      <li class="header"></li>
      <li><a href="users.php"><i class="fa fa-users"></i> <span>Users</span></a></li>
      <li class="header"></li>
      <li><a href="settings.php"><i class="fa fa-cogs"></i>Global Configuration</a></li>
      <li><a href="profile_update_page.php"><i class="fa fa-user"></i>Profile Update</a></li>
      <li><a href="logout.php"><i class="fa fa-power-off"></i>Log Out</a></li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>
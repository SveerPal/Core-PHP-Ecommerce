 <?php 
 define('ROOT_DIRECTORY',$_SERVER['DOCUMENT_ROOT']);
 define('DBCONN',$_SERVER['DOCUMENT_ROOT'].'admin/includes/conn.php');
 include_once(ROOT_DIRECTORY.'/lib/function.php'); ?>
 <!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <?php $slugmeta=$fld_categorymeta=$fld_productmeta="";
    if(isset($_REQUEST['slug'])){
        $slugmeta=$_REQUEST['slug'];//Other Slug
    }
    if(isset($_REQUEST['fld_category'])){
       $fld_categorymeta=$_REQUEST['fld_category'];// category,product
    }
    if(isset($_REQUEST['fld_product'])){
       $fld_productmeta=$_REQUEST['fld_product'];//category,product slug
    }
    
   
    if($fld_categorymeta=='category'){
        $meta=$FontEndData->getMetaData('products_categories',$fld_productmeta);
    }elseif($fld_categorymeta=='product'){
        $meta=$FontEndData->getMetaData('products',$fld_productmeta);
    }elseif($fld_categorymeta=='blog'){
        $meta=$FontEndData->getMetaData('blogs',$fld_productmeta);
    }elseif($fld_categorymeta=='blog-categories'){
        $meta=$FontEndData->getMetaData('blogs_categories',$fld_productmeta);
    }elseif($fld_categorymeta=='blog-tag'){
        $meta=$FontEndData->getMetaData('blogs_tags',$fld_productmeta);
    }else{
        $meta=$FontEndData->getMetaData('pages',$slugmeta);
    }
    //print_r($_REQUEST);
   // print_r($meta);
   $actual_link = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    ?>
     
  
    <?php if(SITE_URL==$actual_link){ ?>
        <title>Shop Modest Wear Online - Abayas, Hijabs, Pakistani Suits, Kurtis, Palazzos </title>
        <meta name="description" content="Alpasban.com offers a wide range of modest wear online, including Abayas, Hijabs, Pakistani suits, Kurtis, and Palazzos. Also, browse premium collections of Namaz mats.">
    <?php }else{ ?>
        <title><?php  if($meta['meta_title']){ echo $meta['meta_title'];}else{ echo $meta['name']; }?> | AL - PASBAN</title>
        <meta name="description" content="<?php echo $meta['meta_description'];?>">
    <?php } ?>
    
    <link rel="shortcut icon" type="image" href="<?php echo SITE_URL;?>assets/img/favicon.png">
    <link rel="stylesheet" href="<?php echo SITE_URL;?>assets/css/plugins/swiper-bundle.min.css">
    <link rel="stylesheet" href="<?php echo SITE_URL;?>assets/css/plugins/glightbox.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo SITE_URL;?>assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo SITE_URL;?>assets/css/style.css">
    <link href="https://kit-pro.fontawesome.com/releases/v5.15.3/css/pro.min.css" rel="stylesheet">
	<link rel="stylesheet" as="style" type="text/css" href="<?php echo SITE_URL; ?>assets/css/Lobibox.min.css" media="all" />
    <link href="https://www.jqueryscript.net/demo/infinite-scroll-pagination/css/scrollpagination.css"/>
    <script>
        //var category_id=search=urlAjax ="";
    </script>
     <!-- Meta Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '840430010518400');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=840430010518400&ev=PageView&noscript=1"
 alt="fb" /></noscript>
<!-- End Meta Pixel Code -->

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-7H2DM4DW3Z"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

 gtag('config', 'G-7H2DM4DW3Z');
  //gtag('config', 'G-7H2DM4DW3Z',{ 'debug_mode': true });
</script>
<meta name="google-site-verification" content="0y9k7_3CoK1Dne1We3zejbP-0oKYQAkbDEFYyq37fMg" />
<!-- contact Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "AL Pasban",
  "image": "https://alpasban.com/assets/img/logo/nav-log2.png",
  "@id": "",
  "url": "https://alpasban.com/",
  "telephone": "+91 9311503538",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "B-2 First Floor Chand Bagh",
    "addressLocality": "New Delhi",
    "postalCode": "110094",
    "addressCountry": "IN"
  }  
}
</script>
<!-- contact Schema end -->
<!-- Logo Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "AL Pasban",
  "url": "https://alpasban.com/",
  "logo": "https://alpasban.com/assets/img/logo/nav-log2.png",
  "sameAs": [
    "https://www.facebook.com/profile.php?id=100086271502719",
    "https://www.instagram.com/al_pasban/"
  ]
}
</script>
<!-- Logo Schema End-->

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-KCBVSPW');</script>
<!-- End Google Tag Manager -->
 

</head>

<body>
    
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KCBVSPW"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


 <!-- Start header area -->
 <header class="header__section color-scheme-2">
        
        <div class="header__topbar bg__secondary">
            <div class="container-fluid">
                <div class="header__topbar--inner d-flex align-items-center justify-content-between">
                    <div class="header__shipping">
                        <p class="header__shipping--text text-white"><?php echo $FontEndData->getSettingsData('header_shipping'); ?></p>
                    </div>
                    <div class="language__currency d-none d-lg-block">
                        <ul class="d-flex align-items-center">
                            <li class="header__shipping--text text-white">
                               <i class="fal fa-phone-alt"></i> <a class="header__shipping--text__link" href="tel: <?php echo $FontEndData->getSettingsData('phone'); ?>"><?php echo $FontEndData->getSettingsData('phone'); ?></a>
                            </li>
                            <li class="header__shipping--text text-white d-sm-2-none">
                                <i class="far fa-envelope"></i>
                                <a class="header__shipping--text__link" href="mailto:<?php echo $FontEndData->getSettingsData('email'); ?>"><?php echo $FontEndData->getSettingsData('email'); ?></a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="main__header header__sticky">
            <div class="container-fluid">
                <div class="main__header--inner position__relative d-flex justify-content-between align-items-center">
                    <div class="offcanvas__header--menu__open ">
                        <a class="offcanvas__header--menu__open--btn" href="javascript:void(0)" data-offcanvas>
                            <svg xmlns="http://www.w3.org/2000/svg" class="ionicon offcanvas__header--menu__open--svg" viewBox="0 0 512 512"><path fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="32" d="M80 160h352M80 256h352M80 352h352"/></svg>
                            <span class="visually-hidden">Menu Open</span>
                        </a>
                    </div>
                    <div class="main__logo">
                        <h1 class="main__logo--title"><a class="main__logo--link" href="<?php echo SITE_URL ;?>"><img  width="240" height="93" class="main__logo--img" src="<?php echo SITE_URL;?>assets/img/logo/nav-log2.png" alt="logo-img"></a></h1>
                    </div>
                    <div class="header__menu d-none d-lg-block">


                    <nav class="header__menu--navigation">
                        <ul class="d-flex">
                            <?php
                            // (A) CONNECT TO DATABASE - CHANGE SETTINGS TO YOUR OWN!
                            $dbHost = "localhost";
                            $dbName = "al-pasban";
                            $dbChar = "utf8";
                            $dbUser = "alpasbanroot";
                            $dbPass = "zkMFTV[(f[_k";
                            try {
                            $pdo = new PDO(
                                "mysql:host=$dbHost;dbname=$dbName;charset=$dbChar",
                                $dbUser, $dbPass, [
                                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                                ]
                            );
                            } catch (Exception $ex) { exit($ex->getMessage()); }

                            // (B) DRILL DOWN GET MENU ITEMS
                            // ARRANGE BY [PARENT ID] => [MENU ITEMS]
                            $items = [];
                            while (true) {
                            // (B1) SQL QUERY
                            $sql = "SELECT * FROM `menus` WHERE menu_name='Header Menu' and `parent_id` 
                                        ";
                            if (!isset($next)) { $sql .= "= 0 order by menu_order desc"; }
                            else { $sql .= "IN ($next) order by menu_order asc"; }

                            // (B2) FETCH MENU ITEMS
                        
                            $next = "";
                            $parent = "";
                            $stmt = $pdo->prepare($sql);
                            $stmt->execute();
                            while (($i = $stmt->fetch()) !== false) {
                                $parent = $i["parent_id"]=="" ? 0 : $i["parent_id"] ;
                                if (!isset($items[$parent])) { $items[$parent] = []; }
                                $items[$parent][$i["id"]] = $i;
                                $next .= $i["id"] . ",";
                            }
                            if ($next == "") { break; }
                            else { $next = substr($next, 0, -1); }
                            }

                           
                            
                            // (C) DRAW MENU ITEMS
                            foreach ($items[0] as $id=>$i) {
                                $myslug = $FontEndData->getSlug($i['item_id'],$i['menu_type']);
                                if (isset($items[$id])) { 
                                    
                                    if(isset($i['menu_type']) && $i['menu_type']=='Page'){
										$mmUrlparnt = SITE_URL.''.stripslashes($myslug).'.html';
									}else{ 
										$mmUrlparnt = SITE_URL.'category/'.stripslashes($myslug).'.html';
									} 
                                    ?>

                                    <li class="header__menu--items">
                                        <a class="header__menu--link" href="<?php echo $mmUrlparnt; ?>"><?=$i["name"]?>  
                                            <svg class="menu__arrowdown--icon" xmlns="http://www.w3.org/2000/svg" width="12" height="7.41" viewBox="0 0 12 7.41">
                                            <path d="M16.59,8.59,12,13.17,7.41,8.59,6,10l6,6,6-6Z" transform="translate(-6 -8.59)" fill="currentColor" opacity="0.7"></path>
                                            </svg>
                                        </a>

                                        <ul class="header__sub--menu"><?php
                                        foreach ($items[$id] as $cid=>$c) {
                                            $myslugsub = $FontEndData->getSlug($c['item_id'],$c['menu_type']);
                                        ?>
                                        <li class="header__sub--menu__items">
											<?php 
													if(isset($c['menu_type']) && $c['menu_type']=='Page'){
														$mUrl = SITE_URL.'/'.stripslashes($myslugsub).'.html';
													}else{ 
														$mUrl = SITE_URL.'category/'.$myslug.'/'.stripslashes($myslugsub).'.html';
													} ?>
                                            <a href="<?php echo $mUrl; ?>" class="header__sub--menu__link"><?php echo $c['name']; ?></a>
                                            <?php 
                                            if (isset($items[$cid])) {
                                                echo '<ul class="third-level-menu">';
                                                foreach ($items[$cid] as $cidd=>$cc) {
                                                    $myslugsubsub = $FontEndData->getSlug($cc['item_id'],$cc['menu_type']);
                                                    if(isset($cc['menu_type']) && $cc['menu_type']=='Page'){
														$mUrl3 = SITE_URL.'/'.stripslashes($myslugsubsub).'.html';
													}else{ 
														$mUrl3 = SITE_URL.'category/'.$myslug.'/'.stripslashes($myslugsub).'/'.stripslashes($myslugsubsub).'.html';
													} 
											
											        echo '<li><a href="'.$mUrl3.'">'. $cc['name'].'</a></li>';
											
                                                }
                                                echo '</ul>';
                                            }
                                            ?>
                                            
                                        </li>
                                        <?php
                                        }
                                        ?>
                                        </ul>
                                    </li>
                            <?php
                                    
                                } else { 
                                  
                            ?>    
                            
                            <li class='header__menu--items'>
								<?php 
								
													if(isset($i['menu_type']) && $i['menu_type']=='Page'){
														$mmUrl = SITE_URL.''.stripslashes($myslug).'.html';
													}else{ 
														$mmUrl = SITE_URL.'category/'.stripslashes($myslug).'.html';
													} ?>
                                <a href='<?php echo $mmUrl; ?>' class='header__menu--link'><?php echo $i['name'] ; ?>
                                </a>
                            </li>
                                    
                                <?php     
                                }
                            }
                            ?>
                        </ul>
                    </nav>
                        
                    </div>
                    <div class="header__account header__account2">
                        <ul class="d-flex">
                            <li class="header__account--items header__account2--items  header__account--search__items">
                                <a class="header__account--btn search__open--btn" href="javascript:void(0)" data-offcanvas>
                                   <i class="fal fa-search"></i>
                                    <span class="visually-hidden">search btn</span>  
                                </a>
                            </li>
                            <li class="header__account--items header__account2--items">
                                <a class="header__account--btn" href="<?php echo SITE_URL ?>my-account.html">
                                    <i class="fal fa-user"></i>
                                    <span class="visually-hidden">Account</span>  
                                </a>
                            </li>
                            <li class="header__account--items header__account2--items d-none d-lg-block">
                                <a class="header__account--btn" href="<?php echo SITE_URL ?>wishlist.html">
                                    <svg  xmlns="http://www.w3.org/2000/svg" width="28.51" height="23.443" viewBox="0 0 512 512"><path d="M352.92 80C288 80 256 144 256 144s-32-64-96.92-64c-52.76 0-94.54 44.14-95.08 96.81-1.1 109.33 86.73 187.08 183 252.42a16 16 0 0018 0c96.26-65.34 184.09-143.09 183-252.42-.54-52.67-42.32-96.81-95.08-96.81z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"></path></svg>
                                    <span class="items__count  wishlist style2" id="wishListCount"><?php echo isset($_SESSION["wish_list"])?count($_SESSION["wish_list"]):0 ?></span> 
                                </a>
                            </li>
                            <li class="header__account--items header__account2--items">
                                <a class="header__account--btn minicart__open--btn" href="javascript:void(0)" data-offcanvas>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="26.51" height="23.443" viewBox="0 0 14.706 13.534">
                                        <g  transform="translate(0 0)">
                                          <g >
                                            <path  data-name="Path 16787" d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z" transform="translate(0 -463.248)" fill="currentColor"/>
                                            <path  data-name="Path 16788" d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z" transform="translate(-1.191 -466.622)" fill="currentColor"/>
                                            <path  data-name="Path 16789" d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z" transform="translate(-2.875 -466.622)" fill="currentColor"/>
                                          </g>
                                        </g>
                                    </svg>
                                    <span class="items__count style2" id="cartItemCount">0</span> 
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

          <div class="offcanvas__header">
            <div class="offcanvas__inner">
                <div class="offcanvas__logo">
                    <a class="offcanvas__logo_link" href="<?php echo SITE_URL; ?>">
                        <img src="<?php echo SITE_URL; ?>/assets/img/logo/nav-log2.png" alt="Grocee Logo" width="158" height="36">
                    </a>
                    <button class="offcanvas__close--btn" data-offcanvas>close</button>
                </div>
                <nav class="offcanvas__menu">
                    <ul class="offcanvas__menu_ul">


                        <?php 
                        // (C) DRAW MENU ITEMS
                        foreach ($items[0] as $id=>$i) {
                            $myslug = $FontEndData->getSlug($i['item_id'],$i['menu_type']);
                            if (isset($items[$id])) {
                                if(isset($i['menu_type']) && $i['menu_type']=='Page'){
									$mmUrlparnt = SITE_URL.''.stripslashes($myslug).'.html';
								}else{ 
									$mmUrlparnt = SITE_URL.'category/'.stripslashes($myslug).'.html';
								} 
                               
                        ?>

                                <li class="offcanvas__menu_li">
                                    <a class="offcanvas__menu_item" href="<?php echo $mmUrlparnt;?>"><?=$i["name"]?>                                          
                                    </a>

                                    <ul class="offcanvas__sub_menu"><?php
                                    foreach ($items[$id] as $cid=>$c) {
                                        $myslugsub = $FontEndData->getSlug($c['item_id'],$c['menu_type']);
                                    ?>
                                    <li class="offcanvas__sub_menu_li">
                                        <a href="<?php echo SITE_URL;?>category/<?php echo isset($myslugsub)?stripslashes($myslugsub).'.html':'#'; ?>" class="offcanvas__sub_menu_item">
                                            <?php echo $c['name']; ?>
                                        </a>
                                        <?php 
                                        if (isset($items[$cid])) {
                                            echo '<ul class="offcanvas__sub_menu third-level-menu">';
                                            foreach ($items[$cid] as $cidd=>$cc) {
                                                $myslugsubsub = $FontEndData->getSlug($cc['item_id'],$cc['menu_type']);
                                                if(isset($cc['menu_type']) && $cc['menu_type']=='Page'){
													$mUrl3 = SITE_URL.'/'.stripslashes($myslugsubsub).'.html';
												}else{ 
													$mUrl3 = SITE_URL.'category/'.$myslug.'/'.stripslashes($myslugsub).'/'.stripslashes($myslugsubsub).'.html';
												} 
										
										        echo '<li class="offcanvas__sub_menu_li"><a class="offcanvas__sub_menu_item" href="'.$mUrl3.'">'. $cc['name'].'</a></li>';
										
                                            }
                                            echo '</ul>';
                                        }
                                        ?>
                                    </li>
                                    <?php
                                    }
                                    ?>
                                    </ul>
                                </li>
                        <?php
                                
                            } else { 
                                
                           if(isset($i['menu_type']) && $i['menu_type']=='Page'){
								$mmUrl = SITE_URL.''.stripslashes($myslug).'.html';
							}else{ 
								$mmUrl = SITE_URL.'category/'.stripslashes($myslug).'.html';
							}     
                              
                        ?>    
                        
                        
                        <li class='offcanvas__menu_li'>
                            <a href='<?php echo $mmUrl;?>' class='offcanvas__menu_item'>
                                <?php echo $i['name'] ; ?>
                            </a>
                        </li>
                                
                            <?php     
                            }
                        }
                        ?>

                            
                    </ul>
                    <div class="offcanvas__account--items">
                        <a class="offcanvas__account--items__btn d-flex align-items-center" href="<?php echo SITE_URL; ?>login.html">
                        <span class="offcanvas__account--items__icon"> 
                           <i class="fal fa-user"></i>
                            </span>
                        <span class="offcanvas__account--items__label">Login / Register</span>
                        </a>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Start Offcanvas stikcy toolbar -->
        <!-- <div class="offcanvas__stikcy--toolbar color-scheme-2">
            <ul class="d-flex justify-content-between">
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn" href="<?php echo SITE_URL;?>">
                    <span class="offcanvas__stikcy--toolbar__icon"> 
                        <i class="fal fa-home"></i>
                        </span>
                    <span class="offcanvas__stikcy--toolbar__label">Home</span>
                    </a>
                </li>
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn" href="#">
                    <span class="offcanvas__stikcy--toolbar__icon"> 
                       <i class="fal fa-store"></i>
                        </span>
                    <span class="offcanvas__stikcy--toolbar__label">Shop</span>
                    </a>
                </li>
                <li class="offcanvas__stikcy--toolbar__list ">
                    <a class="offcanvas__stikcy--toolbar__btn search__open--btn" href="javascript:void(0)" data-offcanvas>
                        <span class="offcanvas__stikcy--toolbar__icon"> 
                           <i class="fal fa-search"></i>  
                        </span>
                    <span class="offcanvas__stikcy--toolbar__label">Search</span>
                    </a>
                </li>
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn minicart__open--btn" href="javascript:void(0)" data-offcanvas>
                        <span class="offcanvas__stikcy--toolbar__icon"> 
                           <i class="fal fa-shopping-cart"></i>
                        </span>
                        <span class="offcanvas__stikcy--toolbar__label">Cart</span>
                        <span class="items__count" id="mobCartItemCount">0</span> 
                    </a>
                </li>
                
            </ul>
        </div> -->
        <!-- End Offcanvas stikcy toolbar -->
     
     
     
		<!-- Start offCanvas minicart -->
        <div class="offCanvas__minicart color-scheme-2">
			<div id="showCartList"></div>
		</div>
        <!-- Start serch box area -->
        <div class="predictive__search--box color-scheme-2">
            <div class="predictive__search--box__inner">
                <h2 class="predictive__search--title">Search Products</h2>
                <form class="predictive__search--form" action="<?php echo SITE_URL ?>search.html" method="POST">
                    <label>
                        <input name="search" class="predictive__search--input" placeholder="Search Here" type="text">
                    </label>
                    <button class="predictive__search--button">  <i class="fal fa-search"></i>    </button>
                </form>
            </div>
            <button class="predictive__search--close__btn" aria-label="search close button" data-offcanvas>
                <i class="fal fa-times"></i>
            </button>
        </div>
        <!-- End serch box area -->
    </header>
    <!-- End header area -->
<?php 

//print_r($_POST);die;

    include_once '../../admin/includes/conn.php';
    $conn = $pdo->open();	
    $stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM products");
    $stmt->execute();
    $row = $stmt->fetch();

    $msg=$pag_container=$category_id=$andquery=$limit= '';
    $products_categories=$price=$size=$color=$fabric=$style=$orderby="";
    $andproducts_categories=$andprice=$andsize=$andcolor=$andfabric=$andstyle=$orderby="";

    if(isset($_POST['page'])){
        // Sanitize the received page  
        // print_r($_POST);
        $page = $_POST['page'];
        $mypage=$_POST['page']+1;
        
        if(isset($_POST['category_id']) && $_POST['category_id']!=''){
            $category_id = $_POST['category_id'];
            $andquery .=" and FIND_IN_SET ($category_id,category_id)";
        }
        
        if($category_id!=""){
            if(isset($_POST['products_categories']) && $_POST['products_categories']!='' ){
            
                //$products_categories = "'".str_replace(",","','",$_POST['products_categories'])."'";
                $products_categories=explode(",",$_POST['products_categories']);
                //if($category_id){
                    //$products_categories .= ",".$category_id."";
                //}
				if(count($products_categories) > 0){
					$products_loop = '';
					foreach( $products_categories as $ct){
						$products_loop .=" find_in_set($ct,category_id) or";
					}
					$products_loop_trim = rtrim($products_loop,"or");
					$andquery = " and ($products_loop_trim) ";
				}
                //$andquery =" and category_id in($products_categories)";
            }
        }else{
            if(isset($_POST['products_categories']) && $_POST['products_categories']!='' ){
            
                //$products_categories = "'".str_replace(",","','",$_POST['products_categories'])."'";
                //$products_categories=$_POST['products_categories'];
				$products_categories=explode(",",$_POST['products_categories']);
				if(count($products_categories) > 0){
					$products_loop = '';
					foreach( $products_categories as $ct){
						$products_loop .=" find_in_set($ct,category_id) or";
					}
					$products_loop_trim = rtrim($products_loop,"or");
					$andquery = " and ($products_loop_trim) ";
				}
            }
        }
        
        
        if(isset($_POST['price']) && $_POST['price']!=''){
            $price = explode("_",$_POST['price']);
            $andquery .=" and (p.regular_price between $price[0] and $price[1] || 
                                p.sale_price between $price[0] and $price[1] ||
                                v.variation_regular_price between $price[0] and $price[1] || 
                                v.variation_sale_price between $price[0] and $price[1]) ";
        }
        
        

        // if(isset($_POST['color']) && isset($_POST['size']) && $_POST['color']!=""  && $_POST['size']!=""){
        //     $products_size="";
        //     $size = explode(",",$_POST['size']);       
        //     for($s=0;$s<count($size);$s++){
        //         $sizenew=$size[$s];
        //         $products_size.=" v.variation_value like '%$sizenew%' or";
        //     }    
        //     $products_size=rtrim($products_size,"or");
            
        //     $products_color="";
        //     $color = explode(",",$_POST['color']);       
        //     for($s=0;$s<count($color);$s++){
        //         $colornew=$color[$s];
        //         $products_color.=" v.variation_value like '%$colornew%' or";
        //     }    
        //     $products_color=rtrim($products_color,"or");
        //     $andquery .="and ($products_size or $products_color)";
        // }else{
        //     if(isset($_POST['size']) && $_POST['size']!=""){
        //         $products_size="";
        //         $size = explode(",",$_POST['size']);       
        //         for($s=0;$s<count($size);$s++){
        //             $sizenew=$size[$s];
        //             $products_size.=" v.variation_value like '%$sizenew%' or";
        //         }    
        //         $products_size=rtrim($products_size,"or");
        //         $andquery .="and ($products_size)";
        //     }
    
        //     if(isset($_POST['color']) && $_POST['color']!=""){
        //         $products_color="";
        //         $color = explode(",",$_POST['color']);       
        //         for($s=0;$s<count($color);$s++){
        //             $colornew=$color[$s];
        //             $products_color.=" v.variation_value like '%$colornew%' or";
        //         }    
        //         $products_color=rtrim($products_color,"or");
        //         $andquery .="and ($products_color)";
        //     }
        // }
        
        if(isset($_POST['size']) && $_POST['size']!=""){
            $products_size="";
            $size = explode(",",$_POST['size']);       
            for($s=0;$s<count($size);$s++){
                $sizenew=$size[$s];
                $products_size.=" v.variation_value like '%$sizenew%' or";
            }    
            $products_size=rtrim($products_size,"or");
            $andquery .="and ($products_size)";
        }

        if(isset($_POST['color']) && $_POST['color']!=""){
            $color=explode(",",$_POST['color']);
			if(count($color) > 0){
				$productscolor_loop = '';
				foreach( $color as $clr){
					$productscolor_loop .=" find_in_set($clr,color) or";
				}
				$productsclr_loop_trim = rtrim($productscolor_loop,"or");
				$andquery .= " and ($productsclr_loop_trim) ";
			}
        }
        
        if(isset($_POST['fabric']) && $_POST['fabric']!=""){
            //$fabric = $_POST['fabric'];
            //$andquery .="and fabric_id in($fabric)";
				$fabric=explode(",",$_POST['fabric']);
				if(count($fabric) > 0){
					$productsfc_loop = '';
					foreach( $fabric as $fc){
						$productsfc_loop .=" find_in_set($fc,fabric_id) or";
					}
					$productsfc_loop_trim = rtrim($productsfc_loop,"or");
					$andquery .= " and ($productsfc_loop_trim) ";
				}
				
        }
        if(isset($_POST['style']) && $_POST['style']!=""){
            //$style = $_POST['style'];
            //$andquery .="and style_id in($style)";
			$style=explode(",",$_POST['style']);
				if(count($style) > 0){
					$productssy_loop = '';
					foreach( $style as $st){
						$productssy_loop .=" find_in_set($st,style_id) or";
					}
					$productssy_loop_trim = rtrim($productssy_loop,"or");
					$andquery .= " and ($productssy_loop_trim) ";
				}
        }
        if(isset($_POST['orderby'])){
            if($_POST['orderby']=='cat_discount'){
                $orderby =" order by p.sale_price desc ";
            }elseif($_POST['orderby']=='count_desc'){
                $orderby =" order by p.counter desc ";
            }elseif($_POST['orderby']=='price_asc' || $_POST['orderby']=='price_desc'){
                $order = explode("_",$_POST['orderby']);
               // $orderby =" order by p.id $order[0] $order[1] ";
                $orderby =" order by p.regular_price $order[1] ,p.sale_price $order[1], 
                            v.variation_regular_price $order[1], v.variation_sale_price  $order[1]";
            }else{
                $order = explode("_",$_POST['orderby']);
                $orderby =" order by p.$order[0] $order[1] ";
            }
        }
        
        $cur_page = $page;
        $page -= 1;
        // Set the number of results to display
        $per_page =12;
        $previous_btn = true;
        $next_btn = true;
        $first_btn = true;
        $last_btn = true;
        $start = $page * $per_page;
        
        $sql="SELECT p.counter,v.variation_value,p.product_type,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
        min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
        max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
        left join products_variations as v on p.id=v.product_id where status='1' $andquery
        GROUP BY p.id $orderby LIMIT $start, $per_page";
        //echo "<br>";
        $sqlcount="SELECT p.counter,v.variation_value,p.product_type,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
        min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
        max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
        left join products_variations as v on p.id=v.product_id where status='1' $andquery GROUP BY p.id ";
       // echo "<br>";
        //echo $sqlcount="SELECT count(p.id) as numrows FROM products as p  left join products_variations as v on p.id=v.product_id where status='1' $andquery GROUP BY p.name ";
        // echo "<br><hr>";echo "<hr>";echo "<hr>";
        // echo "SELECT p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
        // min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
        // max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
        // left join products_variations as v on p.id=v.product_id where status='1' $andquery
        // GROUP BY p.name ORDER BY id DESC LIMIT $start, $per_page";
        // echo "<hr>";echo "<hr>";echo "<hr>";
       // die("ddddd");
        // Query the necessary posts
        //echo '<br>';
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $products = $stmt->fetchAll();
        $countt=$stmt->rowCount();
        
        $countstmt = $conn->prepare($sqlcount);
        $countstmt->execute();
        $countdata = $countstmt->fetch();  
     //  echo $count =$countdata['numrows'] ;
        $count =$countstmt->rowCount();
        // Loop into all the posts
        
        $no_of_paginations = ceil($count / $per_page);
        if($mypage<=$no_of_paginations+1){
            $mypage;
        }else{
            $mypage="";
        }
        if($mypage!=""){
            if($countt>0){
                    foreach($products as $product):
                    ?>     
                        <div class="col mb-30 post-id" p="<?php echo $mypage; ?>" cat="<?php echo $category_id; ?>">
                            <?php include('product-list.php'); ?>
                        </div>
                    <?php    
                    endforeach;
        
                    // Optional, wrap the output into a container
                
        
                    // This is where the magic happens
                    
                    $mypage;
                    if ($cur_page >= 7) {
                        $start_loop = $cur_page - 3;
                        if ($no_of_paginations > $cur_page + 3)
                            $end_loop = $cur_page + 3;
                        else if ($cur_page <= $no_of_paginations && $cur_page > $no_of_paginations - 6) {
                            $start_loop = $no_of_paginations - 6;
                            $end_loop = $no_of_paginations;
                        } else {
                            $end_loop = $no_of_paginations;
                        }
                    } else {
                        $start_loop = 1;
                        if ($no_of_paginations > 7)
                            $end_loop = 7;
                        else
                            $end_loop = $no_of_paginations;
                    }
                   // echo $page.'<br>'.$mypage;
                   
                    // Pagination Buttons logic     
                    $pag_container .= "<ul class='pagination__wrapper d-flex align-items-center justify-content-center'>";
        
                    if ($first_btn && $cur_page > 1) {
                        $pag_container .= "<li p='1' class='pagination__item active pagination__list' cat='".$category_id."'>First</li>";
                    } else if ($first_btn) {
                        $pag_container .= "<li p='1'  cat='".$category_id."' class='pagination__item inactive pagination__list' >First</li>";
                    }
        
                    if ($previous_btn && $cur_page > 1) {
                        $pre = $cur_page - 1;
                        $pag_container .= "<li p='$pre'  cat='".$category_id."' class='pagination__item active pagination__list'><i class='far fa-long-arrow-left'></i></li>";
                    } else if ($previous_btn) {
                        $pag_container .= "<li cat='".$category_id."' class='pagination__item inactive pagination__list'><i class='far fa-long-arrow-left'></i></li>";
                    }
                    for ($i = $start_loop; $i <= $end_loop; $i++) {
        
                        if ($cur_page == $i)
                            $pag_container .= "<li p='$i' cat='".$category_id."' class = 'pagination__item selected pagination__list' >{$i}</li>";
                        else
                            $pag_container .= "<li p='$i' cat='".$category_id."' class='pagination__item active pagination__list'>{$i}</li>";
                    }
        
                    if ($next_btn && $cur_page < $no_of_paginations) {
                        $nex = $cur_page + 1;
                        $pag_container .= "<li p='$nex' cat='".$category_id."' class='pagination__item active pagination__list'><i class='far fa-long-arrow-right'></i></li>";
                    } else if ($next_btn) {
                        $pag_container .= "<li cat='".$category_id."' class='pagination__item pagination__item inactive pagination__list'><i class='far fa-long-arrow-right'></i></li>";
                    }
        
                    if ($last_btn && $cur_page < $no_of_paginations) {
                        $pag_container .= "<li cat='".$category_id."' p='$no_of_paginations' class='active pagination__item  pagination__list'>Last</li>";
                    } else if ($last_btn) {
                        $pag_container .= "<li cat='".$category_id."' p='$no_of_paginations' class='pagination__item inactive pagination__list'>Last</li>";
                    }
        
                    $pag_container = $pag_container . "</ul>";
                     
                   // echo '<div class = "cvf-pagination-nav w-100" count="'.$count.'">
                   // <nav class="pagination justify-content-center">' . $pag_container . '</nav></div>';
        		   echo '<div class = "cvf-pagination-nav w-100" count="'.$count.'" mypage="'.$mypage.'"></div>';
            }else{
    			 echo '<p class="alert alert-danger col-md-12" role="alert">Oops! No Product Foundt</p>';
    		}
        }elseif($cur_page==1 && $countt==0){
            echo '<p class="alert alert-danger col-md-12" role="alert">Oops! No Product Found</p>';
        }

    }else{
        echo '<div class="alert alert-danger" role="alert">Oops! No Product Found</div>';
    }
    // Always exit to avoid further execution
    exit();
?>

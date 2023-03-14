<?php 

//print_r($_POST);die;

    include_once '../../admin/includes/conn.php';
    $conn = $pdo->open();	
    $stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM products");
    $stmt->execute();
    $row = $stmt->fetch();

    $msg=$andquery=$limit= $pag_container=$search='';

    if(isset($_POST['page'])){
        // Sanitize the received page  
        
       // print_r($_POST);
        
        $page = $_POST['page'];
        
        if(isset($_POST['search']) && $_POST['search']!=''){
            $search = $_POST['search'];
            $andquery =" and name like '%$search%'";
        }
        
        
        $cur_page = $page;
        $page -= 1;
        // Set the number of results to display
        $per_page =150;
        $previous_btn = true;
        $next_btn = true;
        $first_btn = true;
        $last_btn = true;
        $start = $page * $per_page;
        
        $sql="SELECT p.counter,v.variation_value,p.product_type,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
        min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
        max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
        left join products_variations as v on p.id=v.product_id where status='1' $andquery
        GROUP BY p.name LIMIT $start, $per_page";
        //echo "<br>";
        $sqlcount="SELECT p.counter,v.variation_value,p.product_type,p.id,p.name,p.slug,p.regular_price,p.sale_price,p.photo,
        min(v.variation_regular_price) as minVarRegPrice,min(v.variation_sale_price) as minVarSalePrice,
        max(v.variation_regular_price) as maxVarRegPrice, max(v.variation_sale_price) as maxVarSalePrice FROM products as p 
        left join products_variations as v on p.id=v.product_id where status='1' $andquery GROUP BY p.name ";
       
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $products = $stmt->fetchAll();
        $countt=$stmt->rowCount();
        
        
        if($countt>0){
            $countstmt = $conn->prepare($sqlcount);
            $countstmt->execute();
            $countdata = $countstmt->fetch();  
         //  echo $count =$countdata['numrows'] ;
            $count =$countstmt->rowCount();
            // Loop into all the posts
            foreach($products as $product):
            ?>     
                <div class="col mb-30">
                    <?php include('product-list.php'); ?>
                </div>
            <?php    
            endforeach;

            // Optional, wrap the output into a container
        

            // This is where the magic happens
            $no_of_paginations = ceil($count / $per_page);

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

            // Pagination Buttons logic     
            $pag_container .= "<ul class='pagination__wrapper d-flex align-items-center justify-content-center'>";

            if ($first_btn && $cur_page > 1) {
                $pag_container .= "<li p='1' class='pagination__item active pagination__list' search='".$search."'>First</li>";
            } else if ($first_btn) {
                $pag_container .= "<li p='1'  search='".$search."' class='pagination__item inactive pagination__list' >First</li>";
            }

            if ($previous_btn && $cur_page > 1) {
                $pre = $cur_page - 1;
                $pag_container .= "<li p='$pre'  search='".$search."' class='pagination__item active pagination__list'><i class='far fa-long-arrow-left'></i></li>";
            } else if ($previous_btn) {
                $pag_container .= "<li search='".$search."' class='pagination__item inactive pagination__list'><i class='far fa-long-arrow-left'></i></li>";
            }
            for ($i = $start_loop; $i <= $end_loop; $i++) {

                if ($cur_page == $i)
                    $pag_container .= "<li p='$i' search='".$search."' class = 'pagination__item selected pagination__list' >{$i}</li>";
                else
                    $pag_container .= "<li p='$i' search='".$search."' class='pagination__item active pagination__list'>{$i}</li>";
            }

            if ($next_btn && $cur_page < $no_of_paginations) {
                $nex = $cur_page + 1;
                $pag_container .= "<li p='$nex' search='".$search."' class='pagination__item active pagination__list'><i class='far fa-long-arrow-right'></i></li>";
            } else if ($next_btn) {
                $pag_container .= "<li search='".$search."' class='pagination__item pagination__item inactive pagination__list'><i class='far fa-long-arrow-right'></i></li>";
            }

            if ($last_btn && $cur_page < $no_of_paginations) {
                $pag_container .= "<li search='".$search."' p='$no_of_paginations' class='active pagination__item  pagination__list'>Last</li>";
            } else if ($last_btn) {
                $pag_container .= "<li search='".$search."' p='$no_of_paginations' class='pagination__item inactive pagination__list'>Last</li>";
            }

            $pag_container = $pag_container . "</ul>";
             
           // echo '<div class = "cvf-pagination-nav w-100">
           // <nav class="pagination justify-content-center">' . $pag_container . '</nav></div>';
        }else{
            echo '<div class="alert alert-danger col-md-12" role="alert">Oops! No Product Found</div>';
        }

    }else{
        echo '<div class="alert alert-danger" role="alert">Oops! No Product Found</div>';
    }
    // Always exit to avoid further execution
    exit();
?>

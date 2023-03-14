<?php 

//print_r($_POST);die;

    include_once '../../admin/includes/conn.php';
    $conn = $pdo->open();	
    $stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM blogs");
    $stmt->execute();
    $row = $stmt->fetch();

    $msg=$andquery=$limit= $pag_container=$search='';

    if(isset($_POST['page'])){
        // Sanitize the received page  
        
        //print_r($_POST);
        //die;
        $page = $_POST['page'];
        
        if(isset($_POST['cattag_id']) && $_POST['cattag_id']!=''){
           
            if($_REQUEST['typeList']=='blog-categories'){
                $type='category_id';
            }
            if($_REQUEST['typeList']=='blog-tag'){
                $type='tag_id';
            }
            if($_REQUEST['typeList']!='blogs'){
                $cattag_id = $_POST['cattag_id'];
                $andquery =" and $type like '%$cattag_id%'";
                
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
        
        $sql="SELECT * from blogs where status='1' $andquery LIMIT $start, $per_page";
      
        //echo "<br>";
        $sqlcount="SELECT * from blogs where status='1' $andquery ";
       
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $blogs = $stmt->fetchAll();
        $countt=$stmt->rowCount();
        
        
        if($countt>0){
            $countstmt = $conn->prepare($sqlcount);
            $countstmt->execute();
            $countdata = $countstmt->fetch();  
         //  echo $count =$countdata['numrows'] ;
            $count =$countstmt->rowCount();
            // Loop into all the posts
            foreach($blogs as $blog):
            ?>  
                <div class="swiper-slidee col-md-3">
                    <div class="blog__items">
                        <div class="blog__thumbnail">
                            <a class="blog__thumbnail--link" href="<?php echo SITE_URL;?>blog/<?php echo $blog['slug'];?>.html">
                                <img class="blog__thumbnail--img" src="<?php echo UPLOADS.'blogs/'.$blog['photo']; ?>" alt="<?php echo $blog['alt'];?>">
                            </a>
                        </div>
                        <div class="blog__content style2">
                            <span class="blog__content--meta"><?php echo date('M d, Y',strtotime($blog['createDate']));?></span>
                            <h3 class="blog__content--title style2"><a href="<?php echo SITE_URL;?>blog/<?php echo $blog['slug'];?>.html"><?php echo $blog['name'];?></a></h3>
                            <a class="blog__content--btn style2 primary__btn" href="<?php echo SITE_URL;?>blog/<?php echo $blog['slug'];?>.html">Read more </a>
                        </div>
                    </div>
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
                $pag_container .= "<li p='1' class='pagination__item active pagination__list'>First</li>";
            } else if ($first_btn) {
                $pag_container .= "<li p='1'  class='pagination__item inactive pagination__list' >First</li>";
            }

            if ($previous_btn && $cur_page > 1) {
                $pre = $cur_page - 1;
                $pag_container .= "<li p='$pre'  class='pagination__item active pagination__list'><i class='far fa-long-arrow-left'></i></li>";
            } else if ($previous_btn) {
                $pag_container .= "<li class='pagination__item inactive pagination__list'><i class='far fa-long-arrow-left'></i></li>";
            }
            for ($i = $start_loop; $i <= $end_loop; $i++) {

                if ($cur_page == $i)
                    $pag_container .= "<li p='$i' class = 'pagination__item selected pagination__list' >{$i}</li>";
                else
                    $pag_container .= "<li p='$i' class='pagination__item active pagination__list'>{$i}</li>";
            }

            if ($next_btn && $cur_page < $no_of_paginations) {
                $nex = $cur_page + 1;
                $pag_container .= "<li p='$nex' class='pagination__item active pagination__list'><i class='far fa-long-arrow-right'></i></li>";
            } else if ($next_btn) {
                $pag_container .= "<li class='pagination__item pagination__item inactive pagination__list'><i class='far fa-long-arrow-right'></i></li>";
            }

            if ($last_btn && $cur_page < $no_of_paginations) {
                $pag_container .= "<li p='$no_of_paginations' class='active pagination__item  pagination__list'>Last</li>";
            } else if ($last_btn) {
                $pag_container .= "<li p='$no_of_paginations' class='pagination__item inactive pagination__list'>Last</li>";
            }

            $pag_container = $pag_container . "</ul>";
             
            echo '<div class = "cvf-pagination-nav w-100">
            <nav class="pagination justify-content-center">' . $pag_container . '</nav></div>';
        }else{
            echo '<div class="alert alert-danger col-md-12" role="alert">Oops! No Blog Found</div>';
        }

    }else{
        echo '<div class="alert alert-danger" role="alert">Oops! No Blog Found</div>';
    }
    // Always exit to avoid further execution
    exit();
?>

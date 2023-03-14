    <?php 
          $shareurl= SITE_URL.'blog/'. $pageDetails['slug'].'.html'; 
    ?>
    
    <main class="main__content_wrapper">
        
        <?php include('lib/templates/inner-banner.php')?>
        

        <!-- Start blog details section -->
        <section class="blog__details--section section--padding">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xxl-9 col-xl-8 col-lg-8">
                        <div class="blog__details--wrapper">
                            <div class="entry__blog">
                                <div class="blog__post--header mb-30">
                                    <h2 class="post__header--title mb-15"><?php echo stripslashes($pageDetails['name']);?></h2>
                                    <p class="blog__post--meta">
                                        Posted by : admin / On : <?php echo date('M d, Y',strtotime($pageDetails['createDate']));?>  
                                        <?php 
                                        $cats=$FontEndData->getBlogCategory($pageDetails['id']);
                                        if($cats){
                                        ?>/ In :
                                        <?php foreach($cats as $cat){ ?>
                                        <a class="blog__post--meta__link" href="<?php echo SITE_URL;?>blog-categories/<?php echo $cat['slug'];?>.html"><?php echo $cat['name']; ?></a>
                                        <?php } }?>
                                    </p>                                     
                                </div>
                                <div class="blog__thumbnail mb-30">
                                    <?php if($pageDetails['photo']){ ?>
                                    <img class="blog__thumbnail--img border-radius-10" src="<?php  echo UPLOADS.'blogs/'.$pageDetails['photo']; ?>" alt="<?php echo $pageDetails['alt'];?>">
                                    <?php } ?>
                                </div>
                                <div class="blog__details--content">
                                    <?php echo stripslashes($pageDetails['description']);?>
                                </div>
                            </div>
                            
                            
                            <div class="blog__tags--social__media d-flex align-items-center justify-content-between">
                                <?php 
                                $tags=$FontEndData->getBlogTags($pageDetails['id']);
                                if($tags){
                                ?>
                                <div class="blog__tags--media d-flex align-items-center">
                                    <label class="blog__tags--media__title">Releted Tags :</label>
                                    <ul class="d-flex">
                                        <?php foreach($tags as $tag){ ?>
                                        <li class="blog__tags--media__list"><a class="blog__tags--media__link" href="<?php echo SITE_URL;?>blog-tag/<?php echo $tag['slug'];?>.html"><?php echo $tag['name']; ?></a></li>
                                        <?php
                                            }
                                        ?>
                                    </ul>
                                </div>
                                <?php } ?>
                                <div class="blog__social--media d-flex align-items-center">
                                    <label class="blog__social--media__title">Social Share :</label>
                                    <ul class="d-flex">
                                        
                                        <li class="blog__social--media__list">
                                            <a class="blog__social--media__link" target="_blank" href="http://www.facebook.com/sharer.php?u=<?php echo $shareurl;?>">
                                                <i class="fab fa-facebook-f"></i>
                                                <span class="visually-hidden">Facebook</span>
                                            </a>
                                        </li>
                                        <li class="blog__social--media__list">
                                            <a class="blog__social--media__link" target="_blank" href="http://twitter.com/share?url=<?php echo $shareurl;?>&text=<?php echo stripslashes($pageDetails['name']);?>&hashtags=alpasban">
                                               <i class="fab fa-twitter"></i>
                                                <span class="visually-hidden">Twitter</span>
                                            </a>
                                        </li>
                                        <li class="blog__social--media__list">
                                            <a class="blog__social--media__link" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=<?php echo $shareurl;?>">
                                               <i class="fab fa-linkedin"></i>
                                                    <span class="visually-hidden">Linkedin</span>   
                                            </a>
                                        </li>
                                        <li class="blog__social--media__list">
                                            <a class="blog__social--media__link" target="_blank" href="http://pinterest.com/pin/create/button/?url=<?php echo $shareurl;?>&media=<?php  echo UPLOADS.'blogs/'.$pageDetails['photo']; ?>">
                                             <i class="fab fa-pinterest"></i>
                                                <span class="visually-hidden">Pinterest </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            
                            <div class="related__post--area">
                                <div class="section__heading text-center mb-30">
                                    <h2 class="section__heading--maintitle">Related Articles</h2>
                                </div>
                                <div class="row row-cols-md-2 row-cols-sm-2 row-cols-sm-u-2 row-cols-1 mb--n28">
                                    <?php 
                                    $previousBlog=$FontEndData->previousBlog($pageDetails['id']);
                                    $nextBlog=$FontEndData->nextBlog($pageDetails['id']);
                                    ?>
                                    <?php if($previousBlog){ ?>
                                    <div class="col mb-28">
                                        <div class="related__post--items">
                                            
                                            <?php if($previousBlog['photo']){ ?>
                                            <div class="related__post--thumb border-radius-10 mb-15">
                                                <a class="display-block" href="<?php echo SITE_URL;?>blog/<?php echo $previousBlog['slug'];?>.html">
                                                    <img class="related__post--img display-block border-radius-10" src="<?php echo UPLOADS.'blogs/'.$previousBlog['photo']; ?>" alt="<?php echo $previousBlog['alt']; ?>">
                                                </a>
                                            </div>
                                            <?php } ?>
                                            <div class="related__post--text">
                                                <h3 class="related__post--title"><a class="related__post--title__link" href="<?php echo SITE_URL;?>blog/<?php echo $previousBlog['slug'];?>.html"><?php echo $previousBlog['name']; ?></a></h3>
                                                <span class="related__post--deta"><?php echo date('M d, Y',strtotime($previousBlog['createDate']));?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <?php if($nextBlog){ ?>
                                    <div class="col mb-28">
                                        <div class="related__post--items">
                                            <?php if($nextBlog['photo']){ ?>
                                            <div class="related__post--thumb border-radius-10 mb-15">
                                                <a class="display-block" href="<?php echo SITE_URL;?>blog/<?php echo $nextBlog['slug'];?>.html">
                                                    <img class="related__post--img display-block border-radius-10" src="<?php echo UPLOADS.'blogs/'.$nextBlog['photo']; ?>" alt="<?php echo $nextBlog['alt']; ?>">
                                                </a>
                                            </div>
                                            <?php } ?>
                                            <div class="related__post--text">
                                                <h3 class="related__post--title"><a class="related__post--title__link" href="<?php echo SITE_URL;?>blog/<?php echo $nextBlog['slug'];?>.html"><?php echo $nextBlog['name']; ?></a></h3>
                                                <span class="related__post--deta"><?php echo date('M d, Y',strtotime($nextBlog['createDate']));?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    
                                </div>
                            </div>
                            
                            
                            <!--<div class="comment__box">-->
                            <!--    <div class="reviews__comment--area2 mb-50">-->
                            <!--        <h2 class="reviews__comment--reply__title mb-25">Recent Comment</h2>-->
                            <!--        <div class="reviews__comment--inner">-->
                            <!--            <div class="reviews__comment--list d-flex">-->
                            <!--                <div class="reviews__comment--thumb">-->
                            <!--                    <img class="display-block" src="assets/img/other/comment-thumb1.png" alt="comment-thumb">-->
                            <!--                </div>-->
                            <!--                <div class="reviews__comment--content ">-->
                            <!--                    <div class="comment__content--topbar d-flex justify-content-between">-->
                            <!--                        <div class="comment__content--topbar__left">-->
                            <!--                            <h4 class="reviews__comment--content__title2">Jakes on</h4>-->
                            <!--                            <span class="reviews__comment--content__date2">February 18, 2022</span>-->
                            <!--                        </div>-->
                            <!--                        <button class="comment__reply--btn primary__btn" type="submit">Reply</button>-->
                            <!--                    </div>-->
                            <!--                    <p class="reviews__comment--content__desc">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eos ex repellat officiis neque. Veniam, rem nesciunt. Assumenda distinctio, autem error repellat eveniet ratione dolor facilis accusantium amet pariatur, non eius!</p>-->
                            <!--                </div>-->
                            <!--            </div>-->
                            <!--            <div class="reviews__comment--list margin__left d-flex">-->
                            <!--                <div class="reviews__comment--thumb">-->
                            <!--                    <img class="display-block" src="assets/img/other/comment-thumb2.png" alt="comment-thumb">-->
                            <!--                </div>-->
                            <!--                <div class="reviews__comment--content">-->
                            <!--                    <div class="comment__content--topbar d-flex justify-content-between">-->
                            <!--                        <div class="comment__content--topbar__left">-->
                            <!--                            <h4 class="reviews__comment--content__title2">John Deo</h4>-->
                            <!--                            <span class="reviews__comment--content__date2">February 18, 2022</span>-->
                            <!--                        </div>-->
                            <!--                        <button class="comment__reply--btn primary__btn" type="submit">Reply</button>-->
                            <!--                    </div>-->
                            <!--                    <p class="reviews__comment--content__desc">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eos ex repellat officiis neque. Veniam, rem nesciunt. Assumenda distinctio, autem error repellat eveniet ratione dolor facilis accusantium amet pariatur, non eius!</p>-->
                            <!--                </div>-->
                            <!--            </div>-->
                            <!--            <div class="reviews__comment--list d-flex">-->
                            <!--                <div class="reviews__comment--thumb">-->
                            <!--                    <img class="display-block" src="assets/img/other/comment-thumb3.png" alt="comment-thumb">-->
                            <!--                </div>-->
                            <!--                <div class="reviews__comment--content">-->
                            <!--                    <div class="comment__content--topbar d-flex justify-content-between">-->
                            <!--                        <div class="comment__content--topbar__left">-->
                            <!--                            <h4 class="reviews__comment--content__title2">Laura Johnson</h4>-->
                            <!--                            <span class="reviews__comment--content__date2">February 18, 2022</span>-->
                            <!--                        </div>-->
                            <!--                        <button class="comment__reply--btn primary__btn" type="submit">Reply</button>-->
                            <!--                    </div>-->
                            <!--                    <p class="reviews__comment--content__desc">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eos ex repellat officiis neque. Veniam, rem nesciunt. Assumenda distinctio, autem error repellat eveniet ratione dolor facilis accusantium amet pariatur, non eius!</p>-->
                            <!--                </div>-->
                            <!--            </div>-->
                            <!--        </div>-->
                            <!--    </div>-->
                                
                                
                            <!--    <div class="reviews__comment--reply__area">-->
                            <!--        <form action="#">-->
                            <!--            <h2 class="reviews__comment--reply__title mb-20">Leave A Comment</h2>-->
                            <!--            <div class="row">-->
                            <!--                <div class="col-lg-4 col-md-6 mb-20">-->
                            <!--                    <label>-->
                            <!--                        <input class="reviews__comment--reply__input" placeholder="Your Name...." type="text">-->
                            <!--                    </label>-->
                            <!--                </div>  -->
                            <!--                <div class="col-lg-4 col-md-6 mb-20">-->
                            <!--                    <label>-->
                            <!--                        <input class="reviews__comment--reply__input" placeholder="Your Email...." type="email">-->
                            <!--                    </label>-->
                            <!--                </div> -->
                            <!--                <div class="col-lg-4 col-md-6 mb-20">-->
                            <!--                    <label>-->
                            <!--                        <input class="reviews__comment--reply__input" placeholder="Your Website...." type="text">-->
                            <!--                    </label>-->
                            <!--                </div> -->
                            <!--                <div class="col-12 mb-15">-->
                            <!--                    <textarea class="reviews__comment--reply__textarea" placeholder="Your Comments...." ></textarea>-->
                            <!--                </div> -->
                                             
                            <!--            </div>-->
                            <!--            <button class="reviews__comment--btn primary__btn text-white" data-hover="Submit" type="submit">SUBMIT</button>-->
                            <!--        </form>   -->
                            <!--    </div> -->
                            <!--</div> -->
                        </div>
                    </div>
                    
                    
                    
                    <div class="col-xxl-3 col-xl-4 col-lg-4">
                        <div class="blog__sidebar--widget left widget__area">
                            <!--<div class="single__widget widget__search widget__bg">-->
                            <!--    <h2 class="widget__title h3">Search</h2>-->
                            <!--    <form class="widget__search--form" action="#">-->
                            <!--        <label>-->
                            <!--            <input class="widget__search--form__input" placeholder="Search..." type="text">-->
                            <!--        </label>-->
                            <!--        <button class="widget__search--form__btn" aria-label="search button" type="button">-->
                            <!--            <i class="fal fa-search"></i>-->
                            <!--        </button>-->
                            <!--    </form>-->
                            <!--</div>-->
                            
                            
                       
                            <div class="single__widget widget__bg">
                               <h2 class="widget__title h3">Post Article</h2>
                                <div class="product__grid--inner">
                                    <?php 
                                    $recentblogs=$FontEndData->getRecentBlog($pageDetails['id']);
                                    if($recentblogs){
                                        foreach($recentblogs as $recentblog){
                                    ?>
                                    <div class="product__items product__items--grid d-flex align-items-center">
                                        <div class="product__items--grid__thumbnail position__relative">
                                            <a class="product__items--link" href="<?php echo SITE_URL;?>blog/<?php echo $recentblog['slug'];?>.html">
                                                <img class="product__grid--items__img product__primary--img" src="<?php  echo UPLOADS.'blogs/'.$recentblog['photo']; ?>" alt="<?php echo $recentblog['alt']; ?>">
                                                <img class="product__grid--items__img product__secondary--img" src="<?php  echo UPLOADS.'blogs/'.$recentblog['photo']; ?>" alt="<?php echo $recentblog['alt']; ?>">
                                            </a>
                                        </div>
                                        <div class="product__items--grid__content">
                                            <h3 class="product__items--content__title h4"><a href="<?php echo SITE_URL;?>blog/<?php echo $recentblog['slug'];?>.html"><?php echo $recentblog['name']; ?></a></h3>
                                            <span class="meta__deta"><?php echo date('M d, Y',strtotime($recentblog['createDate']));?></span>
                                        </div>
                                    </div>
                                    <?php } } ?>
                                </div>
                            </div>
                            
                            
                            <div class="single__widget widget__bg">
                                <h2 class="widget__title h3">Blog Categories</h2>
                                <ul class="widget__tagcloud">
                                     <?php 
                                    $allcategory=$FontEndData->getAllBlogCategory();
                                    if($allcategory){
                                        foreach($allcategory as $allcat){
                                    ?>
                                    <li class="widget__tagcloud--list"><a class="widget__tagcloud--link" href="<?php echo SITE_URL;?>blog-categories/<?php echo $allcat['slug'];?>.html"><?php echo $allcat['name'];?></a></li>
                                    <?php }
                                    }
                                    ?>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End blog details section -->

     
    </main>

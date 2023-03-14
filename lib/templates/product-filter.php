<div class="shop__sidebar--widget widget__area d-nonee d-lg-block">
    <div class="single__widget widget__bg">
        <h2 class="widget__title h3">FILTER</h2>
        <ul id="shop-filter-list">
            <li class="toggleArea">
                <div class="toggleLabel">
                    <a href="javascript:void(0)">Category</a><i class="toggleIcon" data-state="closed"></i>
                </div>
                <div class="toggleContent" data-state="closed">
                    <input type="hidden" class="append-or-html" value="0">
                    <ul>
                        <?php 
                        $categories=$FontEndData->getProductFilter('products_categories','category_id');                        
                        if($categories){
                        foreach($categories as $category){ 
                        ?>
                        <li>
                            <a class="widget__categories--sub__menu--link d-flex align-items-center" href="javascript:void(0)">
                                <input class="filterajax" name="products_categories[]" value="<?php echo $category['id'];?>" type="checkbox" id="products_categories<?php echo $category['id'];?>" >
                                <label for="products_categories<?php echo $category['id'];?>" class="widget__categories--sub__menu--text"><?php echo $category['name']; ?></label>
                            </a>
                        </li> 
                        <?php }  } ?>
                    </ul>
                </div>
            </li>
            <li>
                <div class="toggleLabel">
                    <a href="javascript:void(0)">Price</a><i class="toggleIcon" data-state="closed"></i>
                </div>
                <div class="toggleContent" data-state="closed">
                    <ul>
                        <?php 
                        $prices=$FontEndData->getProductFilterPriceRange();
                        
                        if($prices){
                        $minprice=1;
                        $maxprice=0;
                        for($p=0; $p<ceil($prices['maxPrice']/1000); $p++){ 
                            $maxprice +=1000;
                        ?>
                        <li> 
                            <a class="widget__categories--sub__menu--link d-flex align-items-center" href="javascript:void(0);">
                                <input class="filterajax" type="checkbox" id="price<?php echo $p; ?>" name="price[]" value="<?php echo $minprice.'_'.$maxprice; ?>">
                                <label for="price<?php echo $p; ?>" class="widget__categories--sub__menu--text"><?php echo CURRENCY.$minprice ; ?> to <?php echo CURRENCY.$maxprice; ?></label>
                            </a>
                        </li>
                        <?php $minprice=$maxprice+1;} } ?>
                    </ul>
                </div>
            </li>
            <li>
                <div class="toggleLabel">
                    <a href="javascript:void(0)">Size</a><i class="toggleIcon" data-state="closed"></i>
                </div>
                <div class="toggleContent" data-state="closed">
                    <ul>
                        <?php 
                        $sizes=$FontEndData->getProductFilterColorSize('products_attributes_values',1);                        
                        if($sizes){
                        foreach($sizes as $size){ 
                        ?>
                        <li>
                            <a class="widget__categories--sub__menu--link d-flex align-items-center" href="javascript:void(0)">
                                <input class="filterajax" type="checkbox" id="size<?php echo $size['id'];?>"  name="size[]" value="<?php echo $size['id'];?>">
                                <label for="size<?php echo $size['id'];?>" class="widget__categories--sub__menu--text"><?php echo $size['name']; ?></label>
                            </a>
                        </li> 
                        <?php }  } ?>
                    </ul>
                </div>
            </li>
            <li>
                <div class="toggleLabel">
                    <a href="javascript:void(0)">Color</a><i class="toggleIcon" data-state="closed"></i>
                </div>
                <div class="toggleContent" data-state="closed">
                    <ul>
                        <?php 
                        $colors=$FontEndData->getProductFilter('products_color','color');                        
                        if($colors){
                        foreach($colors as $color){ 
                        ?>
                        <li>
                            <a class="widget__categories--sub__menu--link d-flex align-items-center" href="javascript:void(0)">
                                <input class="filterajax" type="checkbox" id="color<?php echo $color['id'];?>"  name="color[]" value="<?php echo $color['id'];?>">
                                <label for="color<?php echo $color['id'];?>" class="widget__categories--sub__menu--text"><?php echo $color['name']; ?></label>
                            </a>
                        </li> 
                        <?php }  } ?>
                    </ul>
                </div>
            </li>
            <li>
                <div class="toggleLabel">
                    <a href="javascript:void(0)">Fabric</a><i class="toggleIcon" data-state="closed"></i>
                </div>
                <div class="toggleContent" data-state="closed">
                    <ul>
                        <?php 
                        $fabrics=$FontEndData->getProductFilter('products_fabrics','fabric_id');                        
                        if($fabrics){
                        foreach($fabrics as $fabric){ 
                        ?>
                        <li>
                            <a class="widget__categories--sub__menu--link d-flex align-items-center" href="javascript:void(0)">
                                <input class="filterajax" type="checkbox" id="fabric<?php echo $fabric['id'];?>"  name="fabric[]" value="<?php echo $fabric['id'];?>">
                                <label for="fabric<?php echo $fabric['id'];?>" class="widget__categories--sub__menu--text"><?php echo $fabric['name']; ?></label>
                            </a>
                        </li> 
                        <?php }  } ?>
                    </ul>
                </div>
            </li> 
            <li>
                <div class="toggleLabel">
                    <a href="javascript:void(0)">Style</a><i class="toggleIcon" data-state="closed"></i>
                </div>
                <div class="toggleContent" data-state="closed">
                    <ul>
                        <?php 
                        $styles=$FontEndData->getProductFilter('products_styles','style_id');                        
                        if($styles){
                        foreach($styles as $style){ 
                        ?>
                        <li>
                            <a class="widget__categories--sub__menu--link d-flex align-items-center" href="javascript:void(0)">
                                <input class="filterajax" type="checkbox" id="style<?php echo $style['id'];?>"  name="style[]" value="<?php echo $style['id'];?>">
                                <label for="style<?php echo $style['id'];?>" class="widget__categories--sub__menu--text"><?php echo $style['name']; ?></label>
                            </a>
                        </li> 
                        <?php }  } ?>
                    </ul>
                    
                </div>
            </li> 
        </ul> 
    </div>
</div>


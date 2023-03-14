<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Menu</b></h4>
            </div>
            <form class="form-inlinee" method="POST" id="addForm" enctype="multipart/form-data">
              <div class="modal-body row">
                  <div class="form-group  col-sm-6">
                      <label for="menu_name" class="col-sm-12 control-label">Menu Name</label>
                      <div class="col-sm-12">
                        <select class="form-control" id="menu_name" name="menu_name" required>
                          <option value="">Select Type</option>
                          
                          <option value="Header Menu">Header Menu</option>
                          <option value="My Account">My Account</option>
                          <option value="Useful Links">Useful Links</option>
                          <!-- <option value="Footer Menu 1">Footer Menu 1</option>
                          <option value="Footer Menu 2">Footer Menu 2</option>
                          <option value="Footer Menu 3">Footer Menu 3</option>
                          <option value="Footer Menu 4">Footer Menu 4</option>
                          <option value="Service Menu">Service Menu</option>                           -->
                        </select>                      
                      </div>
                  </div>              
                  <div class="form-group  col-sm-6">
                      <label for="parent_id" class="col-sm-12 control-label">Parent</label>
                      <div class="col-sm-12">
                        <select class="form-control" id="parent_id" name="parent_id">
                          <option value="0">Select Parent</option>
                          <?php echo $prtncatlist; ?>
                        </select>                      
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label  class="col-sm-12 control-label">Link Type</label>
                    <div class="col-sm-12">
                      <div class="radio">
                        <label for="link_type1">
                          <input type="radio" name="link_type" class="link_type" id="link_type1" value="Internal">Internal
                        </label>&nbsp;
                        <label for="link_type0">
                          <input type="radio" name="link_type" class="link_type" id="link_type0" value="External">External
                        </label>
                      </div>                      
                    </div>
                  </div>
                  <span class="internal">
                    <div class="form-group col-sm-6">
                      <label  class="col-sm-12 control-label">Menu Type</label>
                      <div class="col-sm-12">
                        <div class="radio">
                          <label for="menu_type1">
                            <input type="radio" name="menu_type" class="menu_type" id="menu_type1" value="Page">Page
                          </label>&nbsp;
                          <label for="menu_type2">
                            <input type="radio" name="menu_type" class="menu_type" id="menu_type2" value="Category">Category
                          </label>
                        </div>                      
                      </div>
                    </div>
                    <div class="form-group  col-sm-6 page">
                        <label for="page" class="col-sm-12 control-label">Page</label>
                        <div class="col-sm-12">
                          <select class="form-control" id="page" name="page">
                            <option value="">Select</option>
                            <?php $pages=$SettingsData->selctDataOption('pages');
                            foreach($pages as $page){
                              echo '<option value="'.$page['id'].'">'.$page['name'].'</option>';
                            }
                            ?>
                          </select>                      
                        </div>
                    </div>
                    <div class="form-group  col-sm-6 category">
                        <label for="category" class="col-sm-12 control-label">Category</label>
                        <div class="col-sm-12">
                          <select class="form-control" id="category" name="category">
                            <option value="">Select</option>
                            <?php $categories=$SettingsData->selctDataOption('products_categories');
                            foreach($categories as $category){
                              echo '<option value="'.$category['id'].'">'.$category['name'].'</option>';
                            }
                            ?>
                          </select>                      
                        </div>
                    </div>
                  </span>  
                  <div class="form-group  col-sm-6">
                      <label for="name" class="col-sm-12 control-label">Name</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="name" name="name" required>
                      </div>
                  </div>
                  <div class="form-group  col-sm-6 slug">
                      <label for="slug" class="col-sm-12 control-label">Slug</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="slug" name="slug">
                      </div>
                  </div> 
                  <div class="form-group  col-sm-6 item_target">
                      <label for="item_target" class="col-sm-12 control-label">Item Target</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="item_target" name="item_target">
                      </div>
                  </div> 
                  <div class="form-group  col-sm-6 class">
                      <label for="class" class="col-sm-12 control-label">Class</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="class" name="class">
                      </div>
                  </div>  
                  <div class="form-group  col-sm-6 class">
                      <label for="menu_order" class="col-sm-12 control-label">Menu Order</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="menu_order" name="menu_order">
                      </div>
                  </div>

              </div>
              <div class="modal-footer">
                <span class="msgadd"></span>
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
                
              </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit -->
<div class="modal fade" id="edit">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Edit Menu</b></h4>
            </div>

            <form class="form-inlinee" method="POST" id="editForm" enctype="multipart/form-data">
            <input type="hidden" class="id" name="id">
              <div class="modal-body row">              
              <div class="form-group  col-sm-6">
                      <label for="edit_menu_name" class="col-sm-12 control-label">Menu Name</label>
                      <div class="col-sm-12">
                        <select class="form-control" id="edit_menu_name" name="menu_name" required>
                          <option value="">Select Type</option>
                          
                          <option value="Header Menu">Header Menu</option>
                          <option value="My Account">My Account</option>
                          <option value="Useful Links">Useful Links</option>
                          <!-- <option value="Footer Menu 1">Footer Menu 1</option>
                          <option value="Footer Menu 2">Footer Menu 2</option>
                          <option value="Footer Menu 3">Footer Menu 3</option>
                          <option value="Footer Menu 4">Footer Menu 4</option>
                          <option value="Service Menu">Service Menu</option>                           -->
                        </select>                      
                      </div>
                  </div>              
                  <div class="form-group  col-sm-6">
                      <label for="edit_parent_id" class="col-sm-12 control-label">Parent</label>
                      <div class="col-sm-12">
                        <select class="form-control" id="edit_parent_id" name="parent_id">
                          <option value="0">Select Parent</option>
                          <?php echo $prtncatlist; ?>
                        </select>                      
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label  class="col-sm-12 control-label">Link Type</label>
                    <div class="col-sm-12">
                      <div class="radio">
                        <label for="edit_link_type1">
                          <input type="radio" name="link_type" class="link_type" id="edit_link_type1" value="Internal">Internal
                        </label>&nbsp;
                        <label for="edit_link_type0">
                          <input type="radio" name="link_type" class="link_type" id="edit_link_type0" value="External">External
                        </label>
                      </div>                      
                    </div>
                  </div>
                  <span class="internal">
                    <div class="form-group col-sm-6">
                      <label  class="col-sm-12 control-label">Menu Type</label>
                      <div class="col-sm-12">
                        <div class="radio">
                          <label for="edit_menu_type1">
                            <input type="radio" name="menu_type" class="menu_type" id="edit_menu_type1" value="Page">Page
                          </label>&nbsp;
                          <label for="edit_menu_type2">
                            <input type="radio" name="menu_type" class="menu_type" id="edit_menu_type2" value="Category">Category
                          </label>
                        </div>                      
                      </div>
                    </div>
                    <div class="form-group  col-sm-6 page">
                        <label for="edit_page" class="col-sm-12 control-label">Page</label>
                        <div class="col-sm-12">
                          <select class="form-control" id="edit_page" name="page">
                            <option value="">Select</option>
                            <?php $pages=$SettingsData->selctDataOption('pages');
                            foreach($pages as $page){
                              echo '<option value="'.$page['id'].'">'.$page['name'].'</option>';
                            }
                            ?>
                          </select>                      
                        </div>
                    </div>
                    <div class="form-group  col-sm-6 category">
                        <label for="edit_category" class="col-sm-12 control-label">Category</label>
                        <div class="col-sm-12">
                          <select class="form-control" id="edit_category" name="category">
                            <option value="">Select</option>
                            <?php $categories=$SettingsData->selctDataOption('products_categories');
                            foreach($categories as $category){
                              echo '<option value="'.$category['id'].'">'.$category['name'].'</option>';
                            }
                            ?>
                          </select>                      
                        </div>
                    </div>
                  </span>  
                  <div class="form-group  col-sm-6">
                      <label for="edit_name" class="col-sm-12 control-label">Name</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_name" name="name" required>
                      </div>
                  </div>
                  <div class="form-group  col-sm-6 slug">
                      <label for="edit_slug" class="col-sm-12 control-label">Slug</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_slug" name="slug">
                      </div>
                  </div> 
                  <div class="form-group  col-sm-6 item_target">
                      <label for="edit_item_target" class="col-sm-12 control-label">Item Target</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_item_target" name="item_target">
                      </div>
                  </div> 
                  <div class="form-group  col-sm-6 class">
                      <label for="edit_class" class="col-sm-12 control-label">Class</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_class" name="class">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                    <label  class="col-sm-12 control-label">Status</label>
                    <div class="col-sm-12">
                      <div class="radio">
                        <label for="edit_status1">
                          <input type="radio" name="status" class="status" id="edit_status1" value="1">Yes
                        </label>&nbsp;
                        <label for="edit_status0">
                          <input type="radio" name="status" class="status" id="edit_status0" value="0">No
                        </label>
                      </div>                      
                    </div>
                </div>
                <div class="form-group  col-sm-6 class">
                      <label for="edit_menu_order" class="col-sm-12 control-label">Menu Order</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_menu_order" name="menu_order">
                      </div>
                  </div>
              </div>
              <div class="modal-footer">
                <span class="msgedit"></span>
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
              </div>
            </form>
        </div>
    </div>
</div>

<!-- Delete -->
<div class="modal fade" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Deleting...</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" id="deleteForm">
                <input type="hidden" class="id" name="id">
                <div class="text-center">
                    <p>DELETE Menu</p>
                    <h2 class="bold fullname"></h2>
                </div>
            </div>
            <div class="modal-footer">
              <span class="msgdelete"></span>
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i> Delete</button>
              </form>
            </div>
        </div>
    </div>
</div>


<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Products Categories</b></h4>
            </div>
            <form class="form-inlinee" method="POST" id="addForm" enctype="multipart/form-data">
              <div class="modal-body row">              
                  <div class="form-group  col-sm-6">
                      <label for="parent_category" class="col-sm-12 control-label">Parent Category</label>
                      <div class="col-sm-12">
                        <select class="form-control" id="parent_category" name="parent_category">
                          <option value="0">Select Parent</option>
                          <?php echo $prtncatlist; ?>
                        </select>                      
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="name" class="col-sm-12 control-label">Name</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="name" name="name" required>
                      </div>
                  </div>
                  <div class="form-group col-sm-12">
                      <label for="description" class="col-sm-12 control-label">Description</label>
                      <div class="col-sm-12">
                        <textarea class="form-control" id="description" name="description"></textarea>
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="cat_slug" class="col-sm-12 control-label">Slug</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="cat_slug" name="cat_slug">
                      </div>
                  </div>                               
                  <div class="form-group  col-sm-6">
                      <label for="alt" class="col-sm-12 control-label">Alt</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="alt" name="alt">
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="photoadd" class="col-sm-12 control-label">Photo</label>
                      <div class="col-sm-12">
                        <input type="file" id="photoadd" name="photoadd">
                      </div>
                  </div>
                   <div class="form-group col-sm-6">
                      <label for="banner_heading" class="col-sm-12 control-label">Banner Heading</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="banner_heading" name="banner_heading">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_description" class="col-sm-12 control-label">Banner Description</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="banner_description" name="banner_description">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_label" class="col-sm-12 control-label">Banner Label</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="banner_label" name="banner_label">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="banner_url" class="col-sm-12 control-label">Banner URL</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="banner_url" name="banner_url">
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="meta_title" class="col-sm-12 control-label">Meta Title</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="meta_title" name="meta_title">
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="meta_keyword" class="col-sm-12 control-label">Meta Keywords</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="meta_keyword" name="meta_keyword">
                      </div>
                  </div> 
                  <div class="form-group  col-sm-6">
                      <label for="meta_description" class="col-sm-12 control-label">Meta Description</label>
                      <div class="col-sm-12">
                      <textarea class="form-control" id="meta_description" name="meta_description"></textarea>
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
              <h4 class="modal-title"><b>Edit Category</b></h4>
            </div>

            <form class="form-inlinee" method="POST" id="editForm" enctype="multipart/form-data">
            <input type="hidden" class="id" name="id">
              <div class="modal-body row">              
                  <div class="form-group  col-sm-6">
                      <label for="edit_parent_category" class="col-sm-12 control-label">Parent Category</label>
                      <div class="col-sm-12">
                        <select class="form-control" id="edit_parent_category" name="parent_category">
                         
                        </select>                      
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="edit_name" class="col-sm-12 control-label">Name</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_name" name="name" required>
                      </div>
                  </div>
                  <div class="form-group col-sm-12">
                      <label for="edit_description" class="col-sm-12 control-label">Description</label>
                      <div class="col-sm-12">
                        <textarea class="form-control" id="edit_description" name="description"></textarea>
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="edit_cat_slug" class="col-sm-12 control-label">Slug</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_cat_slug" name="cat_slug"  >
                      </div>
                  </div>                               
                  <div class="form-group  col-sm-6">
                      <label for="edit_alt" class="col-sm-12 control-label">Alt</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_alt" name="alt">
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
                <div class="form-group col-sm-6">
                    <label for="edit_photo" class="col-sm-12 control-label">Photo</label>
                    <div class="col-sm-12">
                      <input type="file" class="form-control" id="edit_photo" name="photo">
                      <input type="hidden" class="form-control" id="edit_photo_old" name="photo_old">
                      <img id="edit_img" height="50" width="50">
                    </div>
                </div>
                <div class="form-group col-sm-6">
                      <label for="edit_banner_heading" class="col-sm-12 control-label">Banner Heading</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_banner_heading" name="banner_heading">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="edit_banner_description" class="col-sm-12 control-label">Banner Description</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_banner_description" name="banner_description">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="edit_banner_label" class="col-sm-12 control-label">Banner Label</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_banner_label" name="banner_label">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="edit_banner_url" class="col-sm-12 control-label">Banner URL</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_banner_url" name="banner_url">
                      </div>
                  </div>
                  <div class="form-group col-sm-6">
                      <label for="edit_meta_title" class="col-sm-12 control-label">Meta Title</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_meta_title" name="meta_title">
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="edit_meta_keyword" class="col-sm-12 control-label">Meta Keywords</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_meta_keyword" name="meta_keyword">
                      </div>
                  </div> 
                  <div class="form-group  col-sm-6">
                      <label for="edit_meta_description" class="col-sm-12 control-label">Meta Description</label>
                      <div class="col-sm-12">
                      <textarea class="form-control" id="edit_meta_description" name="meta_description"></textarea>
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
                    <p>DELETE Category</p>
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


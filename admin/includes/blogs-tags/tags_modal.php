<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Blog Tag</b></h4>
            </div>
            <form class="form-inlinee" method="POST" id="addForm" enctype="multipart/form-data">
              <div class="modal-body row">              
                 
                  <div class="form-group  col-sm-6">
                      <label for="name" class="col-sm-12 control-label">Name</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="name" name="name" required>
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="slug" class="col-sm-12 control-label">Slug</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="slug" name="slug">
                      </div>
                  </div>
                  <div class="form-group col-sm-12">
                      <label for="description" class="col-sm-12 control-label">Description</label>
                      <div class="col-sm-12">
                        <textarea class="form-control" id="description" name="description"></textarea>
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
                  <div class="form-group  col-sm-12">
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
              <h4 class="modal-title"><b>Edit Blog Tag</b></h4>
            </div>

            <form class="form-inlinee" method="POST" id="editForm" enctype="multipart/form-data">
            <input type="hidden" class="id" name="id">
              <div class="modal-body row">              
                 
                  <div class="form-group  col-sm-6">
                      <label for="edit_name" class="col-sm-12 control-label">Name</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_name" name="name" required>
                      </div>
                  </div>
                  <div class="form-group  col-sm-6">
                      <label for="edit_slug" class="col-sm-12 control-label">Slug</label>
                      <div class="col-sm-12">
                        <input type="text" class="form-control" id="edit_slug" name="slug"  >
                      </div>
                  </div>
                  <div class="form-group col-sm-12">
                      <label for="edit_description" class="col-sm-12 control-label">Description</label>
                      <div class="col-sm-12">
                        <textarea class="form-control" id="edit_description" name="description"></textarea>
                      </div>
                  </div>                                                 
                  
                  <div class="form-group col-sm-12">
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
                  <div class="form-group col-sm-12">
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
                    <p>DELETE Blog Tag</p>
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


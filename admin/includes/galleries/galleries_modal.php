<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Gallery</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" id="addForm" enctype="multipart/form-data">
              <div class="form-group">
                    <label for="title" class="col-sm-3 control-label">Title</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description" class="col-sm-3 control-label">Description</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="description" name="description">
                    </div>
                </div>
                <div class="form-group">
                    <label for="alt" class="col-sm-3 control-label">Alt</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="alt" name="alt">
                    </div>
                </div>
                <div class="form-group">
                    <label for="photoadd" class="col-sm-3 control-label">Photo</label>
                    <div class="col-sm-9">
                      <input type="file" id="photoadd" name="photoadd">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <span class="msgadd"></span>
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
              </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit -->
<div class="modal fade" id="edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Edit Gallery</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" id="editForm">
                <input type="hidden" class="userid" name="id">
                <div class="form-group">
                    <label for="edit_title" class="col-sm-3 control-label">title</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_title" name="title" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_description" class="col-sm-3 control-label">Description</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_description" name="description">
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_alt" class="col-sm-3 control-label">Alt</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_alt" name="alt">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Status</label>
                    <div class="col-sm-9">
                      <div class="radio">
                        <label for="edit_status1">
                          <input type="radio" name="status" class="status" id="edit_status1" value="1">Yes
                        </label>
                      </div>
                      <div class="radio">
                        <label for="edit_status0">
                          <input type="radio" name="status" class="status" id="edit_status0" value="0">No
                        </label>
                      </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_photo" class="col-sm-3 control-label">Photo</label>
                    <div class="col-sm-9">
                      <input type="file" class="form-control" id="edit_photo" name="photo">
                      <input type="hidden" class="form-control" id="edit_photo_old" name="photo_old">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <span class="msgedit"></span>
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-success btn-flat" name="edit"><i class="fa fa-check-square-o"></i> Update</button>
              </form>
            </div>
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
                <input type="hidden" class="userid" name="id">
                <div class="text-center">
                    <p>DELETE Gallery</p>
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


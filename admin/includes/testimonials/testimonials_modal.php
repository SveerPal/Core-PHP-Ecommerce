<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Testimonial</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" id="addForm" enctype="multipart/form-data">
              <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">Name</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="designation" class="col-sm-3 control-label">Designation</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="designation" name="designation">
                    </div>
                </div>
                <div class="form-group">
                    <label for="company" class="col-sm-3 control-label">Company</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="company" name="company">
                    </div>
                </div>
                <div class="form-group">
                    <label for="message" class="col-sm-3 control-label">Message</label>
                    <div class="col-sm-9">
                      <textarea class="form-control" id="message" name="message"></textarea>
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
              <h4 class="modal-title"><b>Edit User</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" id="editForm">
                <input type="hidden" class="userid" name="id">
                <div class="form-group">
                    <label for="edit_name" class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_name" name="name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_designation" class="col-sm-3 control-label">Designation</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_designation" name="designation">
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_company" class="col-sm-3 control-label">Company</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_company" name="company">
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_message" class="col-sm-3 control-label">Message</label>
                    <div class="col-sm-9">
                      <textarea class="form-control" id="edit_message" name="message"></textarea>
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
                    <p>DELETE Testimonial</p>
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


<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Fabrics</b></h4>
            </div>
            <form class="form-horizontal" method="POST" id="addForm" enctype="multipart/form-data">
              <div class="modal-body">          
                  <div class="form-group">
                      <label for="name" class="col-sm-3 control-label">Name</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="name" name="name" required>
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
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Edit Fabric</b></h4>
            </div>

            <form class="form-horizontal" method="POST" id="editForm" enctype="multipart/form-data">
            <input type="hidden" class="id" name="id">
              <div class="modal-body">              
                  <div class="form-group">
                      <label for="edit_name" class="col-sm-3 control-label">Name</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="edit_name" name="name" required>
                      </div>
                  </div>                
                  <div class="form-group">
                    <label  class="col-sm-3 control-label">Status</label>
                    <div class="col-sm-9">
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
                    <p>DELETE Fabric</p>
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


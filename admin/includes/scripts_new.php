<!-- jQuery 3 -->
<!-- <script src="../bower_components/jquery/dist/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<!-- <script src="../bower_components/jquery-ui/jquery-ui.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js" ></script>
<!-- Bootstrap 3.3.7 -->
<!-- <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<!-- Select2 -->
<!-- <script src="../bower_components/select2/dist/js/select2.full.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- Moment JS -->
<!-- <script src="../bower_components/moment/moment.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<!-- DataTables -->
<!-- <script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script> -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<!-- <script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script> -->
<!-- ChartJS -->
<!-- <script src="../bower_components/chart.js/Chart.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
<!-- daterangepicker -->
<!-- <script src="../bower_components/moment/min/moment.min.js"></script> -->
<!-- <script src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/3.0.5/daterangepicker.min.js"></script>
<!-- datepicker -->
<!-- <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap time picker -->
<!-- <script src="../plugins/timepicker/bootstrap-timepicker.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js" ></script>
   
<!-- Slimscroll -->
<!-- <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<!-- <script src="../bower_components/fastclick/lib/fastclick.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fastclick/0.6.0/fastclick.min.js" ></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- CK Editor -->
<script src="../bower_components/ckeditor/ckeditor.js"></script>
<!-- Active Script -->
<script>
$(function(){
	/** add active class and stay opened when selected */
	var url = window.location;
  
	// for sidebar menu entirely but not cover treeview
	$('ul.sidebar-menu a').filter(function() {
	    return this.href == url;
	}).parent().addClass('active');

	// for treeview
	$('ul.treeview-menu a').filter(function() {
	    return this.href == url;
	}).parentsUntil(".sidebar-menu > .treeview-menu").addClass('active');

});
</script>
<!-- Data Table Initialize -->
<script>
  $(function () {
    $('#example1').DataTable({
      responsive: true
    })
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
<script>
  $(function(){
    //Initialize Select2 Elements
    $('.select2').select2()

    //CK Editor
    CKEDITOR.replace('editor1')
    CKEDITOR.replace('editor2')
  });
</script>



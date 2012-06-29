# datepicker for bootstrap 
$('.datepicker').datepicker()

# Product Sorting with datatable
jQuery ->
	$("#data-list").dataTable
		sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
		sPaginationType: "bootstrap"

# admin category modal box
$("#myModal").modal options
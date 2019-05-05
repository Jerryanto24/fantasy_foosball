$(document).ready(function () {
	
	// Jquery datatable using plugin (javascripts\admin\plugins\jquery.datatables.min)
  $('.datatables.table-action').DataTable({
    "pagingType": "full_numbers",
    "lengthMenu": [
      [10, 25, 50, -1],
      [10, 25, 50, "All"]
    ],
    responsive: true,
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Search records",
    },
    "columnDefs": [ {
      "targets": [ -1 ],
      "orderable": false
    } ]
  });

  $('.datatables.table-action.non-first-col-ordering').DataTable({
    destroy: true,
    "pagingType": "full_numbers",
    "lengthMenu": [
      [10, 25, 50, -1],
      [10, 25, 50, "All"]
    ],
    "order": [],
    responsive: true,
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Search records",
    },
    "columnDefs": [ {
      "targets": [ -1 ],
      "orderable": false
    }]
  });
	
});
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#areas-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#areas-table').data('source')
    pagingType: 'full_numbers'
    language: { "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"}
    columns: [
      {data: 'name'},
      {data: 'cost_center'},
      {data: 'show_employees', searchable: false, orderable: false},
      {data: 'show', searchable: false, orderable: false},
      {data: 'edit', searchable: false, orderable: false},
      {data: 'delete', searchable: false, orderable: false}
    ]
# pagingType is optional, if you want full pagination controls.
# Check dataTables documentation to learn more about
# available options.
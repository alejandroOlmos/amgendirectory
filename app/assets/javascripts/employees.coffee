# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#employees-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#employees-table').data('source')
    pagingType: 'full_numbers'
    language: { "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"}
    columns: [
      {data: 'name'},
      {data: 'username'},
      {data: 'staff_id'},
      {data: 'extension'},
      {data: 'cell_phone'},
      {data: 'email'},
      {data: 'area', searchable: true, orderable: true},
      {data: 'cost_center', searchable: true, orderable: true},
      {data: 'show', searchable: false, orderable: false},
      {data: 'edit', searchable: false, orderable: false},
      {data: 'delete', searchable: false, orderable: false}
    ]

$ ->
  $('#employees').dataTable
    processing: true
    serverSide: true
    ajax: $('#employees').data('source')
    pagingType: 'full_numbers'
    language: { "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"}
    columns: [
      {data: 'name'},
      {data: 'username'},
      {data: 'staff_id'},
      {data: 'extension'},
      {data: 'cell_phone'},
      {data: 'email'},
      {data: 'area', searchable: true, orderable: true},
      {data: 'cost_center', searchable: true, orderable: true},
    ]
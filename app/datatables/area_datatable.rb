class AreaDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :area_employees_path, :area_path, :edit_area_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name: { source: "Area.name", cond: :like },
      cost_center: { source: "Area.cost_center", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        cost_center: record.cost_center,
        show_employees: link_to('<i class="glyphicon glyphicon-user"></i>'.html_safe, area_employees_path(record), class:'btn btn-primary', "data-turbolinks" => "false"),
        show: link_to('<i class="glyphicon glyphicon-list-alt"></i>'.html_safe, area_path(record), class:'btn btn-primary'),
        edit: link_to('<i class="glyphicon glyphicon-pencil"></i>'.html_safe, edit_area_path(record), class: "btn btn-warning"),
        delete: link_to('<i class="glyphicon glyphicon-trash"></i>'.html_safe, area_path(record),
                        method: :delete,
                        data: { confirm: '¿Estas seguro de eliminar este registro?' },
                        class: "btn btn-danger")
      }
    end
  end

  private

  def get_raw_records
    Area.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end

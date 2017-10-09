class EmployeeDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :area_employee_path, :edit_area_employee_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
        name: { source: "Employee.name", cond: :like },
        username: { source: "Employee.username", cond: :like },
        staff_id: { source: "Employee.staff_id", cond: :like },
        extension: { source: "Employee.extension", cond: :like },
        cell_phone: { source: "Employee.cell_phone", cond: :like },
        email: { source: "Employee.email", cond: :like },
        area: { source: "Area.name", cond: :like },
        cost_center: { source: "Area.cost_center", type: :integer, cond: :like }
    }
  end

  def data
    records.map do |record|
      {
          name: record.name,
          username: record.username,
          staff_id: record.staff_id,
          extension: record.extension,
          cell_phone: record.cell_phone,
          email: record.email,
          area: record.area.name,
          cost_center: record.area.cost_center,
          show: link_to('<i class="glyphicon glyphicon-list-alt"></i>'.html_safe, area_employee_path(record.area, record), class:'btn btn-primary'),
          edit: link_to('<i class="glyphicon glyphicon-pencil"></i>'.html_safe, edit_area_employee_path(record.area, record), class: "btn btn-warning"),
          delete: link_to('<i class="glyphicon glyphicon-trash"></i>'.html_safe, area_employee_path(record.area, record),
                          method: :delete,
                          data: { confirm: '¿Estas seguro de eliminar este registro?' },
                          class: "btn btn-danger")
      }
    end
  end

  private

  def get_raw_records
    #@area = Area.find(params[:area_id])
    Employee.references(:area).joins(:area).where("areas.id = ?", params[:area_id])
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

class DirectoryDatatable < AjaxDatatablesRails::Base

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
      }
    end
  end

  private

  def get_raw_records
    Employee.references(:area).includes(:area)
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
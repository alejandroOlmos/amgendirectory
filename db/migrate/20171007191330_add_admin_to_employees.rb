class AddAdminToEmployees < ActiveRecord::Migration[5.1]

  def up
    add_column :employees, :admin, :boolean, default: false
  end

  def down
    remove_column :employees, :admin
  end

end

class AddIndexToEmployeesEmail < ActiveRecord::Migration[5.1]

  def up
    add_index :employees, :email, unique: true
  end

  def down
    remove_index :employees, :email
  end

end

class AddRememberDigestToEmployees < ActiveRecord::Migration[5.1]

  def up
    add_column :employees, :remember_digest, :string
  end

  def down
    remove_column :employees, :remember_digest
  end

end

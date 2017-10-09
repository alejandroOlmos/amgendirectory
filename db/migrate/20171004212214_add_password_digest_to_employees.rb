class AddPasswordDigestToEmployees < ActiveRecord::Migration[5.1]

  def up
    add_column :employees, :password_digest, :string
  end

  def down
    remove_column :employees, :password_digest
  end

end

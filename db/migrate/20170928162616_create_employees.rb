class CreateEmployees < ActiveRecord::Migration[5.1]

  def up
    create_table :employees do |t|
      t.string :name, :null => false
      t.string :username, :null => false
      t.integer :staff_id, :null => false
      t.string :cell_phone, :null => true
      t.string :extension, :null => true
      t.string :email, :null => false
      t.references :area, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :employees
  end

end

class CreateAreas < ActiveRecord::Migration[5.1]

  def up
    create_table :areas do |t|
      t.string :name, :null => false
      t.integer :cost_center, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :areas
  end

end

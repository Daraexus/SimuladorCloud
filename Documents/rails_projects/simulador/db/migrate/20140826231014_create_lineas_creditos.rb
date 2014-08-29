class CreateLineasCreditos < ActiveRecord::Migration
  def change
    create_table :lineas_creditos do |t|
      t.string :name
      t.float :annualRate
      t.integer :user_id

      t.timestamps
    end

    add_index :lineas_creditos, :user_id
  end
end

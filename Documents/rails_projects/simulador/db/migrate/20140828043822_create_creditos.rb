class CreateCreditos < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :cedula
      t.string :valorCredito
      t.integer :plazo
      t.integer :user_id
      t.integer :lineaCredito
      t.string :estado
      t.string :nivelRiesgo

      t.timestamps
    end
    add_index :credits, [:user_id, :lineaCredito]
  end
end

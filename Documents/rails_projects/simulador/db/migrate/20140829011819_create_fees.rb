class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :credit_id
      t.integer :numero_cuota
      t.string :pago_intereses
      t.string :amortizacion
      t.string :valor_cuota
      t.string :saldo_pendiente

      t.timestamps
    end
    add_index :fees, [:credit_id]
  end
end

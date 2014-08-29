class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	 rename_table :lineas_creditos, :lineas_credito
  end
end

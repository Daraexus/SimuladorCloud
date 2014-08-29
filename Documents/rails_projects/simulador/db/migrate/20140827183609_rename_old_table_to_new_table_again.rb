class RenameOldTableToNewTableAgain < ActiveRecord::Migration
  def change
  	 rename_table :lineas_credito, :credit_lines
  end
end

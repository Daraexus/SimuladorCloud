class ChangeColumnsToCredits < ActiveRecord::Migration
  def change
  	change_column :credits, :estado, :string, default: "En proceso"
  	change_column :credits, :nivelRiesgo, :string, default: "En proceso"
  end
end

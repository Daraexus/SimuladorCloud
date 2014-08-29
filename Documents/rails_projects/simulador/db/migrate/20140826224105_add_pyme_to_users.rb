class AddPymeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pyme, :string
  end
end

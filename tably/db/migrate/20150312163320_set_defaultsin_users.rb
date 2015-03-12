class SetDefaultsinUsers < ActiveRecord::Migration
  def change
  
  change_column :users, :f_name, :string, :null => false
  change_column :users, :l_name, :string, :null => false
  change_column :users, :email, :string, :null => false

  end
end

class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :session_token, :string
    add_column :users, :password_digest, :string, :null => false
  end
end

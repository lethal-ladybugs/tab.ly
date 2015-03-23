class UpdateBusinessModelToFitApi < ActiveRecord::Migration
  def change
  	remove_column :businesses, :zipcode
  	remove_column :businesses, :type
  	remove_column :businesses, :city

  	add_column :businesses, :address, :string
  	add_column :businesses, :fs_id, :string
  	add_column :businesses, :phone, :string
  	add_column :businesses, :photo, :string
  end
end

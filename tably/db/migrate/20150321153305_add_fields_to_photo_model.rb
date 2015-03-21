class AddFieldsToPhotoModel < ActiveRecord::Migration
  def change
  	add_column :photos, :url, :string
  	add_column :photos, :business_id, :string
  end
end

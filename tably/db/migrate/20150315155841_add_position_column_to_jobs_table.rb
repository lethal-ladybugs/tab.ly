class AddPositionColumnToJobsTable < ActiveRecord::Migration
  def change
  	add_column :jobs, :position, :string
  	remove_column :jobs, :status, :integer
  end
end

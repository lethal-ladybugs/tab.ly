class AddJobIdToJobsTable < ActiveRecord::Migration
  def change
  	add_column :jobs, :yelp_id, :string
  end
end

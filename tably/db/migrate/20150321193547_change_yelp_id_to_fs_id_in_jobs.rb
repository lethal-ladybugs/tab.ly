class ChangeYelpIdToFsIdInJobs < ActiveRecord::Migration
  def change
  	add_reference :jobs, :business, index:true

  	remove_column :jobs, :yelp_id
  end
end

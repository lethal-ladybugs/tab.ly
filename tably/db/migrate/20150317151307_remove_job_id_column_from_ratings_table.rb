class RemoveJobIdColumnFromRatingsTable < ActiveRecord::Migration
  def change
  	  	remove_column :ratings, :job_id, :integer
  end
end

class AddJobIdRemoveUserIdFromRatingsTable < ActiveRecord::Migration
  def change
  	remove_column :ratings, :user_id, :integer
  	add_column :ratings, :job_id, :integer
  end
end

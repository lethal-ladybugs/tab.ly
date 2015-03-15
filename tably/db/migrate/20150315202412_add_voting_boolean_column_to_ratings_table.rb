class AddVotingBooleanColumnToRatingsTable < ActiveRecord::Migration
  
  def change
  	add_column :ratings, :good, :boolean
  	remove_column :ratings, :number, :integer
  end

end

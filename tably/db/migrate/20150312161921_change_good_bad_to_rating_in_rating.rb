class ChangeGoodBadToRatingInRating < ActiveRecord::Migration
  def change
  	remove_column :ratings, :good
  	remove_column :ratings, :bad
  	add_column :ratings, :number , :integer
  end
end

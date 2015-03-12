class AddUSeridAndJobidToRating < ActiveRecord::Migration
  def change
  	add_reference :ratings, :job, index: true
  	add_reference :ratings, :user, index: true
  end
end
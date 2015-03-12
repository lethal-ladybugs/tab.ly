class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.boolean :good
    	t.boolean :bad
      t.timestamps null: false
    end
  end
end

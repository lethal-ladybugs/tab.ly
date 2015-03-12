class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string :name
    	t.integer :zipcode
    	t.string :type
    	t.string :city
    	t.string :type
      t.timestamps null: false
    end
  end
end

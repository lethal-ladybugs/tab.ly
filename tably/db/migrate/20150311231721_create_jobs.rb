class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.integer :user_id
  		enum position: [:bartender, :barista, :waiter, :host]
      t.timestamps null: false
    end
  end
end

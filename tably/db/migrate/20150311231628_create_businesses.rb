class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|

      t.timestamps null: false
    end
  end
end

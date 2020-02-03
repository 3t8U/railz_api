class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :features
      t.string :type
      t.string :img
      t.integer :avg_rating
      t.timestamps
    end
  end
end

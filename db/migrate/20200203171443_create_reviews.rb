class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.string :content
      t.integer :heat_lvl
      t.integer :user_id
      t.timestamps
    end
  end
end

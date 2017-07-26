class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :description
      t.integer :total_votes, null: false, default: 0
      t.belongs_to :bakery
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end

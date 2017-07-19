class CreateBakeries < ActiveRecord::Migration[5.1]
  def change
    create_table :bakeries do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :description
      t.string :img_url

      t.timestamps null: false
    end
  end
end

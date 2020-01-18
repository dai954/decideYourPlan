class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :link
      t.string :food
      t.integer :place_id
      t.timestamps
    end
  end
end

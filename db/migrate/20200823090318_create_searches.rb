class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :lunch_name
      t.text :lunch_text
      t.text :lunch_image
      t.string :lunch_address
      t.string :lunch_link
      t.string :dinner_name
      t.text :dinner_text
      t.text :dinner_image
      t.string :dinner_address
      t.string :dinner_link
      t.integer :section1
      t.integer :section2
      t.integer :section3
      t.integer :section4
      t.references :place, foreign_key: true
      t.references :subplace, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

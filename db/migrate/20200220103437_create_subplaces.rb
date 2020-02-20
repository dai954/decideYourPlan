class CreateSubplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :subplaces do |t|
      t.string :name
      t.integer :place_id
      t.string :address
      t.string :link
      t.text :image
      t.string :prefecture
      t.text :description

      t.timestamps
    end
  end
end

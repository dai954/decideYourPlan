class AddImageToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :image, :text
  end
end

class AddPrefectureToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :prefecture, :string
  end
end

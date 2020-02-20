class RemoveTelFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :tel, :string
  end
end

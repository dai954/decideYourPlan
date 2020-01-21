class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :place, :string
    add_column :posts, :restaurant, :string
    add_column :posts, :content, :text
  end
end

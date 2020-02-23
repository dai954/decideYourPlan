class RemoveRestaurantFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :restaurant, :string
  end
end

class RemoveColumnsFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :sauna_two, :integer
    remove_column :posts, :water_two, :integer
    remove_column :posts, :totonoi_two, :integer
    remove_column :posts, :sauna_three, :integer
    remove_column :posts, :water_three, :integer
    remove_column :posts, :totonoi_three, :integer
    remove_column :posts, :went_onsen_id, :integer
  end
end

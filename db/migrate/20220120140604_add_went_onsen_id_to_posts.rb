class AddWentOnsenIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :went_onsen_id, :integer
  end
end

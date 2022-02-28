class AddOnsenIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :onsen, foreign_key: true
  end
end

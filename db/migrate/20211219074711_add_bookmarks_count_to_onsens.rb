class AddBookmarksCountToOnsens < ActiveRecord::Migration[6.1]
  def change
    add_column :onsens, :bookmarks_count, :integer
  end
end

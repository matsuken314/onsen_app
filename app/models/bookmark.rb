class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :onsen, counter_cache: :bookmarks_count
  validates :user_id, presence: true, uniqueness: {
    scope: :onsen_id
  }
end

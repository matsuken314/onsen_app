class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :onsen, counter_cashe: :bookmarks_count
  validates :user_id, presence: true, uniqueness: {
    scope: :onsen_id
  }
end

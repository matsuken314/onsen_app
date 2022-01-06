class Onsen < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  belongs_to :user
end

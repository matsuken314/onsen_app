class Onsen < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def update_name_hiragana(force: false)
    rubyfuri = Rubyfuri::Client.new(ENV["YAHOO_JAPAN_DEVELOPER_CLIENT_ID"])
    update(name_hiragana: rubyfuri.furu(name))
  end
end

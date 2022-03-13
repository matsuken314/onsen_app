class Onsen < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  has_many :posts, dependent: :destroy

  def onsen_circle_data(post)
    relax_data = post.pluck(:sauna_one, :water_one, :totonoi_one, :id)
    return [{ sauna_one: 0, water_one: 0, totonoi_one: 0 }] if relax_data.empty?

    sauna_ave = post.average(:sauna_one).round(1)
    water_ave = post.average(:water_one).round(1)
    totonoi_ave = post.average(:totonoi_one).round(1)
    [sauna_ave, water_ave, totonoi_ave]
  end
end

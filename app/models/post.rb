class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  validates :sauna_one, presence: true
  validates :water_one, presence: true
  validates :totonoi_one, presence: true
  validates :totonoi_address, presence: true
  validates :memo, length: { maximum: 100 }

  def self.circle_data(user)
    relax_data = user.posts.pluck(:sauna_one, :water_one, :totonoi_one, :id)
    return [{ sauna_one: 0, water_one: 0, totonoi_one: 0 }] if relax_data.empty?

    sauna_ave = user.posts.average(:sauna_one)
    water_ave = user.posts.average(:water_one)
    totonoi_ave = user.posts.average(:totonoi_one)
    [sauna_ave, water_ave, totonoi_ave]
  end

  def self.only_totonoi_link(totonoi_address)
    totonoi_record = Onsen.where(name: totonoi_address)
    totonoi_record.id
  end

  def onsen_name_valid(totonoi_address)
    Onsen.where(name: totonoi_address).empty?
  end

  def return_onsen_id(onsen_name)
    onsen_data = Onsen.where(name: onsen_name).ids
    onsen_data.first.to_i
  end
end

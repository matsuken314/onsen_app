class Post < ApplicationRecord
  belongs_to :user
  validates :sauna_one, presence: true
  validates :water_one, presence: true
  validates :totonoi_one, presence: true
  validates :totonoi_address, presence: true
end

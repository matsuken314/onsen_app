class Post < ApplicationRecord
  belongs_to :user
  validates :sauna_one, presence: true
  validates :water_one, presence: true
  validates :totonoi_one, presence: true
  validates :totonoi_address, presence: true

  def self.chart_data(user)
    graphs = user.posts.order(date: :asc)
    return [{ date: Date.today, weight: nil }] if posts.empty?

    period = posts[0].date..posts[-1].date
  end
end

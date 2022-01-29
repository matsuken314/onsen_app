class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  attr_accessor :current_password

  has_many :posts, dependent: :destroy
  has_many :onsens, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_onsens, through: :bookmarks, source: :onsen
  mount_uploader :avatar, AvatarUploader

  def user
    User.find_by(id: user_id)
  end

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def bookmarked_by?(onsen_id)
    bookmarks.where(onsen_id: onsen_id).exists?
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end

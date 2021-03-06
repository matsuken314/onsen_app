class OnsensController < ApplicationController
  before_action :force_json, only: :search
  def index
    @onsens = Onsen.all.select(:name, :sauna_temperature, :water_temperature, :address, :image, :introduce,
                               :id).order("created_at DESC").page(params[:page]).per(12)
  end

  def new
    @onsen = Onsen.new
  end

  def create
    onsen = params.require(:onsen).permit(:name, :address, :introduce, :sauna_temperature, :water_temperature, :image)
    Onsen.create(onsen)
  end

  def show
    @onsen = Onsen.find_by(id: params[:id])
    @posts = Post.includes(:user).where(totonoi_address: @onsen.name).order("posts.created_at DESC")
    gon.Onsen_TotonoiData = @onsen.onsen_circle_data(@posts)
  end

  def update
    @onsen = Onsen.find_by(id: params[:id])
    onsen.update
  end

  def edit
    @onsen = Onsen.find_by(id: params[:id])
  end

  def search
    q = params[:q]
    @onsens = Onsen.where("name LIKE ? or name_hiragana LIKE ?", "%#{q}%", "%#{q}%").limit(5)
  end

  def destroy; end

  def guest_sign_in
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  private

  def force_json
    request.format = :json
  end
end

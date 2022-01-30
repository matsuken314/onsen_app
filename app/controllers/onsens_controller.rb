class OnsensController < ApplicationController
  before_action :move_to_index

  def index
    @onsens = Onsen.all.select(:name, :sauna_temperature, :water_temperature, :address, :image, :id).order("created_at DESC")
  end

  def new
    @onsen = Onsen.new
  end

  def create
    onsen = params.require(:onsen).permit(:name, :sauna_temperature, :water_temperature, :image)
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

  def destroy; end

  def guest_sign_in
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end

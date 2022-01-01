class OnsensController < ApplicationController
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
end

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
end

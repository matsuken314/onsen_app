class OnsensController < ApplicationController
  def index
    @onsens = Onsen.includes(:name,:sauna_temperature,:water_temperature,:image).order('created_at DESC')
  end

  def new
  @onsen = Onsen.new
  end

  def create
   onsen = params.require(:onsen).permit(:name,:sauna_temperature,:water_temperature,:image)
   Onsen.create(onsen)
  end

  def edit

  end
  def update
  
  end
end

class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @onsens = Onsen.all
    @posts = Post.all
  end
end

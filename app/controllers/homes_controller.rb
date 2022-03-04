class HomesController < ApplicationController
  def index
    @onsens = Onsen.order("id DESC").limit(6)
    @posts = Post.includes(:user).order("id DESC").limit(2)
  end
end

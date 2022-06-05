class HomesController < ApplicationController
  def index
    top_new_sauna = 6
    top_new_post = 3
    @onsens = Onsen.order("id DESC").limit(top_new_sauna)
    @posts = Post.includes(:user).order("id DESC").limit(top_new_post)
  end
end

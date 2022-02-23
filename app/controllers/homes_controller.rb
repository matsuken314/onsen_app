class HomesController < ApplicationController
  def index
    @onsens = Onsen.order("id DESC").limit(6)
    @posts = Post.all
  end
end

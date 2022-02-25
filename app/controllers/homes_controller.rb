class HomesController < ApplicationController
  def index
    @onsens = Onsen.order("id DESC").limit(6)
    @posts = Post.order("id DESC").limit(6)
  end
end

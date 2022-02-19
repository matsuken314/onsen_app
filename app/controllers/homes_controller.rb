class HomesController < ApplicationController
  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: %i[index]
  def index
    @onsens = Onsen.all
    @posts = Post.all
  end
end

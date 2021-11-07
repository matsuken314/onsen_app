class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:totonoi_address, :sauna_one, :water_one, :totonoi_one, :sauna_two, :water_two, :totonoi_two, :sauna_three, :water_three,
                                 :totonoi_three).merge(user_id: current_user.id)
  end
end

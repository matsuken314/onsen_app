class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit
  end
end

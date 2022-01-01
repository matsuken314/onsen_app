class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "にととのい記録を追加しました"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "ととのい記録に失敗しました"
    end
  end

  def edit; end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:totonoi_address, :sauna_one, :water_one, :totonoi_one, :sauna_two, :water_two, :totonoi_two, :sauna_three, :water_three,
                                 :totonoi_three).merge(user_id: current_user.id)
  end
end

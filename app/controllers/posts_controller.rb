class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :collect_user, only: [:edit, :update, :destroy]
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.onsen_name_valid(post_params[:totonoi_address])
      flash[:alert] = "掲載されている正しいサウナ施設名を入力してください"
      render :new
    elsif @post.save
      flash[:notice] = "サ活の記録を追加しました"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "サ活の記録に失敗しました"
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:totonoi_address, :sauna_one, :water_one, :totonoi_one, :memo).merge(user_id: current_user.id)
  end

  def collect_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to new_post_path unless @post
  end
end

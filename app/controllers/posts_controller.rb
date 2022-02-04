class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to user_path(current_user.id)
    else
      render action: :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:totonoi_address, :sauna_one, :water_one, :totonoi_one).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

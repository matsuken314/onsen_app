class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at desc")
    gon.Totonoi_data = @posts.circle_data(@user)
    unless @posts.empty?
      went_onsen = @user.posts.select("DISTINCT ON (onsen_id) onsen_id").order(:onsen_id, created_at: :desc)
      binding.pry
      @User_onsen_data = Onsen.find(went_onsen)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to controller: :users, action: :show
    else
      render :edit
    end
  end

  def bookmarks
    @user = User.find(params[:id])
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:onsen_id)
    @bookmark_onsens = Onsen.find(bookmarks)
    redirect_back(fallback_location: root_path) unless @user.id == current_user.id
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :self_introduction)
  end
end

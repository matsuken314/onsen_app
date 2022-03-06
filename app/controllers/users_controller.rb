class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    gon.Totonoi_data = @posts.circle_data(@user)

    @posts.each do |post|
      post.went_onsen_id = post.return_onsen_id(post.totonoi_address)
    end

    @went_onsen = @posts.distinct.pluck(:totonoi_address)
    @UserOnsen_data = []
    @went_onsen.find_all do |went|
      @UserOnsen_data.concat(Onsen.where(name: went)) if Onsen.exists?(name: went)
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

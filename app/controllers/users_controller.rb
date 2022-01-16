class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    gon.Totonoi_data = @posts.circle_data(@user)

    @went_onsen = @posts.distinct.pluck(:totonoi_address)
    @UserOnsen_data = []
    @went_onsen.each do |went|
      @UserOnsen_data.concat(Onsen.where(name: went)) if Onsen.where(name: went).exists?
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
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
